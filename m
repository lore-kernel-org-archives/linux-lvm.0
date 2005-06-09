Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j59AH4O18499
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 06:17:04 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j59AH3pZ006357
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 06:17:03 -0400
Message-ID: <42A81719.9080801@gmx.net>
Date: Thu, 09 Jun 2005 12:16:57 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate goes into deep-sleep while creating an xfs
	snapshot
References: <6A58CFF91886D54BBDA1FE988C4DF79D025065@bagex01.baghus-lan.net>
In-Reply-To: <6A58CFF91886D54BBDA1FE988C4DF79D025065@bagex01.baghus-lan.net>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, linux-xfs@oss.sgi.com

Sven Riedel schrieb:
> Hi,
> I'm creating a backup script for a database using lvm snapshots.
> The script ran fine for a few test runs, then I added xfs_freeze -f=20
> just before the lvcreate command, as per HOWTO recipe. Now
> lvcreate went into deep-sleep and wont wake up:
>=20
> update:~/bin# ps ax | grep lvcreate
> 25053 pts/2    D<L+   0:00 lvcreate -s -L 55M -n tables_snap=20
>    /dev/database_vg/tables_lv
>=20
> Running lvdisplay in a different terminal to see if lvm itself
> is still seeing all LVs results in lvdisplay going into=20
> deep-sleep mode as well. Doing an strace -p 25053=20
> doesn't display anything (strace won't catch my interrupts
> either, but according to ps it's in a regular sleep).
>=20
> dmesg doesn't say anything to this situation.
>=20
> Is there a known issue with snapshots and xfs_freeze?=20
> Any way I can gather pertinent debugging info?
>=20
> I'm running lvm 2.01.04 (package from debian unstable).

The HOWTO is way old, with LVM2 the XFS filesystem is 'frozen'=20
automaticly on the mount -onouuid,ro ( not quite sure, but probably also=20
for LVM1 ..., think it's in the XFS code ).
So, forget xfs_freeze. It's freezing your box, not your filesystems.

XFS-Guys: shouldn't xfs_freeze be removed from xfs_cmds? It's doing more=20
harm than use ( if any use at all ), so ...
--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
