using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;


public class synceSlash : UdonSharpBehaviour
{
    
    public GameObject slashPrefab;
    public GameObject preslashPrefab;
    public float speed = 1500;
    public float slashz = 0;
    public float destroyTime = 3.0f;

    public bool isSlash = false;

    [UdonSynced(UdonSyncMode.None)] private bool rightFlag=false;//左右どちらの手が振られたか。
    [UdonSynced(UdonSyncMode.None)] private bool leftFlag=false;


    [UdonSynced(UdonSyncMode.None)] private float Tilt;
    [UdonSynced(UdonSyncMode.None)] private float xpos;
    [UdonSynced(UdonSyncMode.None)] private float ypos;
    [UdonSynced(UdonSyncMode.None)] private float zpos;

    //以下トラッキング関連
    VRCPlayerApi _player = Networking.LocalPlayer;
    public float RightSlashAngle = 0;
    private Vector3 RightStartPosition;
    private Vector3 RightLastPosition;
    private Vector3[] RightHoldingLength;
    private int RightHoldingIndex = 0;

    public float LeftSlashAngle = 0;
    private Vector3 LeftStartPosition;
    private Vector3 LeftLastPosition;
    private Vector3[] LeftHoldingLength;
    private int LeftHoldingIndex = 0;

    private const int maxHoldingLength = 1000; // 必要に応じて最大サイズを設定

    private AudioSource audioSource;//振った時の音

    //当たり判定カプセル
    
    public GameObject HitPointCapsule;
    private VRCPlayerApi playerToUse;

    [Tooltip("斬撃を打ってから再度撃てるようになるまでの時間"), SerializeField] private float RightReloadTime = 0.5f;
    private float RighgtReloadTimer;
    [Tooltip("斬撃を打ってから再度撃てるようになるまでの時間"), SerializeField] private float LeftReloadTime = 0.5f;
    private float LeftReloadTimer;


    void Start()
    {
        RightHoldingLength = new Vector3[maxHoldingLength];//トラッキングのため追加
        LeftHoldingLength = new Vector3[maxHoldingLength];
        audioSource = GetComponent<AudioSource>();

        //当たり判定カプセル
        playerToUse = Networking.LocalPlayer;
        HitPointCapsule = VRCInstantiate(HitPointCapsule);

        // オーナーの設定
        /*
        int playerCount = VRCPlayerApi.GetPlayerCount();
        VRCPlayerApi lastPlayer = VRCPlayerApi.GetPlayerById(playerCount);
        Networking.SetOwner(lastPlayer, HitPointCapsule);
        */
    }

    void Update()
    {
        RighgtReloadTimer = Mathf.Max(RighgtReloadTimer - Time.deltaTime, 0);
        LeftReloadTimer= Mathf.Max(LeftReloadTimer - Time.deltaTime, 0);
        var player = Networking.LocalPlayer;

        if (Input.GetKeyDown(KeyCode.I))
        {
            isSlash = !isSlash;
        }

        if (player != null && isSlash==true) // Unityの再生ボタンで実行すると変数がnullになるらしいよ
        {
            //頭の位置
            var headData = player.GetTrackingData(VRCPlayerApi.TrackingDataType.Head);
            //左手の位置
            var LeftArmData = player.GetTrackingData(VRCPlayerApi.TrackingDataType.LeftHand);
            //右手の位置
            var RightArmData = player.GetTrackingData(VRCPlayerApi.TrackingDataType.RightHand);
            //トリガーの押し判定
            float LTrigger = Input.GetAxisRaw("Oculus_CrossPlatform_PrimaryIndexTrigger");
            float RTrigger = Input.GetAxisRaw("Oculus_CrossPlatform_SecondaryIndexTrigger");
            //RTrigger = Input.GetKeyDown(KeyCode.G) ? 1 : 0;

            if (RTrigger > 0)
            {
                //audioSource.Play();
                if (RightHoldingIndex == 0)
                {
                    // 初めて追加する場合はStartPositionとして設定
                    RightStartPosition = RightArmData.position;
                }
                if (RightHoldingIndex < maxHoldingLength)
                {
                    RightHoldingLength[RightHoldingIndex] = RightArmData.position;
                    RightHoldingIndex++;
                }
                RightLastPosition=RightHoldingLength[RightHoldingIndex-1];
                //RightLastPosition = RightArmData.position;
            }
            else if (RightHoldingIndex > 0 && RighgtReloadTimer <= 0)
            {
                // RTriggerが0になったとき
                Vector3 RightpositionMovement = RightStartPosition - RightLastPosition;

                Vector3 RightmiddlePosition = RightStartPosition + RightpositionMovement / 2;

                //斬撃の角度を求める
                float RightYDif = RightLastPosition[1] - RightStartPosition[1];
                float RightXDif = RightLastPosition[0] - RightStartPosition[0];
                RightSlashAngle = Mathf.Atan(RightYDif / RightXDif);  //分母Ｘのほうが良さそうじゃね
                RightSlashAngle = (180 / Mathf.PI) * RightSlashAngle;
                Debug.Log(RightSlashAngle);

                //SlashAngle = (0);

                Tilt = RightSlashAngle;
                xpos = 2*RightmiddlePosition[0];
                ypos = RightmiddlePosition[1];
                zpos = RightmiddlePosition[2];

                // 配列をクリアしてリセット
                RightHoldingIndex = 0;

                //同期
                if (!Networking.LocalPlayer.IsOwner(this.gameObject))
                {
                    Networking.SetOwner(Networking.LocalPlayer, this.gameObject);
                }
                rightFlag = true;
                RequestSerialization();
                ReceiveSync();//斬撃を出した端末で斬撃を見るために必要
                RighgtReloadTimer = RightReloadTime;
            }

            //左トリガーの情報
            if (LTrigger > 0)
            {
                //audioSource.Play();
                if (LeftHoldingIndex == 0)
                {
                    // 初めて追加する場合はStartPositionとして設定
                    LeftStartPosition = LeftArmData.position;
                }
                if (LeftHoldingIndex < maxHoldingLength)
                {
                    LeftHoldingLength[LeftHoldingIndex] = LeftArmData.position;
                    LeftHoldingIndex++;
                }
                LeftLastPosition=LeftHoldingLength[LeftHoldingIndex-1];
                //LeftLastPosition = LeftArmData.position;
            }
            else if (LeftHoldingIndex > 0 && LeftReloadTimer <= 0)
            {
                // RTriggerが0になったとき
                Vector3 LeftpositionMovement = LeftStartPosition - LeftLastPosition;

                Vector3 LeftmiddlePosition = LeftStartPosition + LeftpositionMovement / 2;

                //斬撃の角度を求める
                float LeftYDif = LeftLastPosition[1] - LeftStartPosition[1];
                float LeftXDif = LeftLastPosition[0] - LeftStartPosition[0];
                LeftSlashAngle = Mathf.Atan(LeftYDif / LeftXDif);  //分母Ｘのほうが良さそうじゃね
                LeftSlashAngle = (180 / Mathf.PI) * LeftSlashAngle;
                Debug.Log(LeftSlashAngle);

                //SlashAngle = (0);

                Tilt = LeftSlashAngle;
                xpos = 2*LeftmiddlePosition[0];
                ypos = LeftmiddlePosition[1];
                zpos = LeftmiddlePosition[2];

                // 配列をクリアしてリセット
                LeftHoldingIndex = 0;

                //同期
                if (!Networking.LocalPlayer.IsOwner(this.gameObject))
                {
                    Networking.SetOwner(Networking.LocalPlayer, this.gameObject);
                }

                leftFlag = true;
                RequestSerialization();
                ReceiveSync();//斬撃を出した端末で斬撃を見るために必要
                LeftReloadTimer = LeftReloadTime;
            }

            
        
        }
            //当たり判定カプセル
            Vector3 HeadPos = playerToUse.GetBonePosition(HumanBodyBones.Head);
            Vector3 ToePos = playerToUse.GetBonePosition(HumanBodyBones.LeftFoot); // 左足のボーンを取得

            // 頭と足の中間位置を計算
            float MidYPos = (HeadPos[1] + ToePos[1]) / 2;
            Vector3 MidPos = new Vector3(HeadPos[0], MidYPos, HeadPos[2]);

            // カプセルの高さを計算
            float height = HeadPos[1] - ToePos[1];

            //HitPointCapsuleをMidPosに移動し、高さを設定
            HitPointCapsule.transform.position = MidPos;
            HitPointCapsule.transform.localScale = new Vector3(HitPointCapsule.transform.localScale.x, height / 2, HitPointCapsule.transform.localScale.z);
    }

    public override void OnDeserialization()
    {
        ReceiveSync();
    }
    private void ReceiveSync()                                          
    {    
        //SlashStart(Tilt, xpos, ypos, zpos)
        SetSlashParameters(Tilt,xpos,ypos,zpos);
        SendCustomEventDelayedSeconds(nameof(SlashStart), 1.5f);
    }
    //斬撃のパラメータをいったん保存
    private void SetSlashParameters(float _Tilt, float _xpos, float _ypos, float _zpos)
    {
        Tilt = _Tilt;
        xpos = _xpos;
        ypos = _ypos;
        zpos = _zpos;
    }
    //引数なしのメソッド追加
    public void SlashStart()
    {
        SlashStartWithParameters(Tilt, xpos, ypos, zpos);
    }
    //斬撃クローンして飛ばす
    public void SlashStartWithParameters(float _Tilt, float _xpos, float _ypos, float _zpos)
    {
        Tilt = _Tilt;
        xpos = _xpos;
        ypos = _ypos;
        zpos = _zpos;

       // slashのcloneを生成
       GameObject Slash = VRCInstantiate(slashPrefab);
       Slash.transform.SetPositionAndRotation(new Vector3(xpos, ypos, slashz),Quaternion.Euler(0,0,Tilt));
       // Rigidbodyの取得
       Rigidbody SlashRb = Slash.GetComponent<Rigidbody>();
        SlashRb.AddForce(transform.forward * speed, ForceMode.Impulse);
        Debug.Log("success");

       // 3秒後で破壊
       Destroy(Slash, destroyTime);

    }
}