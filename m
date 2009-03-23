Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2N7fLrp022269
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 03:41:21 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.177])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2N7f3Lp030452
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 03:41:03 -0400
Message-ID: <49C73D0E.5040203@gmx.net>
Date: Mon, 23 Mar 2009 08:41:02 +0100
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mounting lvm partition
References: <3068401C6DAE4922843F9D70AAB8B915@stevePC>
In-Reply-To: <3068401C6DAE4922843F9D70AAB8B915@stevePC>
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Steve Lavoie schrieb:
> Hi!
>=20
> Here what I did:
> Created VG (vg0) and LV (testntfs)
> Share them using Iscsi Enterprise target.
> Connect to them using my Windows PC and created NTFS fileystem on it.
>=20
> Stop Iscsi Enterprise target.
>=20
> Now I am trying to mount this partition on the Linux system.
>=20
> Here what is happening when I tried to mount it.
>=20
> zabbix:/etc# mount -t ntfs-3g /dev/vg0/testntfs /mnt
> NTFS signature is missing.
> Failed to mount '/dev/mapper/vg0-testntfs': Invalid argument
> The device '/dev/mapper/vg0-testntfs' doesn't have a valid NTFS.
> Maybe you selected the wrong device? Or the whole disk instead of a
> partition (e.g. /dev/hda, not /dev/hda1)? Or the other way around?
>=20
> I retried but instead of creating a NTFS FS, I formatted using FAT32
>=20
> zabbix:/etc# mount -t vfat /dev/vg0/testntfs /mnt
> mount: wrong fs type, bad option, bad superblock on
> /dev/mapper/vg0-testntfs,
>       missing codepage or helper program, or other error
>       In some cases useful info is found in syslog - try
>       dmesg | tail  or so
>=20
>=20
> I need to access this data for some backup purpose. Any idea?

Hi Steve!

Yep, connect it via iSCSI ( even on the iSCSI-Target ) before you mount it!


--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
 X        AGAINST HTML MAIL
/ \
