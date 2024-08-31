
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
[UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
public class WindowsController : UdonSharpBehaviour
{
    private VRCPlayerApi localPlayer;
    [Tooltip("スクリーンサイズ"), SerializeField, UdonSynced(UdonSyncMode.None)] private float ScreenSize = 3f;
    [Tooltip("背景"), SerializeField] private GameObject Background;
    private Material material;
    private void Start()
    {
        Background.SetActive(false);
        localPlayer = Networking.LocalPlayer;
        Renderer renderer = Background.GetComponent<Renderer>();
        if (renderer != null) material = renderer.material;
    }
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            Background.SetActive(!Background.activeSelf);
        }
        else if (Input.GetKeyDown(KeyCode.UpArrow))
        {
            if (Networking.IsOwner(localPlayer, this.gameObject))
            {
                ChangeScreenSize(ScreenSize + 0.1f);
                RequestSerialization();
                Debug.Log("現在のスクリーンサイズ:" + ScreenSize.ToString());
            }
            else
            {
                Networking.SetOwner(localPlayer, this.gameObject);
                ChangeScreenSize(ScreenSize + 0.1f);
                Debug.Log("現在のスクリーンサイズ:" + ScreenSize.ToString() + "(オーナーを変更しました)");
                RequestSerialization();
            }
        }
        else if (Input.GetKeyDown(KeyCode.DownArrow))
        {
            if (ScreenSize > 0.1f)
            {
                if (Networking.IsOwner(localPlayer, this.gameObject))
                {
                    ChangeScreenSize(ScreenSize - 0.1f);
                    RequestSerialization();
                    Debug.Log("現在のスクリーンサイズ:" + ScreenSize.ToString());
                }
                else
                {
                    Networking.SetOwner(localPlayer, this.gameObject);
                    ChangeScreenSize(ScreenSize - 0.1f);
                    Debug.Log("現在のスクリーンサイズ:" + ScreenSize.ToString() + "(オーナーを変更しました");
                    RequestSerialization();
                }
            }
        }
    }
    public override void OnDeserialization()
    {
        ChangeScreenSize();
    }
    public override void OnPlayerJoined(VRCPlayerApi player)
    {
        if (Networking.IsOwner(localPlayer, this.gameObject))
        {
            SendCustomEventDelayedSeconds(nameof(RequestSerialization), 3f);
        }
    }
    private void ChangeScreenSize(float request)
    {
        ScreenSize = request;
        material.SetFloat("_Scale", ScreenSize);
    }
    private void ChangeScreenSize()
    {
        material.SetFloat("_Scale", ScreenSize);
    }
}