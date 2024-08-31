// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32539,y:32885,varname:node_4013,prsc:2|emission-8993-OUT,alpha-391-OUT;n:type:ShaderForge.SFN_Tex2d,id:5009,x:31479,y:32989,ptovrint:False,ptlb:node_8772,ptin:_node_8772,varname:node223,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fadfb17e364e96d4996a118a9348a490,ntxv:0,isnm:False|UVIN-3804-OUT;n:type:ShaderForge.SFN_Color,id:4779,x:31479,y:33161,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:_MainColor,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9847758,c3:0.0990566,c4:1;n:type:ShaderForge.SFN_TexCoord,id:16,x:31681,y:33747,varname:node_16,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:8101,x:31284,y:32777,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b16ba549ca82d694e80e4444b6284d19,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Set,id:2329,x:31876,y:33747,varname:UV,prsc:2|IN-16-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4969,x:31716,y:32970,varname:node_4969,prsc:2|A-5009-RGB,B-4779-RGB,C-1921-RGB;n:type:ShaderForge.SFN_Multiply,id:391,x:31769,y:33214,varname:node_391,prsc:2|A-5009-A,B-4779-A,C-1921-A,D-8291-A;n:type:ShaderForge.SFN_Set,id:5456,x:32210,y:32885,varname:MainTex,prsc:2|IN-6233-OUT;n:type:ShaderForge.SFN_VertexColor,id:1921,x:31479,y:33325,varname:node_1921,prsc:2;n:type:ShaderForge.SFN_Get,id:529,x:30982,y:33143,varname:node_529,prsc:2|IN-4094-OUT;n:type:ShaderForge.SFN_Get,id:8993,x:32296,y:33000,varname:node_8993,prsc:2|IN-5456-OUT;n:type:ShaderForge.SFN_Set,id:5296,x:31888,y:33878,varname:V,prsc:2|IN-16-V;n:type:ShaderForge.SFN_Slider,id:6903,x:30398,y:34596,ptovrint:False,ptlb:distortionVolume,ptin:_distortionVolume,varname:node_6903,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Slider,id:9572,x:30398,y:34849,ptovrint:False,ptlb:scroll_Speed,ptin:_scroll_Speed,varname:node_9572,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2,max:3;n:type:ShaderForge.SFN_Slider,id:2845,x:30904,y:34822,ptovrint:False,ptlb:timeScale,ptin:_timeScale,varname:node_2845,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Multiply,id:1029,x:31065,y:34330,varname:node_1029,prsc:2|A-2905-OUT,B-6903-OUT;n:type:ShaderForge.SFN_Multiply,id:1416,x:30815,y:34671,varname:node_1416,prsc:2|A-6243-T,B-9572-OUT;n:type:ShaderForge.SFN_Multiply,id:5825,x:31205,y:34509,varname:node_5825,prsc:2|A-9866-UVOUT,B-2845-OUT;n:type:ShaderForge.SFN_Get,id:9039,x:30794,y:34574,varname:node_9039,prsc:2|IN-2329-OUT;n:type:ShaderForge.SFN_Time,id:6243,x:30555,y:34691,varname:node_6243,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:2905,x:30571,y:34403,varname:node_2905,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8972-RGB;n:type:ShaderForge.SFN_Tex2d,id:8972,x:30375,y:34403,ptovrint:False,ptlb:DistortionTex,ptin:_DistortionTex,varname:node_8972,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4c3c6d5e710a31c4689777136d439792,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:9866,x:31008,y:34528,varname:node_9866,prsc:2,spu:1,spv:1|UVIN-9039-OUT,DIST-1416-OUT;n:type:ShaderForge.SFN_Add,id:7432,x:31314,y:34356,varname:node_7432,prsc:2|A-1029-OUT,B-5825-OUT;n:type:ShaderForge.SFN_Tex2d,id:8697,x:31490,y:34339,ptovrint:False,ptlb:Noise_Tex,ptin:_Noise_Tex,varname:node_8697,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4b4bfb38e03b5644cadb5a36c36bafe8,ntxv:0,isnm:False|UVIN-7432-OUT;n:type:ShaderForge.SFN_Set,id:4094,x:32053,y:34349,varname:Noise,prsc:2|IN-2496-OUT;n:type:ShaderForge.SFN_Set,id:8276,x:31888,y:33804,varname:U,prsc:2|IN-16-U;n:type:ShaderForge.SFN_ComponentMask,id:8113,x:31676,y:34339,varname:node_8113,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8697-R;n:type:ShaderForge.SFN_Get,id:7110,x:31676,y:34517,varname:node_7110,prsc:2|IN-2329-OUT;n:type:ShaderForge.SFN_Multiply,id:2496,x:31869,y:34349,varname:node_2496,prsc:2|A-8113-OUT,B-7110-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:3571,x:31177,y:33107,ptovrint:False,ptlb:DistortionEnable,ptin:_DistortionEnable,varname:node_3571,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-2121-OUT,B-529-OUT;n:type:ShaderForge.SFN_Get,id:2121,x:30982,y:33068,varname:node_2121,prsc:2|IN-2329-OUT;n:type:ShaderForge.SFN_Set,id:920,x:31323,y:33107,varname:DistortionSwitch,prsc:2|IN-3571-OUT;n:type:ShaderForge.SFN_Get,id:3804,x:31237,y:32989,varname:node_3804,prsc:2|IN-920-OUT;n:type:ShaderForge.SFN_ComponentMask,id:1569,x:31679,y:32777,varname:node_1569,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8291-RGB;n:type:ShaderForge.SFN_Clamp01,id:6233,x:32040,y:32885,varname:node_6233,prsc:2|IN-7265-OUT;n:type:ShaderForge.SFN_Tex2d,id:8291,x:31479,y:32777,varname:node_8291,prsc:2,tex:b16ba549ca82d694e80e4444b6284d19,ntxv:0,isnm:False|TEX-8101-TEX;n:type:ShaderForge.SFN_Multiply,id:7265,x:31869,y:32911,varname:node_7265,prsc:2|A-1569-OUT,B-4969-OUT;proporder:8101-4779-3571-8972-8697-9572-6903-2845-5009;pass:END;sub:END;*/

Shader "beyan/AdditiveFireTrailShader" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_MainColor ("MainColor", Color) = (1,0.9847758,0.0990566,1)
        [MaterialToggle] _DistortionEnable ("DistortionEnable", Float ) = 0
        _DistortionTex ("DistortionTex", 2D) = "white" {}
        _Noise_Tex ("Noise_Tex", 2D) = "white" {}
        _scroll_Speed ("scroll_Speed", Range(0, 3)) = 0.2
        _distortionVolume ("distortionVolume", Range(0, 1)) = 0.3
        _timeScale ("timeScale", Range(0, 1)) = 0.3
        _node_8772 ("node_8772", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _node_8772; uniform float4 _node_8772_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _DistortionTex; uniform float4 _DistortionTex_ST;
            uniform sampler2D _Noise_Tex; uniform float4 _Noise_Tex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _distortionVolume)
                UNITY_DEFINE_INSTANCED_PROP( float, _scroll_Speed)
                UNITY_DEFINE_INSTANCED_PROP( float, _timeScale)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _DistortionEnable)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_8291 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float2 UV = i.uv0;
                float4 _DistortionTex_var = tex2D(_DistortionTex,TRANSFORM_TEX(i.uv0, _DistortionTex));
                float _distortionVolume_var = UNITY_ACCESS_INSTANCED_PROP( Props, _distortionVolume );
                float4 node_6243 = _Time;
                float _scroll_Speed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _scroll_Speed );
                float _timeScale_var = UNITY_ACCESS_INSTANCED_PROP( Props, _timeScale );
                float2 node_7432 = ((_DistortionTex_var.rgb.r*_distortionVolume_var)+((UV+(node_6243.g*_scroll_Speed_var)*float2(1,1))*_timeScale_var));
                float4 _Noise_Tex_var = tex2D(_Noise_Tex,TRANSFORM_TEX(node_7432, _Noise_Tex));
                float2 Noise = (_Noise_Tex_var.r.r*UV);
                float2 _DistortionEnable_var = lerp( UV, Noise, UNITY_ACCESS_INSTANCED_PROP( Props, _DistortionEnable ) );
                float2 DistortionSwitch = _DistortionEnable_var;
                float2 node_3804 = DistortionSwitch;
                float4 _node_8772_var = tex2D(_node_8772,TRANSFORM_TEX(node_3804, _node_8772));
                float4 _MainColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainColor );
                float3 MainTex = saturate((node_8291.rgb.r*(_node_8772_var.rgb*_MainColor_var.rgb*i.vertexColor.rgb)));
                float3 emissive = MainTex;
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,(_node_8772_var.a*_MainColor_var.a*i.vertexColor.a*node_8291.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
