using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class handTrack : UdonSharpBehaviour
{
    VRCPlayerApi player;

    void Start()
    {
        player = Networking.LocalPlayer;
    }

    void Update()
    {
        if (player != null)
        {
            // 左手の位置情報を取得
            VRCPlayerApi.TrackingData trackingData = player.GetTrackingData(VRCPlayerApi.TrackingDataType.LeftHand);

            // Vector3に変換して位置を設定する
            Vector3 leftHandPosition = new Vector3(trackingData.position.x, trackingData.position.y, trackingData.position.z);
            this.transform.position = leftHandPosition;
        }
    }
}
