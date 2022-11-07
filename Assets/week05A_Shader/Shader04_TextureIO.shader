Shader "My/SurfaceShader/TextureIO"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Red("Red",Range(0,1)) = 0
        _Green("Green",Range(0,1)) = 0
        _Blue("Blue",Range(0,1)) = 0// "black {}", "gray {}"
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        float _Red;
        float _Green;
        float _Blue;


        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = float3(_Red, _Green, _Blue);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
