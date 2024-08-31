
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class scoreManager : UdonSharpBehaviour
{
    public GameObject score_object; // Textオブジェクト
    private Text score_text; // 実際のTextコンポーネントへの参照
    [UdonSynced, FieldChangeCallback(nameof(score_num))] private int sScore_num; // スコア変数
    public int score_num
    {
        set
        {
            sScore_num = value;
            scoreChanged();
        }
        get => sScore_num;
    }

    void Start()
    {
        // オブジェクトからTextコンポーネントを取得
        score_text = score_object.GetComponent<Text>();
        // 初期スコアの表示
        score_text.text = "Score: " + score_num;
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.P))
        {
            ResetScore();
        }
    }

    private void UpdateScore()
    {
        score_text.text = "Score: " + sScore_num;
    }

    public void playerCollision()
    {
        SetScore();
    }

    private void SetScore()
    {
        // 所有者を変更
        if (!Networking.IsOwner(Networking.LocalPlayer, this.gameObject))
        {
            Networking.SetOwner(Networking.LocalPlayer, this.gameObject);
        }

        score_num++;
        RequestSerialization();
    }

    private void scoreChanged()
    {
        UpdateScore();
    }

    public override void OnDeserialization()
    {
        // 同期後にスコアの表示を更新
        score_text.text = "Score: " + score_num;
    }

    public void ResetScore()
    {
        score_num= 0;
        if (!Networking.IsOwner(Networking.LocalPlayer, this.gameObject))
        {
            Networking.SetOwner(Networking.LocalPlayer, this.gameObject);
        }
        RequestSerialization();
    }
}
