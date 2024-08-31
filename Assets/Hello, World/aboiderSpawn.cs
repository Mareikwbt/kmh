
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class aboiderSpawn : UdonSharpBehaviour
{
    public override void Interact()
    {
        VRCPlayerApi localPlayer = Networking.LocalPlayer;
        localPlayer.TeleportTo(new Vector3(0, 1, 12), Quaternion.Euler(0, 180, 0));
    }
}
