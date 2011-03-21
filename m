Received: from akaiser.csb (vpn-229-123.phx2.redhat.com [10.3.229.123])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2LEXFX5032669
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2011 10:33:17 -0400
Message-ID: <4D8761A8.1020009@redhat.com>
Date: Mon, 21 Mar 2011 11:33:12 -0300
From: Anderson Kaiser <akaiser@redhat.com>
MIME-Version: 1.0
References: <0A03EDA0F33C5C428BFFF019C40D609E9CB74986A8@SCMBXC01.bcbad.state.sc.us>
In-Reply-To: <0A03EDA0F33C5C428BFFF019C40D609E9CB74986A8@SCMBXC01.bcbad.state.sc.us>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgexport usage
Reply-To: akaiser@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 03/17/2011 02:32 PM, Males, Jess wrote:
> > From 'man 8 vgexport':
> vgexport allows you to make the inactive VolumeGroupName(s) unknown to  the  system.
>
> By 'unknown to the system' I would expect it would not appear in vg listings such as vgs (shown below) or vgdisplay.
>
> [root@icarus lvm]# vgcreate junk /dev/loop1 /dev/loop2 /dev/loop3
>    Volume group "junk" successfully created
> [root@icarus lvm]# vgs
>    VG         #PV #LV #SN Attr   VSize  VFree
>    junk         3   0   0 wz--n- 48.00M 48.00M
> [root@icarus lvm]# vgchange junk -a n
>    0 logical volume(s) in volume group "junk" now active
> [root@icarus lvm]# vgs
>    VG         #PV #LV #SN Attr   VSize  VFree
>    junk         3   0   0 wz--n- 48.00M 48.00M
> [root@icarus lvm]# vgexport junk
>    Volume group "junk" successfully exported
> [root@icarus lvm]# vgs
>    VG         #PV #LV #SN Attr   VSize  VFree
>    junk         3   0   0 wzx-n- 48.00M 48.00M
>
>
> However, more disturbing is that if I remove one of the disks, lvm complains about a missing item.
>
> [root@icarus lvm]# losetup -d /dev/loop2
> [root@icarus lvm]# vgs
>    Couldn't find device with uuid 1gNBDl-dOqI-OQid-TIcq-8Lp2-qUa2-PwdvnB.
>    VG         #PV #LV #SN Attr   VSize  VFree
>    junk         3   0   0 wzxpn- 48.00M 48.00M
>
>
> Am I expecting the wrong things from this command?
>
>
> Thanks,
>
> -- Jess Males
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
  Maybe "unknown" is the wrong word in this case. You will be able to 
see this VG using vgs, vgdisplay and so on. But you can't remove when 
you try a vgremove.

You have to import it back (vgimport VolumeGroup) to change it again.

I think that unknown means more like "unchangeable".

[]'s

-- 
Anderson Kaiser (RHCE, RHCVA)
Red Hat Brasil - Global Support Services
akaiser@redhat.com
+55 11 3529-6000
Direct: +55 11 3529-6093
