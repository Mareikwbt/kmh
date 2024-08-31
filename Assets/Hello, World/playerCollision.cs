using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class playerCollision : UdonSharpBehaviour
{
    [SerializeField] private scoreManager SlashObj;//全員共通チームスコア
    [SerializeField] private localScore localScore;//ローカル判定個人スコア
    public LayerMask targetLayerMask;
    public GameObject calsule;

    //playerで判定
    /*public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        SlashObj.playerCollision();

        VRCPlayerApi _player = Networking.LocalPlayer;
        if(player == _player)
        {
            localScore.localdamage();
        }
    }*/

    //playerに追従するカプセルで判定
    public void OnTriggerEnter(Collider playerCapsule)
    {
        if (IsInLayerMask(playerCapsule.gameObject, targetLayerMask))
        {
            SlashObj.playerCollision();//これだと窓やスコアボードに当たったときもスコアに加算されるから、オーナー気にせずカプセルに当たったら、にすべき。

            //VRCPlayerApi capsuleOwner = Networking.GetOwner(playerCapsule.gameObject);
            VRCPlayerApi player = Networking.LocalPlayer;
            if(Networking.IsOwner(player, playerCapsule.gameObject))
            {
                localScore.localdamage();
            }
            /*
            if (ownermanage.isActiveOwner(playerCapsule.gameObject))
            {
                localScore.localdamage();
            }
            */
        }
        
    }
    private bool IsInLayerMask(GameObject obj, LayerMask layerMask)
    {
        return ((layerMask.value & (1 << obj.layer)) > 0);
    }
}