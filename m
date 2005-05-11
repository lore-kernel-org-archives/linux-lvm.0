Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4B931O28087
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 05:03:01 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4B930Hv031746
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 05:03:00 -0400
Message-ID: <4281CA3F.9050509@gmx.net>
Date: Wed, 11 May 2005 11:02:55 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 tools can't locate pvs on entire disks
References: <Pine.A41.4.61b.0505091803260.4722918@mead11.u.washington.edu>	<42804FE7.6000906@gmx.net>
	<Pine.A41.4.61b.0505100810490.3018850@mead12.u.washington.edu>
In-Reply-To: <Pine.A41.4.61b.0505100810490.3018850@mead12.u.washington.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Miles Crawford schrieb:
>=20
> On Tue, 10 May 2005, Klaus Strebel wrote:
>=20
>> Miles Crawford schrieb:
>>
>>>
>>> I'm running into trouble here, getting the lvm scanning tools to=20
>>> notice PVs I have created on entire disks, like this:
>>>
>>> pvcreate /dev/hdd
>>>
>>> Some output:
>>>
>>> root@end root # lvm version
>>>   LVM version:     2.01.04 (2005-02-09)
>>>   Library version: 1.01.00-ioctl (2005-01-17)
>>>   Driver version:  4.1.0
>>> root@end root # uname -a
>>> Linux end.snip.net 2.6.8 #6 Sat Oct 9 20:59:02 PDT 2004 i686 GNU/Linux
>>> root@end root # lvmdiskscan
>>>   /dev/hda1  [      111.79 GB]
>>>   /dev/hdb1  [       18.63 GB]
>>>   /dev/hdd1  [      186.31 GB]
>>>   /dev/hdb2  [      127.59 GB]
>>>   /dev/hdb3  [        2.83 GB]
>>>   0 disks
>>>   5 partitions
>>>   0 LVM physical volume whole disks
>>>   0 LVM physical volumes
>>> root@end root # pvscan
>>>   No matching physical volumes found
>>>
>>> Well that's odd, I know they're there.  Lets try this:
>>>
>>> root@end root # losetup /dev/loop0 /dev/hda
>>> root@end root # losetup /dev/loop1 /dev/hdd
>>> root@end root # pvscan
>>>   PV /dev/loop0   VG media_vg   lvm2 [111.79 GB / 0    free]
>>>   PV /dev/loop1   VG media_vg   lvm2 [186.31 GB / 0    free]
>>>   Total: 2 [298.10 GB] / in use: 2 [298.10 GB] / in no VG: 0 [0   ]
>>
>> Hi Miles,
>>
>> the disks hda and hdb obviously are partitioned (they are shown as=20
>> /dev/hda1 and /dev/hdb1), so don't trying to detroy these partitions,=20
>> he doesn't know what the contents of, is good behaviour of lvm, isn't=20
>> it ;-).
>>
>> Ciao
>> Klaus
>=20
>=20
> So, you're saying that although the lvm PVs are _not_ on partitions, the =

> disklabel still describes some partition on the disk, so lvm is ignoring =

> the disk as a whole as a possible PV?
That's what it looks like, i'd guess lvm will use your whole-disk PVs if=20
you get the partition table cleared. Without this, he'd destroy=20
partitions of unknown types.

Ciao
Klaus
--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
