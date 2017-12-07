//코난 필터
precision highp float;

uniform vec3                iResolution;
uniform float               iGlobalTime;
uniform sampler2D           iChannel0;
varying vec2                texCoord;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{	
	float stongth = 0.3;
	vec2 uv = fragCoord.xy;
	float waveu = sin((uv.y + iGlobalTime) * 20.0) * 0.5 * 0.05 * stongth;
	fragColor = texture2D(iChannel0, uv + vec2(waveu, 0));
}

void main() {

    if( (iResolution.x/2.0 - gl_FragCoord.x) * (iResolution.x/2.0 - gl_FragCoord.x) + (iResolution.y/2.0 - gl_FragCoord.y +250.0) * (iResolution.y/2.0 - gl_FragCoord.y + 250.0) < 80000.0)
            mainImage(gl_FragColor, texCoord*iResolution.xy);
    else
           gl_FragColor = gl_FragColor(new Vector4(0.0,0.0,0.0,1.0));

}