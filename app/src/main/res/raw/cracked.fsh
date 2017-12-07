//블루오렌지 복사 -> 파랑빛 오올블루 필터
precision mediump float;

uniform vec3                iResolution;
uniform float               iGlobalTime;
uniform sampler2D           iChannel0;
varying vec2                texCoord;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

vec2 uv = fragCoord.xy;

    vec3 tex = texture2D( iChannel0, uv ).rgb;
    float shade = dot(tex, vec3(0.8));

    vec3 col = mix(vec3(0.1, 0.2, 0.8) * (1.0-2.0*abs(shade-0.5)), vec3(0.3, 0.2, 0.8), 1.0-shade);

     fragColor = vec4(col,1.0);
}

void main() {
	mainImage(gl_FragColor, texCoord);
}

