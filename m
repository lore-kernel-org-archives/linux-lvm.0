Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0319C433F5
	for <linux-lvm@archiver.kernel.org>; Sat, 28 May 2022 16:16:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-HD1OxXuBMO-Ahl6yBQ3EQA-1; Sat, 28 May 2022 12:16:01 -0400
X-MC-Unique: HD1OxXuBMO-Ahl6yBQ3EQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 675B93802B96;
	Sat, 28 May 2022 16:15:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFC9340EC002;
	Sat, 28 May 2022 16:15:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6408B1947051;
	Sat, 28 May 2022 16:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B76DD194704C
 for <linux-lvm@listman.corp.redhat.com>; Sat, 28 May 2022 16:15:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6DAE140336E; Sat, 28 May 2022 16:15:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 695FC416385
 for <linux-lvm@redhat.com>; Sat, 28 May 2022 16:15:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 509C5811E75
 for <linux-lvm@redhat.com>; Sat, 28 May 2022 16:15:52 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
 [172.104.24.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-nrZRtdntN7-n8lmbz9bkuw-1; Sat, 28 May 2022 12:15:49 -0400
X-MC-Unique: nrZRtdntN7-n8lmbz9bkuw-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
 [68.116.170.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.stoffel.org (Postfix) with ESMTPSA id F152723A11
 for <linux-lvm@redhat.com>; Sat, 28 May 2022 12:15:48 -0400 (EDT)
Received: by quad.stoffel.org (Postfix, from userid 1000)
 id 6C160A7C2A; Sat, 28 May 2022 12:15:48 -0400 (EDT)
MIME-Version: 1.0
Message-ID: <25234.19124.329350.465135@quad.stoffel.home>
Date: Sat, 28 May 2022 12:15:48 -0400
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <4ea715cc-3a58-bb47-af41-f40e630f93f3@syseleven.de>
References: <4ea715cc-3a58-bb47-af41-f40e630f93f3@syseleven.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [linux-lvm] raid10 with missing redundancy,
 but health status claims it is ok.
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>>>> "Olaf" =3D=3D Olaf Seibert <o.seibert@syseleven.de> writes:

I'm leaving for the rest of the weekend, but hopefully this will help you..=
.

Olaf> Hi all, I'm new to this list. I hope somebody here can help me.

We will try!  But I would strongly urge that you take backups of all
your data NOW, before you do anything else.  Copy to another disk
which is seperate from this system just in case.

My next suggestion would be for you to provide the output of the
'pvs', 'vgs' and 'lvs' commands.   Also, which disk died?  And have
you replaced it?   =20

My second suggestion would be for you to use 'md' as the lower level
RAID1/10/5/6 level underneath your LVM volumes.  Alot of people think
it's better to have it all in one tool (btrfs, zfs, others) but I
stronly feel that using nice layers helps keep things organized and
reliable.

So if you can, add two new disks into your system, add a full-disk
partition which starts at offset of 1mb or so, and maybe even leaves a
couple of MBs of free space at the end, and then create an MD pair on
them:

   mdadm --create /dev/md0 --level=3D1 --raid-devices=3D2 /dev/sdy1 /dev/sd=
z1
    =20
Now you can add that disk in your nova VG with:

   vgextend nova /dev/md0

Then try to move your LV named 'lvname' onto the new MD PV.

   pvmove -n lvname /dev/<source_PV> /dev/md0

I think you really want to move the *entire* top level LV onto new
storage.  Then you will know you have safe data.  And this can be done
while the volume is up and running.

But again!!!!!!  Please take a backup (rsync onto a new LV maybe?) of
your current data to make sure you don't lose anything. =20

Olaf> We had a disk go bad (disk commands timed out and took many
Olaf> seconds to do so) in our LVM installation with mirroring. With
Olaf> some trouble, we managed to pvremove the offending disk, and
Olaf> used `lvconvert --repair -y nova/$lv` to repair (restore
Olaf> redundancy) the logical volumes.

How many disks do you have in the system?  Please don't try to hide
names of disks and such unless you really need to.  It makes it much
harder to diagnose. =20


Olaf> One logical volume still seems to have trouble though. In `lvs -o
Olaf> devices -a` it shows no devices for 2 of its subvolumes, and it has t=
he
Olaf> weird 'v' status:


Olaf>   LV                                                   VG     Attr
Olaf>  LSize   Pool Origin Data%  Meta%  Move Log         Cpy%Sync Convert =
Devices
Olaf>   lvname            nova   Rwi-aor--- 800.00g
Olaf>                  100.00
Olaf> lvname_rimage_0(0),lvname_rimage_1(0),lvname_rimage_2(0),lvname_rimag=
e_3(0)
Olaf>   [lvname_rimage_0] nova   iwi-aor--- 400.00g
Olaf>                                   /dev/sdc1(19605)
Olaf>   [lvname_rimage_1] nova   iwi-aor--- 400.00g
Olaf>                                   /dev/sdi1(19605)
Olaf>   [lvname_rimage_2] nova   vwi---r--- 400.00g
Olaf>   [lvname_rimage_3] nova   iwi-aor--- 400.00g
Olaf>                                   /dev/sdj1(19605)
Olaf>   [lvname_rmeta_0]  nova   ewi-aor---  64.00m
Olaf>                                   /dev/sdc1(19604)
Olaf>   [lvname_rmeta_1]  nova   ewi-aor---  64.00m
Olaf>                                   /dev/sdi1(19604)
Olaf>   [lvname_rmeta_2]  nova   ewi---r---  64.00m
Olaf>   [lvname_rmeta_3]  nova   ewi-aor---  64.00m
Olaf>                                   /dev/sdj1(19604)

Olaf> ```
Olaf> and also according to `lvdisplay -am` there is a problem with
Olaf> `..._rimage2` and `..._rmeta2`:
Olaf> ```
Olaf>   --- Logical volume ---
Olaf>   Internal LV Name       lvname_rimage_2
Olaf>   VG Name                nova
Olaf>   LV UUID                xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Olaf>   LV Write Access        read/write
Olaf>   LV Creation host, time xxxxxxxxx, 2021-07-09 16:45:21 +0000
Olaf>   LV Status              NOT available
Olaf>   LV Size                400.00 GiB
Olaf>   Current LE             6400
Olaf>   Segments               1
Olaf>   Allocation             inherit
Olaf>   Read ahead sectors     auto

Olaf>   --- Segments ---
Olaf>   Virtual extents 0 to 6399:
Olaf>     Type                error

Olaf>   --- Logical volume ---
Olaf>   Internal LV Name       lvname_rmeta_2
Olaf>   VG Name                nova
Olaf>   LV UUID                xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Olaf>   LV Write Access        read/write
Olaf>   LV Creation host, time xxxxxxxxx, 2021-07-09 16:45:21 +0000
Olaf>   LV Status              NOT available
Olaf>   LV Size                64.00 MiB
Olaf>   Current LE             1
Olaf>   Segments               1
Olaf>   Allocation             inherit
Olaf>   Read ahead sectors     auto

Olaf>   --- Segments ---
Olaf>   Virtual extents 0 to 0:
Olaf>     Type                error

Olaf> Similarly, the metadata looks corresponding:

Olaf>                 lvname_rimage_2 {
Olaf>                         id =3D "..."
Olaf>                         status =3D ["READ", "WRITE"]
Olaf>                         flags =3D []
Olaf>                         creation_time =3D 1625849121      # 2021-07-0=
9
Olaf> 16:45:21 +0000
Olaf>                         creation_host =3D "cbk130133"
Olaf>                         segment_count =3D 1

Olaf>                         segment1 {
Olaf>                                 start_extent =3D 0
Olaf>                                 extent_count =3D 6400     # 400 Gigab=
ytes

Olaf>                                 type =3D "error"
Olaf>                         }
Olaf>                 }




Olaf> On the other hand, the health status appears to read out normal:

Olaf> [13:38:20] root@cbk130133:~# lvs -o +lv_health_status
Olaf>   LV     VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log
Olaf>       Cpy%Sync Convert Health
Olaf>   lvname nova   Rwi-aor--- 800.00g       ..   100.00



Olaf> We tried various combinations of `lvconvert --repair -y nova/$lv` and
Olaf> `lvchange --syncaction repair` on it without effect.
Olaf> `lvchange -ay` doesn't work either:

Olaf> $ sudo lvchange -ay   nova/lvname_rmeta_2
Olaf>   Operation not permitted on hidden LV nova/lvname_rmeta_2.
Olaf> $ sudo lvchange -ay   nova/lvname
Olaf> $ # (no effect)
Olaf> $ sudo lvconvert --repair nova/lvname_rimage_2
Olaf>   WARNING: Disabling lvmetad cache for repair command.
Olaf>   WARNING: Not using lvmetad because of repair.
Olaf>   Command on LV nova/lvname_rimage_2 does not accept LV type error.
Olaf>   Command not permitted on LV nova/lvname_rimage_2.
Olaf> $ sudo lvchange --resync nova/lvname_rimage_2
Olaf>   WARNING: Not using lvmetad because a repair command was run.
Olaf>   Command on LV nova/lvname_rimage_2 does not accept LV type error.
Olaf>   Command not permitted on LV nova/lvname_rimage_2.
Olaf> $ sudo lvchange --resync nova/lvname
Olaf>   WARNING: Not using lvmetad because a repair command was run.
Olaf>   Logical volume nova/lvname in use.
Olaf>   Can't resync open logical volume nova/lvname.
Olaf> $ lvchange --rebuild /dev/sdf1 nova/lvname
Olaf>   WARNING: Not using lvmetad because a repair command was run.
Olaf> Do you really want to rebuild 1 PVs of logical volume nova/lvname [y/=
n]: y
Olaf>   device-mapper: create ioctl on lvname_rmeta_2 LVM-blah failed: Devi=
ce
Olaf> or resource busy
Olaf>   Failed to lock logical volume nova/lvname.
Olaf> $ lvchange --raidsyncaction repair nova/lvname
Olaf> # (took a long time to complete but didn't change anything)
Olaf> $ sudo lvconvert --mirrors +1 nova/lvname
Olaf>   Using default stripesize 64.00 KiB.
Olaf>   --mirrors/-m cannot be changed with raid10.



Olaf> Any idea how to restore redundancy on this logical volume? It is in
Olaf> continuous use, of course...
Olaf> It seems like somehow we must convince LVM to allocate some space for
Olaf> it, instead of using the error segment (there is plenty available in =
the
Olaf> volume group).

Olaf> Thanks in advance.

Olaf> -Olaf

Olaf> --=20
Olaf> SysEleven GmbH
Olaf> Boxhagener Stra=DFe 80
Olaf> 10245 Berlin

Olaf> T +49 30 233 2012 0
Olaf> F +49 30 616 7555 0

Olaf> http://www.syseleven.de
Olaf> http://www.facebook.com/SysEleven
Olaf> https://www.instagram.com/syseleven/

Olaf> Aktueller System-Status immer unter:
Olaf> http://www.twitter.com/syseleven

Olaf> Firmensitz: Berlin
Olaf> Registergericht: AG Berlin Charlottenburg, HRB 108571 B
Olaf> Gesch=E4ftsf=FChrer: Marc Korthaus, Jens Ihlenfeld, Andreas Hermann

Olaf> _______________________________________________
Olaf> linux-lvm mailing list
Olaf> linux-lvm@redhat.com
Olaf> https://listman.redhat.com/mailman/listinfo/linux-lvm
Olaf> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

