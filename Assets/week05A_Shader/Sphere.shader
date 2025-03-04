Shader "My/Sphere"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Red("Red",Range(0,1)) = 0
        _Green("Green",Range(0,1)) = 0
        _Blue("Blue",Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

      
        sampler2D _MainTex;
        float _Red;
        float _Green;
        float _Blue;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        fixed4 _Color;


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = float3(_Red, _Green, _Blue);//표면 색값
            o.Alpha = c.a;//투명도라능
        }
        ENDCG
    }
    FallBack "Diffuse"
}
