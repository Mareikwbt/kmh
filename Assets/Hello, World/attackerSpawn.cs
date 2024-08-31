
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class attackerSpawn : UdonSharpBehaviour
{
    public override void Interact()
    {
        VRCPlayerApi localPlayer = Networking.LocalPlayer;
        localPlayer.TeleportTo(new Vector3(0, 1, 0), Quaternion.Euler(0, 0, 0));
    }
}
