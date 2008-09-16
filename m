Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8GJuSbu000933
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 15:56:29 -0400
Received: from smtp2-g19.free.fr (smtp2-g19.free.fr [212.27.42.28])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m8GJuGDd020278
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 15:56:16 -0400
Received: from smtp2-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp2-g19.free.fr (Postfix) with ESMTP id 902F112B7D9
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:56:14 +0200 (CEST)
Received: from [192.168.1.2] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp2-g19.free.fr (Postfix) with ESMTP id E4B1212B82C
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:56:01 +0200 (CEST)
Message-ID: <48D00F51.5090305@free.fr>
Date: Tue, 16 Sep 2008 21:56:01 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirrored LV
References: <1221592827.6037.57.camel@localhost>
In-Reply-To: <1221592827.6037.57.camel@localhost>
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

Koen Vermeer a =EF=BF=BDcrit :
> Hi,
>=20
> I was thinking of using a mirrored LV as a easier to use alternative to
> a RAID1 PV (with matching VG and LV). I tried to find the information I
> need on how this works and how to set it up, but so far, I failed.
>=20
> First, am I right in trying to use LVM in this way? I have two disks,
> and I just want to mirror some LVs.
>=20
> Second, I am confused by the apparent need to have this log stored on
> another device. Actually, this doesn't seem true in two ways: There's
> the option of having the log in memory and then the documentation only
> says that the log is 'usually on a separate device'. Does that mean that
> using a mirrored LV makes no sense on a system with two disks? Or should
> I just keep the log in memory in this case? Or can I use another PV on
> one of the disks? Should this be mirrored as well? What happens if I
> loose that data?
>=20
>>From what I found when searching for answers, it seems that I'm not the
> only one that's confused... But maybe my searching skills are just
> lacking. Anyway, I appreciate any help and insights!
>=20
> Best,
> Koen
Koen,
I confirm that you have to use 3 disks to mirror a VG with the actual=20
version of software.
At home, having enough disk, I use 3 disks to get my VG/LV mirrored and=20
it works flawlessly since a couple of years.
At work, we have mirrored the PV using 2 devices and the software RAID=20
(md) and build the VG/LV on top of that. It runs flawlessly for 4 years=20
I think (have to check the exact installation date...) So choice is yours...
HAve a nice day.
P.S. At home, I do not use the whole PV for my LV.
Each PV is split in two dissymitrical parts : a small 100 M partition=20
and the rest of the device. The small partition is used for a software=20
RAID (md) to hold the /boot. The rest of the disk as a regular PV used=20
to build the mirrored VG/LV. This way, if one disk breaks I still can=20
boot onto the remaining  one. Of course, it is a manual boot but easier=20
compared to searching a useable rescue CD and the correct kernel=20
version. Think about it.


--=20
If the only tool you have is a hammer, you tend to see every problem as=20
a nail.
                 Abraham Maslow
