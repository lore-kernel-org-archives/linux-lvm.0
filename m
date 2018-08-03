Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A5F2308BDA6
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2018 13:18:53 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 035224E900
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2018 13:18:52 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id l15-v6so4925460lji.6
	for <linux-lvm@redhat.com>; Fri, 03 Aug 2018 06:18:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPrpM6xO4x2AuD2-BbDRbcVxRUqWTsecqyikhBhvN-ioT=3jnw@mail.gmail.com>
References: <CAPrpM6xO4x2AuD2-BbDRbcVxRUqWTsecqyikhBhvN-ioT=3jnw@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Fri, 3 Aug 2018 08:18:29 -0500
Message-ID: <CAAMCDec1hD4ahGPfixFwoG0x=XSd+pZ67Vf3ahYSyZGueTAh9A@mail.gmail.com>
Subject: Re: [linux-lvm] How to trash a broke VG
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Assuming you want to completely eliminate the vg so that you can
rebuild it from scratch and the lv's are no longer mounted, then this
should work:  IF the lv is mounted you should remove it from fstab and
reboot, and see what state it comes up in and first attempt to
vgchange it off as that is cleaner than doing the dmsetup tricks.

If you cannot get the lv's lvchanged to off such that the
/dev/<vgname> is empty or non-existant, then this is a lower level way
(this still requires the device to be un-mounted, if mounted the
command will fail).

dmsetup table | grep <vgname>

Then dmsetup remove <lvnamefromabove>  (until all component lv's are
removed, this should empty the /dev/vgname/ directory of all devices.

Once in this state you can use the pvremove command with the extra
force options, it will tell you what vg it was part of and require you
to answer y or n.

I have had to do this a number of times when events have happened
causing disks to be lost/died/corrupted.



On Fri, Aug 3, 2018 at 12:21 AM, Jeff Allison
<jeff.allison@allygray.2y.net> wrote:
> OK Chaps I've broken it.
>
> I have a VG containing one LV and made up of 3 live disks and 2 failed disks.
>
> Whilst the disks were failing I attempted to move date off the failing
> disks, which failed so I now have a pvmove0 that won't go away either.
>
>
> So if I attempt to even remove a live disk I get an error.
>
> [root@nas ~]# vgreduce -v vg_backup /dev/sdi1
>     Using physical volume(s) on command line.
>     Wiping cache of LVM-capable devices
>     Wiping internal VG cache
>   Couldn't find device with uuid eFMoUW-6Ml5-fTyn-E2cT-sFXu-kYla-MmiAUV.
>   Couldn't find device with uuid LxXhsb-Mgag-ESXZ-fPP6-52dE-iNp2-uKdLwu.
>     There are 2 physical volumes missing.
>   Cannot change VG vg_backup while PVs are missing.
>   Consider vgreduce --removemissing.
>     There are 2 physical volumes missing.
>   Cannot process volume group vg_backup
>   Failed to find physical volume "/dev/sdi1".
>
> Then if I attempt a vgreduce --removemissing I get
>
> [root@nas ~]# vgreduce --removemissing vg_backup
>   Couldn't find device with uuid eFMoUW-6Ml5-fTyn-E2cT-sFXu-kYla-MmiAUV.
>   Couldn't find device with uuid LxXhsb-Mgag-ESXZ-fPP6-52dE-iNp2-uKdLwu.
>   WARNING: Partial LV lv_backup needs to be repaired or removed.
>   WARNING: Partial LV pvmove0 needs to be repaired or removed.
>   There are still partial LVs in VG vg_backup.
>   To remove them unconditionally use: vgreduce --removemissing --force.
>   Proceeding to remove empty missing PVs.
>
> So I try force
> [root@nas ~]# vgreduce --removemissing --force vg_backup
>   Couldn't find device with uuid eFMoUW-6Ml5-fTyn-E2cT-sFXu-kYla-MmiAUV.
>   Couldn't find device with uuid LxXhsb-Mgag-ESXZ-fPP6-52dE-iNp2-uKdLwu.
>   Removing partial LV lv_backup.
>   Can't remove locked LV lv_backup.
>
> So no go.
>
> If I try lvremove pvmove0
>
> [root@nas ~]# lvremove -v pvmove0
>     Using logical volume(s) on command line.
>     VG name on command line not found in list of VGs: pvmove0
>     Wiping cache of LVM-capable devices
>   Volume group "pvmove0" not found
>   Cannot process volume group pvmove0
>
> So Heeelp I seem to be caught in some kind of loop.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
