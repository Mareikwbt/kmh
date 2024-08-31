// Created By gatosyocora

Shader "Leopard/MadoSightJack"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)] _Cull("Cull", Float) = 2 // Back
		_MainTex ("Front Texture", 2D) = "white" {}
		_BackTex ("Back Texture", 2D) = "white" {}
		_Scale ("Scale", Range(0.0, 10.0)) = 1.0
		_OffsetX ("OffsetX", Range(-1.0, 1.0)) = 0.0
		_OffsetY ("OffsetY", Range(-1.0, 1.0)) = 0.0
		_Dist ("Cling Distance", Float) = 0.0
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "DisableBatching"="True" "IgnoreProjector" = "True"}
		LOD 100
		Blend SrcAlpha OneMinusSrcAlpha
		Cull [_Cull]

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma shader_feature EDITING_ON
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;

			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _BackTex;
			float _Scale;
			float _OffsetX;
			float _OffsetY;
			float _Dist;
			float _VRChatCameraMode;
			
			v2f vert (appdata v)
			{
				v2f o;

				o.uv = TRANSFORM_TEX(v.uv, _MainTex);

				// カメラとの距離を調べる
				float4 objPos = mul(unity_ObjectToWorld, float4(0,0,0,1)); // オブジェクトの座標
				float4 camPos = float4(_WorldSpaceCameraPos, 1); // カメラの座標
				float dist = distance(objPos, camPos); // カメラとオブジェクトとの距離

				// _Distより近くてVRカメラだったら貼りつく
				if (abs(_VRChatCameraMode - 1) < 0.5)
				{

					// オブジェクトのスケール
					float sX = sqrt(pow(unity_WorldToObject[0].x, 2) + pow(unity_WorldToObject[0].y, 2) + pow(unity_WorldToObject[0].z, 2));
					float sY = sqrt(pow(unity_WorldToObject[1].x, 2) + pow(unity_WorldToObject[1].y, 2) + pow(unity_WorldToObject[1].z, 2));
					float objRatio = sY/sX; // オブジェクトの縦横比

					// 画面に貼りつく
					// ビルボード用の行列
					float4x4 billboardMatrix = UNITY_MATRIX_V;
					billboardMatrix._m03 = 0;
					billboardMatrix._m13 = 0;
					billboardMatrix._m23 = 0;
					billboardMatrix._m33 = 0;				
					
					float3 viewForward = UNITY_MATRIX_V[2].xyz; // 前への視線方向
					float NearClip = _ProjectionParams.y; // 視線カメラのNearPlane
					float forwardScale = NearClip * 1.1; // 視線方向への移動/拡大率
					
					float screenRatio = _ScreenParams.y/_ScreenParams.x; //画面比率

					o.vertex = camPos; // カメラと同じ座標に移動
					o.vertex.xyz += -1 * viewForward * forwardScale; // 視線方向にforwardScaleだけ移動
					o.vertex += mul(float4((o.uv - 0.5) * float2(objRatio, 1), 0, 1), billboardMatrix); // 傾きをビルボードに
					o.vertex = mul(UNITY_MATRIX_VP, o.vertex);
					o.vertex.y = lerp(1.0, -1.0, o.vertex.y < 0.0) * forwardScale * _Scale; // 縦に合うようにフィットさせる
					o.vertex.x = lerp(1.0, -1.0, o.vertex.x < 0.0) * forwardScale * _Scale * objRatio * screenRatio; // 比率をそのまま横に縮小拡大する
					o.vertex.x += abs(o.vertex.x) * (1.0/ (_Scale * objRatio * screenRatio) - 1) * _OffsetX; //OffsetX分だけ表示位置を横にずらす
					o.vertex.y -= abs(o.vertex.y) * (1.0/ _Scale - 1) * _OffsetY ; //OffsetY分だけ表示位置を縦にずらす*/

				}

				return o;


			}
			
			fixed4 frag (v2f i, fixed facing : VFACE) : SV_Target
			{
				// 表だったらMainTex, 裏だったらBackTexを貼る
				float2 uv = float2(i.uv.x, i.uv.y);
				fixed4 col = (facing > 0 ) ? tex2D(_MainTex, uv) : tex2D(_BackTex, uv);
				return col;
			}

			ENDCG
		}
	}
	CustomEditor "EasyToTakeSSInspector"
}
