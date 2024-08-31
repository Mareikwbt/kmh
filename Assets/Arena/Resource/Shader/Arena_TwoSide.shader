Shader "Arena/Arena_TwoSide"
{
    Properties
    {
        [Header(UV)] [Space(10)]
        _UVScale("UV Scale",float) = 1
        _UVOffsetX("UV OffsetX",float) = 0
        _UVOffsetY("UV OffsetY",float) = 0
        [Space(20)]

        [Header(Parameters)][Space(10)]
        _ColorTint("ColorTint",Color) = (1,1,1,1)
        _MetallicValue("MetallicValue",Range(0,1)) = 0
        _RoughnessValue("RoughnessValue",Range(0,1)) = 0.8
        _RoughnessMapAjustment("RoguhnessMapAjustment",float) = 0
        _NormalMapIntensity("NormalMapIntensity",Range(0,1)) = 1
        [Space(20)]

        [Header(Base Maps)][Space(10)]
        [NoScaleOffset]_BasecolorMap("BasecolorMap",2D) = "white"{}
        [NoScaleOffset]_MetallicMap("MetallicMap",2D) = "black"{}
        [NoScaleOffset]_RoughenessMap("RoughnessMap",2D) = "white"{}
        [NoScaleOffset]_NormalMap("NormalMap",2D) = "bump"{}
        [Space(20)]

        [Header(StaticParameters)][Space(10)]
        [KeywordEnum(TEXTUTR,VALUE)]_MetallicSource("metallicSource",float) = 1
        [KeywordEnum(TEXTUTR,VALUE)]_RoughnessSource("RoughnessSource",float) = 0
    }
        SubShader
        {
            Tags { "RenderType" = "Opaque" }
            LOD 200

            Cull Off

            CGPROGRAM

            #pragma surface surf Standard fullforwardshadows
            #pragma target 3.0

            #pragma shader_feature _METALLICSOURCE_TEXTURE _METALLICSOURCE_VALUE 
            #pragma shader_feature _ROUGHNESSSOURCE_TEXTURE _ROUGHNESSSOURCE_VALUE 

            

            float _UVScale;
            float _UVOffsetX;
            float _UVOffsetY;

            fixed4 _ColorTint;
            half _MetallicValue;
            half _RoughnessValue;
            half _RoughnessMapAjustment;
            half _NormalMapIntensity;

            sampler2D _BasecolorMap;
            sampler2D _MetallicMap;
            sampler2D _RoughnessMap;
            sampler2D _NormalMap;



            struct Input
            {
                float2 uv_BasecolorMap;
            };



            void surf(Input IN, inout SurfaceOutputStandard o)
            {
                float2 uv = IN.uv_BasecolorMap;
                uv += float2(_UVOffsetX, _UVOffsetY);
                uv *= _UVScale;


                fixed4 color = tex2D(_BasecolorMap, uv);

                #ifdef _METALLICSOURCE_TEXTURE
                    half metallic = tex2D(_MetallicMap, uv);
                #elif _METALLICSOURCE_VALUE
                    half metallic = _MetallicValue;
                #endif

                #ifdef _ROUGHNESSSOURCE_TEXTURE
                    half roughness = tex2D(_RoughnessMap, uv);
                    roughness += _RoughnessMapAjustment;
                #elif _ROUGHNESSSOURCE_VALUE
                    half roughness = _RoughnessValue;
                #endif

                half3 normal = UnpackNormal(tex2D(_NormalMap,uv));
                normal = lerp(half3(0, 0, 1), normal, _NormalMapIntensity);

                o.Albedo = color * _ColorTint;
                o.Metallic = metallic;
                o.Smoothness = 1 - roughness;
                o.Normal = normal;
            }
            ENDCG
        }
            FallBack "Diffuse"
}