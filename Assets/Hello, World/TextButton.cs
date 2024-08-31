
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class TextButton : UdonSharpBehaviour
{
    Button _button;   // Buttonクラスの_buttonオブジェクトを定義
    System.DateTime _now;
    [SerializeField] Text _displayText; //[SerializeField]を冒頭につけることでUnity inspectorから編集できる
    [UdonSynced(UdonSyncMode.None)]
    string _content;  //  [UdonSynced(UdonSyncMode.None)] 後から来た人にも同様な値を見せる


    //Start()はワールド起動時に実行されるメソッド
    void Start()
    {
        _now = System.DateTime.Now; //現在の日時（年、月、日、時、分、秒、1/100秒）
        _content = _now.Hour.ToString("00") + ":" + _now.Minute.ToString("00") + ":" + _now.Second.ToString("00");
        _displayText.text = _content.ToString();

    }

    public void Pressed()
    {
        _now = System.DateTime.Now; //現在の日時（年、月、日、時、分、秒、1/100秒）
        _content = _now.Hour.ToString("00") + ":" + _now.Minute.ToString("00") + ":" + _now.Second.ToString("00");
        _displayText.text = _content.ToString();

    }

    //操作対象とするオブジェクトの所有者が別のユーザーだった場合、所有者をオブジェクト操作者に移動させる。
    public void ChangeOwner()
    {
        if (!Networking.IsOwner(Networking.LocalPlayer, this.gameObject)) 
        {
            Networking.SetOwner(Networking.LocalPlayer, this.gameObject);
        }
    }


    //OnDeserialization 変数の同期が行われると呼び出されるメソッド 全員に同じdataを表示させるために必要なコマンドである。
    public override void OnDeserialization()
    {
        _displayText.text = _content.ToString();
    }
}
