
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class localScore : UdonSharpBehaviour
{
    [SerializeField] GameObject displayText;
    private Text localText;
    private int myScore=0;
    public scoreManager scoreManager;
    void Start()
    {
        localText = displayText.GetComponent<Text>();
        localText.text = "damage: "+myScore;

    }

    public void update()
    {
        int damage = scoreManager.score_num;
        localText.text = "damage: "+damage;
    }

    public void localdamage()
    {
        myScore++;
        //localText.text = "damage: "+myScore;
    }
}
