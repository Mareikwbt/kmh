using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using Debug = UnityEngine.Debug;

public class douki : UdonSharpBehaviour
{
    [UdonSynced, FieldChangeCallback(nameof(Hoge))] private int sColorFlag = 1;

    public int Hoge
    {
        set
        {
            sColorFlag = value;
            HogeChanged();
        }
        get => sColorFlag;
    }

    void Start()
    {
        // 初期化処理が必要であればここに記述
    }

    private void UpdateColor()
    {
        if (sColorFlag == 0)
        {
            GetComponent<Renderer>().material.color = Color.red;
        }
        else if(sColorFlag == 1)
        {
            GetComponent<Renderer>().material.color = Color.green;
        }
        else if(sColorFlag == 2)
        {
            GetComponent<Renderer>().material.color = Color.blue;
        }
    }

    private void SetHoge()
    {
        if (!Networking.LocalPlayer.IsOwner(this.gameObject))
        {
            Networking.SetOwner(Networking.LocalPlayer, this.gameObject);
        }
        Hoge = (Hoge+1)%3; // 値を正負に切り替える
        RequestSerialization();
    }

    private void HogeChanged()
    {
        UpdateColor();
    }

    public override void Interact()
    {
        SetHoge();
    }
}
