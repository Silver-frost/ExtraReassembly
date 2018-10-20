-- glsl shaders
-- #version 120
-- format is { COMMON_HEADER, VERTEX_SHADER, FRAGMENT_SHADER, TEXTURE_NAME }
-- implicit parameters:
-- attribute vec4 Position; (vertex position)
-- uniform mat4 Transform; (transformation matrix)
-- uniform sampler2D ShaderTex; (texture sampler for specified texture_name);
-- uniform vec2 ShaderTexRes; (widthxheight of texture_name)
-- uniform vec2 Resolution; (widthxheight of window in pixels)
-- uniform float ToPixels; (pixel_size / world_size, converts world sizes into (zoom invariant) pixels sizes)

{
	-- spaceship hulls
	ShaderIridescent = {
		"varying vec4 DestinationColor;"
		,
		"attribute vec4 SourceColor0, SourceColor1;
		attribute float TimeA;
		void main(void) {
			gl_Position = Transform * Position;
			ivec3 ColorRGB0 = ivec3(SourceColor0.rgb * 255.0 + 0.1);
			ivec3 ColorRGB1 = ivec3(SourceColor1.rgb * 255.0 + 0.1);
			float val = (ColorRGB0 == ivec3(16, 96, 207) && ColorRGB1 == ivec3(20, 118, 255))?0.5 * tan(0.4 * (Time + TimeA)):(0.5 + 0.5 * sin(0.5 * (Time + TimeA)));
			vec4 Color = mix(SourceColor0, SourceColor1, val);
			float k = smoothstep(-1.0, 1.0, Position.y * ((Transform[0][0] >= 0.0)?0.04:(-0.04)));
			DestinationColor = vec4(mix(1.0, 0.7 + 0.5 * k, abs(Transform[0][0])) * Color.rgb, Color.a);
		}",
		"void main(void) {
			gl_FragColor = DestinationColor;
		}"
	},

	-- draws projectiles, shields, lasers, etc
	ShaderColorLuma = {
		"varying vec4 DestinationColor;"
		,
		"attribute vec4 SourceColor;
		attribute float Luma;
		void main(void)
		{
			gl_Position = Transform * Position;
			DestinationColor = Luma * ((Position.z >= 1.0)?(0.6 * max(SourceColor * 1.07 - 0.07, 0.0)):SourceColor);
		}",
		"void main(void) {
			gl_FragColor = DestinationColor;
		}" 
	},
	
	ShaderBackground = {
		"varying vec2 pos_ws;"
		,
		"void main(void) {
			pos_ws = Position.xy;
			gl_Position = Transform * Position;
		}",
		"
		#include 'rotate.glsl'
		#include 'randnum.glsl'
		uniform sampler2D ShaderTex;
		uniform vec2 ShaderTexRes;
		uniform vec2 Resolution;
		void main(void) {
			const mat2x4 offset = mat2x4(vec4(0.7, 0.5, -0.5, 0.3), vec4(0.2, 0.3, 0.8, 0.0));
			const mat2x4 pic = mat2x4(vec4(0.25, 0.25, -0.25, -0.25), vec4(0.25, -0.25, 0.25, -0.25));
			//mat4 K = mat4(vec4(放大率), vec4(景深), vec4(密度), vec4(亮度));
			const mat4 K = mat4(vec4(0.04, 0.018, 0.012, 0.16), vec4(30.0, 36.0, 40.0, 24.0), vec4(2.7, 1.2, 1.4, 3), vec4(2.5, 3.0, 4.0, 4.8));
			vec4 Color = vec4(0.0);
			vec2 P = pos_ws / ShaderTexRes;
			vec2 position = gl_FragCoord.xy / max(Resolution.x, Resolution.y);
			for(int i = 0; i < 4; i++)
			{
				vec4 Col;
				vec2 uv = K[0][i] * rot(M_PI * rand(vec2(i, i+1))) * (P + K[1][i] * position) - vec2(offset[0][i], offset[1][i]);
				vec2 pos = mod(uv, vec2(K[2][i]));
				if(pos.x <= 1.0 && pos.y <= 1.0)
				{
					float T = 6.2831853 * fract(0.0001 * Time + rand(vec2(float(2*i) + 1.5, 1.8 * floor(uv.x / K[2][i]))));
					vec2 O = 0.5 * pos - 0.25;
					Col.rgb = K[3][i] * texture2D(ShaderTex, rot(T) * O + vec2(pic[0][i], pic[1][i])).rgb * max(0.25 - length(O), 0.0);
					Col.a = 0.6 * max(dot(Col.rgb, vec3(0.299, 0.587, 0.114)) - 0.01, 0.0);
				}
				else	Col = vec4(0.0);
				Color += Col;
			}
			gl_FragColor = clamp(Color, 0.0, 1.0);
		}",
		"./texture/galaxy.jpg"
	},

	-- draws stars
	ShaderStars = {
		"
		#include 'randnum.glsl'
		#include 'rotate.glsl'
		#include 'segment.glsl'
		varying vec4 DestinationColor;
		varying float nebula;
		varying mat3 seed;
		",
		"attribute vec4 SourceColor;
		attribute float Size;
		uniform   float ToPixels;
		//uniform float EyeZ;	//Invalid variable, whose value is always 0.0
		void main(void) {
			gl_Position = Transform * Position;
			float Dof = Position.z;
			int Codomain = int(Dof);
			DestinationColor = SourceColor * min(0.00005 * abs(Dof - 100.0) + 1.0, 2.0);
			float Radius = 1250.0 * Size / (210.0 / ToPixels - Position.z);
			if (Dof <= -8000 && length(vec2(Position.x + 20000, Position.y + 24000)) <= 9600 )
			{
				vec4 nebPosition = Position;
				float p = (step(rand(Position.y), 0.0) - 0.5) * (abs(rand(Position.x)) + 1.0);
				nebPosition.xy = rot(0.0075 * p * Time) * (Position.xy + vec2(20000, 24000)) - vec2(20000, 24000);
				if (mod(Codomain, 2) == 0)	//星云中的亮星
				{
					float num = SourceColor.r + SourceColor.g + SourceColor.b;
					seed[0] = vec3(rand(1.1 * num), rand(1.3 * num), random(0.75, 0.25, 1.5 * num));
					nebula = 3.5;
					Radius *= 4.5;
					DestinationColor.a = random(0.92, 0.08, Position.x);
				}
				else						//星云
				{
					seed[0][0] = rand(SourceColor.rgb);
					nebula = 4.5;
					Radius *= 92.0;
					DestinationColor *= 1.2*vec4(0.7, 0.4, 1.0, 1.0)*max(1.0-0.00005*distance(Position.xy,-vec2(20000,24000)),0.5);
				}
				gl_Position = Transform * nebPosition;
			}
			else
			{
				if (mod(Codomain, 17) == 0)
				{
					if(mod(Codomain, 13) == 0 && Dof <= -6000)
					{
						if(mod(Codomain, 12) == 0 && Dof <= -10000)	//超巨星
						{
							nebula = 8.5;
							DestinationColor = vec4(1.0, 0.4, 0.1, 1.0);
							Radius *= 72.0;
						}
						else						//巨星
						{
							nebula = 7.5;
							Radius *= 21.0;
							DestinationColor = vec4(min(DestinationColor.rgb * vec3(1.4, 1.1, 0.7), 1.0), 1.0);
						}
					}
					else							//亮星
					{
						float num = SourceColor.r + SourceColor.g + SourceColor.b;
						seed[0] = vec3(rand(1.1 * num), rand(1.3 * num), random(0.75, 0.25, 1.5 * num));
						nebula = 3.5;
						Radius *= 4.8;
						DestinationColor.a = random(0.92, 0.08, Position.x);
					}
				}
				else
				{
					if(mod(Codomain, 281) == 0 && Dof <= -10000)
					{
						float num = SourceColor.r + SourceColor.g + SourceColor.b;
						seed[0] = vec3(random(0.5, 0.5, 1.1 * num), 0.25 * rand(1.3 * num), random(0.45, 0.05, 1.5 * num));
						seed[1] = vec3(random(0.75, 0.25, 1.7 * num), 2.0 * step(rand(1.9 * num),0.0)-1.0, rand(2.1 * num));
						seed[2][0] = random(0.1, 0.05, 2.3 * num);
						nebula = (mod(Codomain, 2) == 0)?5.5:6.5;	//虫洞:黑洞
						Radius *= 52.0;
						DestinationColor = vec4(min(DestinationColor.rgb * vec3(0.6, 0.9, 1.2), 1.0), 1.0);
					}
					else
					{
						if(mod(Codomain, 113) == 0 && Dof <= -8000)
						{
							float num = SourceColor.r + SourceColor.g + SourceColor.b;
							if(mod(Codomain, 2) == 0)	//中子星
							{
								seed[0] = vec3(random(0.8, 0.2, 1.1 * num), abs(rand(1.3 * num)), (step(rand(1.5 * num),0.0)-0.5));
								seed[1] = vec3(random(1.0, 0.5, 1.7 * num), abs(rand(1.9 * num)), random(4.4, 0.8, 2.1 * num));
								nebula = 2.5;
								Radius *= 36.0;
							}
							else						//双星
							{
								seed[0] = vec3(2.0*step(rand(1.1*num),0.0)-1.0, random(0.75, 0.25, 1.3*num), 0.5*rand(1.5*num));
								seed[1] = vec3(random(0.75, 0.25, 1.7*num), 0.5*abs(rand(1.9*num)), random(0.1, 0.02, 2.1*num));
								seed[2] = vec3(random(0.35, 0.05, 2.3*num), random(0.35, 0.05, 2.5*num), random(0.45, 0.05, 2.7*num));
								nebula = 9.5;
								Radius *= 30.0;
								DestinationColor.rgb = min(DestinationColor.rgb * vec3(1.25, 0.8, 1.0), 1.0);
							}
						}
						else
						{
							if (mod(Codomain, 72) == 0 && Dof <= -6000)	//彗星
							{
								seed[0][0] = rand(Position.x);
								seed[0][1] = rand(Position.y);
								float light = fract(random(0.015, 0.005, Position.x + Position.y) * Time + rand(Position.z));
								gl_Position = Transform * vec4(Position.xy + 25000.0 * vec2(seed[0][0], seed[0][1]) * light, Position.zw);
								nebula = 1.5;
								Radius *= 20.0;
								DestinationColor = SourceColor * clamp(8.0 * light * (1.0 - light), 0.0, 1.0);
							}
							else				//普通星星
							{
								nebula = 0.5;
								Radius *= 1.5;
								DestinationColor.a = DestinationColor.a * random(0.92, 0.08, Position.x);
							}
						}
					}
				}
			}
			gl_PointSize = Radius;
		}",
		"
		#include 'mixCol.glsl'
		#include 'noise3D.glsl'
		#include 'simple3D.glsl'
		uniform sampler2D ShaderTex;
		void main(void) {
			const float PI_2 = 6.28318531;
			vec2 coord = 2.0 * (gl_PointCoord - 0.5);
			vec4 color = DestinationColor;
			if(nebula < 4.0)	//普通、彗星、中子、亮星
			{
				if(nebula < 2.0)
				{
					if(nebula < 1.0)	//普通
					{
						float R = (length(coord) + abs(coord.x) + abs(coord.y)) * 0.5;
						if (R > 1.0)	discard;
						else			color.a *= 1.0 - R;
					}
					else				//彗星
					{
						vec2 ori = normalize(vec2(seed[0][0], seed[0][1]));
						float light = d_seg(coord, 0.95 * vec2(-ori.x, ori.y), 0.95 * vec2(ori.x, -ori.y), 0.0);
						light = 20. * max(0.05 - light, 0.0) * length(vec2(-ori.x, ori.y) - coord);
						color = clamp(DestinationColor * light, 0.0, 1.0);
					}
				}
				else
				{
					if(nebula < 3.0)	//中子
					{
						color.a = 1.0;
						float R = length(coord), lev = 0.5;
						float cycle_1 = sin(seed[0][0] * Time + PI_2 * seed[0][1]);
						if(R < 0.1)	color *= (1.2 + 0.2 * cycle_1) * max(-18.0 * R + 2.5, 0.0) * lev;
						else
						{
							float light = max((1.7 + 0.1 * cycle_1) - 8.0 * R, 0.0);
							float sita = PI_2*fract(0.016 * seed[0][2] * seed[1][0] * Time + seed[1][1]);
							vec2 P = vec2(sin(sita), cos(sita));
							float line = seed[1][2] * length(coord - P * dot(coord, P)) / R;
							float frame = (1.6 + 0.4 * cycle_1) * smoothstep(1.0, 0.0, line) * max(1.0 - R, 0.0);
							color *= max(light, frame) * lev;
						}
						color = clamp(color, 0.0, 1.0);
					}
					else				//亮星
					{
						coord = rot(PI_2 * seed[0][0]) * coord;
						vec2 pos_s = abs(coord) - 1.0;
						float R0 = length(pos_s * pos_s), R1 = length(coord);
						float R2 = (R1 + abs(coord.x) + abs(coord.y)) * 0.5;
						if (R1 > 1.0)	discard;
						color = clamp(1.6 * color *  max(1.0 - R2, 0.0) * max(R0 - 0.7, 0.0) * (1.0 + 0.1 * sin(PI_2 * seed[0][1] + seed[0][2] * Time)), 0.0, 1.0);
					}
				}
			}
			else				//星云、虫黑洞、巨超巨、双星
			{
				if(nebula < 7.0)
				{
					if(nebula < 5.0)	//星云
					{
						float aval, R = length(coord);
						if (R >= 1.0)	discard;
						float light = aval = 1.0 - R;
						vec2 C = 0.036 * rot(PI_2 * seed[0][0]) * gl_PointCoord + 0.0001 * Time + 20.0 * seed[0][0];
						float k = texture2D(ShaderTex,C).r+0.5*texture2D(ShaderTex,2.0*C).r+0.25*texture2D(ShaderTex,4.0*C).r+0.125*texture2D(ShaderTex,8.0*C).r;
						light = light * 0.4 + random(0.6, 0.2, seed[0][0]) * k;
						color = clamp(0.9 * color * light * min(aval, 0.8), 0.0, 1.0);
					}
					else
					{
						float light, q, R, con = 0.5 + 0.1 * seed[1][2], drk = 0.0;
						mat2 par;
						vec4 color_l = vec4(0.0);
						coord = rot(PI_2 * seed[0][1]) * (-coord) * vec2(1.0, 1.0 + seed[0][0]) + vec2(0.0, 1.37 * seed[0][0]);
						q = seed[0][0] / 3.0;
						for(int i = 0; i < 3; i++)	coord.y -= q * length(coord);
						R = length(coord);
						if (R > 1.0)	discard;
						if(nebula < 6.0)	//虫洞
						{
							float line = length(coord - vec2(0.0,1.0) * dot(coord, vec2(0.0,1.0))) / (R + 0.001);
							float frame = smoothstep(1.0,0.0,(0.5+0.5*seed[0][0])*(5.5-0.5*coord.y)*line)*max(1.0-R/sqrt(seed[0][0]),0.0)*(1.0+0.3*coord.y*(seed[0][0]+1.0))*(0.7+0.3*sin(1.5*Time-20.0*R));
							color_l = clamp(DestinationColor * frame, 0.0, 1.0);
							par = mat2(vec2(min(0.2*seed[0][2]/(R+0.00001),3.0), 0.0), vec2(0.9, 4.0*seed[2][0]*R));
							drk = min(par[0][0], 0.05);
						}
						else				//黑洞
						{
							con += 0.3;
							par = mat2(vec2(0.0, 0.6), vec2(0.6, seed[2][0]*R*R+0.2*R));
						}
						float spd = 0.04 * seed[1][0] * Time;
						float aval = smoothstep(0.0, 1.0, R / seed[0][2]) * smoothstep(0.0, 1.0, (1.0 - R) / (1.0 - seed[0][2]))* (1.1 - 0.6 * coord.y * seed[0][0]) + par[0][0] - drk;
						light = fbm_f(par[0][1]+par[1][0]*aval,con,5.0,2.0,vec3(rot(seed[1][1]*PI_2*(par[1][1]+0.2/R+fract(0.4*spd))) * coord,-1.0*R*R+2.0*R+spd)+DestinationColor.rgb);
						color = clamp(0.42 * color * light * aval + color_l, 0.0, 1.0);
					}
				}
				else
				{
					if(nebula < 9.0)	//巨超巨
					{
						mat3 par;
						float R = length(coord);
						if (R >= 1.0)	discard;
						if (nebula < 8.0)	par = mat3(vec3(0.4, 4.0, 0.1), vec3(1.35, 0.27, 20.0), vec3(1.6, 1.6, 0.82));
						else				par = mat3(vec3(1.0, 5.0, 0.2), vec3(1.8, 0.25, 30.0), vec3(2.4, 1.4, 0.95));
						if(R < 0.5)
						{
							color.rgb *= 0.6 * pow(2.0 * R, 8.0) + par[0][0];
							vec3 nosCoord = par[0][1] * vec3(coord, sqrt(0.25 - R * R)) + 0.08 * Time;
							float star = fbm_s(par[0][2], nosCoord + DestinationColor.rgb);	
							color = clamp(vec4(color.rgb + star, color.a), 0.0, 1.0);
						}
						else
						{
							vec3 p_Coord = 5.0 * DestinationColor.rgb + vec3(atan(coord.x,coord.y) / PI_2, par[1][1] * R - 0.01 * Time, 0.01 * Time);
							float frame = fbm_f(par[1][0], 0.75, par[1][2], 1.0, p_Coord);
							color = clamp(color * par[2][0] * (1.0 - R) * frame * smoothstep(0.0, 1.0, par[2][1] * (1.0 - R)), 0.0, 1.0) * vec4(vec3(1.0), par[2][2]);
						}
					}
					else				//双星
					{
						vec4 col_star[2] = vec4[2](vec4(0.0), vec4(0.0));
						float D[2], s_sita[2];
						float rotspd = 0.012 * seed[0][0] * seed[0][1] * Time + seed[0][2];
						float revspd = 0.007 * seed[0][0] * seed[1][0] * Time;
						bool core[2] = bool[2](false, false), frame[2] = bool[2](false, false);
						vec4 star[2] = vec4[2](vec4(DestinationColor.rgb, 1.0), vec4(0.5+0.5*rand(DestinationColor.r), 0.5+0.5*rand(DestinationColor.g), 0.5+0.5*rand(DestinationColor.b), 1.0));
						float R[2] = float[2](seed[2][0], seed[2][1]);
						D[0] = seed[2][2];
						D[1] = R[0] * D[0] / R[1];
						for(int i = 0; i < 2; i++)
						{
							float sita = PI_2 * fract(rotspd + 0.5 * float(i));
							s_sita[i] = sin(sita);
							vec2 path = D[i] * vec2(cos(sita), s_sita[i]) * vec2(1.0, seed[1][1]);
							path = rot(PI_2 * fract(revspd)) * path;
							vec2 sCoord = (coord - path) / R[i];
							float dR = length(sCoord);
							if(dR < 0.5)
							{
								frame[i] = core[i] = true;
								col_star[i].rgb = star[i].rgb * (0.6 * pow(2.0 * dR, 8.0) + 0.4);
								vec3 n_Coord = 5.0 * star[i].rgb + 4.0 * vec3(sCoord, sqrt(0.25 - dR * dR)) + 0.08 * Time;
								float light = fbm_s(seed[1][2], n_Coord);
								col_star[i] = clamp(vec4(0.9 * col_star[i].rgb + light, star[i].a), 0.0, 1.0);
							}
							else if(dR < 1.0)
							{
								frame[i] = true;
								vec3 p_Coord = 5.0 * star[i].rgb + vec3(atan(sCoord.x,sCoord.y) / PI_2, 0.25 * dR - 0.01 * Time, 0.01 * Time);
								float light = fbm_f(1.35, 0.75, 20.0, 1.0, p_Coord);
								col_star[i] = clamp(star[i] * 1.5 * (1.0 - dR) * light * smoothstep(0.0, 1.0, 1.6 * (1.0 - dR)), 0.0, 1.0) * vec4(vec3(1.0), 0.75);
							}
						}
						if(s_sita[0] > s_sita[1])	color = (frame[0] && frame[1])?((core[0])?col_star[0]:MixRGBA(col_star[0], col_star[1])):(col_star[0] + col_star[1]);
						else						color = (frame[0] && frame[1])?((core[1])?col_star[1]:MixRGBA(col_star[1], col_star[0])):(col_star[0] + col_star[1]);
						color = clamp(color, 0.0, 1.0);
					}
				}
			}
			gl_FragColor = color;
		}"
		"./texture/2Dnoise.jpg"
	},

	-- draws the wormhole
	ShaderWormhole = {
		"varying vec4 DestColor0, DestColor1;
		varying vec2 DestTex;",
		"
		attribute vec2 TexCoord;
		void main(void) {
			DestColor0 = vec4(0.2, 1.0, 0.4, 1.0);
			DestColor1 = vec4(0.1, 0.3, 1.0, 0.0);
			DestTex = TexCoord;
			gl_Position = Transform * Position;
		}",
		"
		#include 'simple3D.glsl'
		#include 'rotate.glsl'
		void main(void) {
			const float PI_2 = 6.28318531;
			float aval, r = length(DestTex);
			vec4 color = mix(DestColor0, DestColor1, sqrt(r));
			aval = (r < 0.05)?(0.01/(r+0.00001)):(smoothstep(0.0, 1.0, r / 0.25) * smoothstep(0.0, 1.0, (1.0 - r) / (1.0 - 0.25)));
			float light = fbm_f(0.5+0.5*aval, 0.5, 5.0, 2.0, vec3(rot(PI_2*(0.1*r*r+0.6*r+0.5/r +fract(0.01*Time))) * DestTex, 2.0*sqrt(r)+fract(0.05*Time)));
			gl_FragColor = vec4(clamp(color.rgb * aval * light, 0.0, 1.0), 0.0);
		}"
	},

	-- draws resource packets (R)
	ShaderResource = {
		"varying vec4 DestColor0, DestColor1;
		varying vec2 DestPos;
		varying float DestRad;"
		,
		"attribute vec4 SourceColor0, SourceColor1;
		attribute float Radius;
		uniform float ToPixels;
		void main(void) {
			DestColor0 = SourceColor0;
			DestColor1 = SourceColor1;
			DestPos = Position.xy * 0.005;
			DestRad = sqrt(Radius) * 0.5;
			gl_Position = Transform * Position;
			gl_PointSize = 1.5 * ToPixels * Radius;
		}",
		"
		#include 'noise2D.glsl'
		#include 'rotate.glsl'
		void main(void) {
			vec2 coord = 2.0 * gl_PointCoord.xy - 1.0;
			float R = dot(coord, coord);
			if (R > 1.0)	discard;
			vec2 pos = rot(DestRad + 2.5 * R - 0.2 * Time) * coord + 0.1 * Time + DestPos;
			float val = snoise(pos) + 0.5 * snoise(2.0*pos);
			gl_FragColor = mix(DestColor0, DestColor1, 0.5 + 0.5 * sin(M_PI * val)) * (1.0 - R);
		}"
	},

	-- used for nice gradient backgrounds
	ShaderColorDither = {
		"varying vec4 DestinationColor;",
		"
		attribute vec4 SourceColor;
		void main(void) {
			DestinationColor = SourceColor * vec4(vec3(1.0), 0.6);
			gl_Position = Transform * Position;
		}",
		"
		uniform sampler2D dithertex, ShaderTex;
		uniform vec2 Resolution, ShaderTexRes;
		void main(void)
		{
			float ditherv = 0.015625 * (texture2D(dithertex, gl_FragCoord.xy).r - 0.5);
			vec2 TexCoord = gl_FragCoord.xy / Resolution.y * vec2(ShaderTexRes.y / ShaderTexRes.x, 1.0) + vec2(fract(0.001 * Time), 0.0);
			vec3 C = texture2D(ShaderTex, TexCoord).rgb;
			vec4 Col = vec4(C, max(dot(C, vec3(0.299, 0.587, 0.114)) - 0.01, 0.0));
			Col *= max(1.0 - length(2.0 * gl_FragCoord.xy / Resolution - 1.0), 0.0);
			gl_FragColor = clamp(DestinationColor * (1.0 + 2.0 * Col) + vec4(ditherv), 0.0, 1.0);
		}"
		"./texture/border.jpg"
	},

	-- passthrough texture shader - used in many places for drawing render targets
	ShaderTexture = {
		"varying vec2 DestTexCoord;
		varying vec4 DestColor;"
		,
		"attribute vec2 SourceTexCoord;
		uniform vec4 SourceColor;
		void main(void) {
			DestTexCoord = SourceTexCoord;
			DestColor    = SourceColor;
			gl_Position  = Transform * Position;
		}"
		,
		"uniform sampler2D texture1;
		void main(void) {
			gl_FragColor = DestColor * texture2D(texture1, DestTexCoord);
		}"
	},

	-- HDR postprocessing. makes really bright areas (i.e. with a lot of particles) more white to make them look brighter
	ShaderTonemap = {
		"varying vec2 DestTexCoord;"
		,
		"attribute vec2 SourceTexCoord;
		void main(void) {
			DestTexCoord = SourceTexCoord;
			gl_Position  = Transform * Position;
		}"
		,
		"uniform sampler2D texture1,dithertex;
		void main(void) {
			vec2 texCoord = DestTexCoord;
			vec4 color = texture2D(texture1, texCoord);
			float mx = dot(color.rgb, vec3(0.299, 0.587, 0.114));
			if (mx > 1.0)	color.rgb += vec3(log(mx));
			#if DITHER
				float ditherv = (texture2D(dithertex, gl_FragCoord.xy * 0.125).r - 1.0) / 128.0;
				color += vec4(ditherv);
			#endif
			gl_FragColor = clamp(color, 0.0, 1.0);
		}"
	},

	-- used to desaturate greyed out blocks on the databank.
	ShaderTextureHSV = {
		"varying vec2 DestTexCoord;
		varying vec4 DestColor;"
		,
		"attribute vec2 SourceTexCoord;
		uniform vec4 SourceColor;
		void main(void) {
			DestTexCoord = SourceTexCoord;
			DestColor    = SourceColor;
			gl_Position  = Transform * Position;
		}"
		,
		"uniform sampler2D texture1;
		#include 'hsv_rgb.glsl'
		void main(void) {
			vec4 tcolor = texture2D(texture1, DestTexCoord);
			float k = 0.2 * ((tcolor.a == 0.0)?step(0.5, fract(0.04 * (gl_FragCoord.x - gl_FragCoord.y))):0.0);
			gl_FragColor = vec4(k + hsv2rgb(DestColor.rgb * rgb2hsv(tcolor.rgb)), DestColor.a * tcolor.a);
		}"
	},

	-- used for particles (GL_POINTS)
	ShaderParticlePoints = {
		"
		#include 'randnum.glsl'
		varying vec4 DestinationColor;
		varying float Sides, v, ang;
		varying vec2 Coord, nosC;
		#if USE_TRIS
			varying float dRt;
		#endif",
		"
		attribute float StartTime, EndTime;
		attribute vec3  Offset, Velocity;
		attribute vec4  Color;
		uniform   float CurrentTime, ToPixels;
		void main(void) {
		if (CurrentTime >= EndTime)
		{
			gl_Position = vec4(0.0, 0.0, -99999999.0, 1);
			return;
		}
		float k[5], dC = 1.0;
		float deltaT = CurrentTime - StartTime;
		float ExistTime = EndTime - StartTime;
		v = deltaT / ExistTime;
		float flip_sV = 1.0 - v * v;
		nosC = Position.xy;
		vec4 color = Color;
		#if USE_TRIS
			float size = Offset.z;
			Sides = Offset.z;
			Coord = Offset.xy;
		#else
			float size = Offset.x;
			Sides = Offset.x;
			Coord = Position.xy;
		#endif
		if (Color.a <= 0.1)
		{
			if (Position.z == 0.5)
			{
				if (Sides >= 200.0) //核心爆炸闪光
				{
					k = float[5](0.8, 1.5, 1.2, 1.0, 0.0);
				}
				else //飞溅火焰(快)
				{
					k = float[5](0.6, 2.0, 5.0, 1.25, 1.25);
					color = (1.0 - v) * vec4(1.2 * Color.rgb, 0.2);
				}
			}
			else
			{
				if (ExistTime >= 2.1) //外焰
				{
					k = float[5](0.6, 2.1, 4.0, 1.167, 0.067);
					dC -= min(0.01 * Offset.x, 0.4);
					color *= flip_sV;
				}
				else //内焰、[火炮开火光晕、激光开火光晕、火炮充能光晕、激光充能光晕、导弹发射光晕、爆炸炮弹尾焰、炮弹末端微粒、充能释放光晕、治愈激光光晕、方块删除闪光]
				{
					k = float[5](0.6, 2.4, 4.0, 1.333, 1.333);
					dC = 0.6 * (1.0 - min(0.02 * Offset.x, 0.5));
				}
			}
		}
		else
		{
			if (Color.a == 1.0)
			{
				if (ExistTime >= 3.0) //残血烟雾
				{
					k = float[5](0.8, 2.0, 4.0, 1.333, 1.333);
					color.a = 1.0 - sqrt(v);
				}
				else //飞溅火焰(慢)
				{
					k = float[5](0.6, 2.0, 5.0, 1.25, 1.25);
					color = (1.0 - v) * vec4(1.2 * Color.rgb, 0.25);
				}
			}
			else
			{
				#if USE_TRIS
					if (Color.a == 0.2)	//爆炸, 在非USE_TRIS中可替换为 if (Offset.y >= 10.0)
				#else
					if (Offset.y > 0.0)
				#endif
				{
					k = float[5](0.8, 4.0, 5.0, 1.0, 0.0);
					Sides *= -1.0;
					ang = rand(2.7 * Color.rgb);
					#if USE_TRIS
						Coord.y -= 10;
					#endif
				}
				else //[治愈溅射粒子、爆炸激光光晕、破盾粒子、残血飞溅烟雾(快)、残血飞溅烟雾(慢)、命中溅射烟雾、核心爆炸烟雾、空间跳跃闪光]
				{
					k = float[5](0.8, 2.0, 8.0, 1.143, 1.143);
					size = (size < 100.0)?size:min(100.0 + log(size - 99.0), 800.0);
					color *= 0.5;
				}
			}
		}
		DestinationColor = flip_sV * dC * color;
		vec3 position = Position.xyz + deltaT * pow(k[0], deltaT) * Velocity;
		float dR = smoothstep(0.0, 1.0, min(k[2] * v, k[3] - k[4] * v));
		#if USE_TRIS
			dRt = dR;
			position.xy += k[1] * (Coord - 0.5) * size;
		#else
			gl_PointSize = k[1] * dR * ToPixels * size;
		#endif
		gl_Position = Transform * vec4(position, 1.0);
		}",
		"
		#include 'noise2D.glsl'
		#include 'rotate.glsl'
		uniform sampler2D ShaderTex;
		void main(void)
		{
			const mat2x4 pic = mat2x4(vec4(0.25, 0.25, -0.25, -0.25), vec4(0.25, -0.25, 0.25, -0.25));
			#if USE_TRIS
				vec2 Pos = Coord - 0.5;
				float dR = dRt;
			#else
				vec2 Pos = gl_PointCoord - 0.5;
				float dR = 1.0;
			#endif
			float R = 2.0 * length(Pos) / dR;
			if (R > 1.0)	discard;
			vec4 color = DestinationColor;
			float light = smoothstep(1.0, 0.0, R);
			if (Sides < 0.0)	//爆炸, i[0]为中心纹理, i[1]为纹理亮度, i[2]为冲击波亮度, i[3]为光晕亮度
			{
				float i[4];
				if (Sides >= -70.0)
				{
					if (Sides >= - 30.0)	i = float[4](2.0, 1.6, 0.4, 0.6);
					else	i = float[4](0.0, 1.25, 0.7, 1.0);
				}
				else
				{
					if (Sides >= -200.0)
					{
						if (Sides == -80.1 || Sides == -120.1 || Sides == -160.1)	color.rgb *= vec3(0.5, 2.0, 8.0);
						i = float[4](1.0, 1.4, 0.8, 1.0);
					}
					else	i = float[4](3.0, 2.0, 1.0, 1.2);
				}
				vec2 P = rot(M_PI * ang) * (0.75 * Pos / (dR * smoothstep(0.0, 0.95, 0.5 + 0.5 * v)));
				vec2 nosCoord = 3.0 * (R + 0.8) * Pos;
				float k = i[1] * dot(vec3(0.299, 0.587, 0.114), texture2D(ShaderTex, clamp(P, -0.25, 0.25) + vec2(pic[0][int(i[0])], pic[1][int(i[0])])).rgb);
				k += i[2] * smoothstep(0.0, 1.0 - 0.5 * v, min(4.0 * R + 1.0 - 4.5 * v, -4.0 * R + 1.0 + 3.5 * v)) * max(1.0 + 3.0 * fbm_snoise(0.196 * R + 0.128, nosCoord, nosC + 0.25 * Time), 0.0);
				k += i[3] * smoothstep(0.0, 1.0, 1.0 - 1.5625 * v);
				color *= k * clamp(1.0 - 0.00025 * Sides, 1.0, 1.25);
			}
			gl_FragColor = clamp(color * light, 0.0, 1.0);
		}"
		"./texture/explosion.jpg"
	},
}