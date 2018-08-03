Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8FD0309128B
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2018 05:21:42 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52C6E356C5
	for <linux-lvm@redhat.com>; Fri,  3 Aug 2018 05:21:39 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id a4-v6so3183227lff.5
	for <linux-lvm@redhat.com>; Thu, 02 Aug 2018 22:21:39 -0700 (PDT)
MIME-Version: 1.0
From: Jeff Allison <jeff.allison@allygray.2y.net>
Date: Fri, 3 Aug 2018 15:21:36 +1000
Message-ID: <CAPrpM6xO4x2AuD2-BbDRbcVxRUqWTsecqyikhBhvN-ioT=3jnw@mail.gmail.com>
Subject: [linux-lvm] How to trash a broke VG
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
To: linux-lvm@redhat.com

OK Chaps I've broken it.

I have a VG containing one LV and made up of 3 live disks and 2 failed disks.

Whilst the disks were failing I attempted to move date off the failing
disks, which failed so I now have a pvmove0 that won't go away either.


So if I attempt to even remove a live disk I get an error.

[root@nas ~]# vgreduce -v vg_backup /dev/sdi1
    Using physical volume(s) on command line.
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Couldn't find device with uuid eFMoUW-6Ml5-fTyn-E2cT-sFXu-kYla-MmiAUV.
  Couldn't find device with uuid LxXhsb-Mgag-ESXZ-fPP6-52dE-iNp2-uKdLwu.
    There are 2 physical volumes missing.
  Cannot change VG vg_backup while PVs are missing.
  Consider vgreduce --removemissing.
    There are 2 physical volumes missing.
  Cannot process volume group vg_backup
  Failed to find physical volume "/dev/sdi1".

Then if I attempt a vgreduce --removemissing I get

[root@nas ~]# vgreduce --removemissing vg_backup
  Couldn't find device with uuid eFMoUW-6Ml5-fTyn-E2cT-sFXu-kYla-MmiAUV.
  Couldn't find device with uuid LxXhsb-Mgag-ESXZ-fPP6-52dE-iNp2-uKdLwu.
  WARNING: Partial LV lv_backup needs to be repaired or removed.
  WARNING: Partial LV pvmove0 needs to be repaired or removed.
  There are still partial LVs in VG vg_backup.
  To remove them unconditionally use: vgreduce --removemissing --force.
  Proceeding to remove empty missing PVs.

So I try force
[root@nas ~]# vgreduce --removemissing --force vg_backup
  Couldn't find device with uuid eFMoUW-6Ml5-fTyn-E2cT-sFXu-kYla-MmiAUV.
  Couldn't find device with uuid LxXhsb-Mgag-ESXZ-fPP6-52dE-iNp2-uKdLwu.
  Removing partial LV lv_backup.
  Can't remove locked LV lv_backup.

So no go.

If I try lvremove pvmove0

[root@nas ~]# lvremove -v pvmove0
    Using logical volume(s) on command line.
    VG name on command line not found in list of VGs: pvmove0
    Wiping cache of LVM-capable devices
  Volume group "pvmove0" not found
  Cannot process volume group pvmove0

So Heeelp I seem to be caught in some kind of loop.
