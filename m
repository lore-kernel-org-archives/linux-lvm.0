Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n14ENxI3022432
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 09:23:59 -0500
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n14ENbpK007797
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 09:23:40 -0500
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9F2634B01FB
	for <linux-lvm@redhat.com>; Wed,  4 Feb 2009 15:23:35 +0100 (CET)
Received: from [192.168.1.4] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9F6F54B015A
	for <linux-lvm@redhat.com>; Wed,  4 Feb 2009 15:23:32 +0100 (CET)
Message-ID: <4989A4E3.6040201@free.fr>
Date: Wed, 04 Feb 2009 15:23:31 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Query regarding conversion of root partition to LV
References: <a80c86b70902040505l257e8ab8k4bad5ac121520e3f@mail.gmail.com>
In-Reply-To: <a80c86b70902040505l257e8ab8k4bad5ac121520e3f@mail.gmail.com>
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

Prateek Donni a =C3=A9crit :
> I have a fedora 9 installation with two partitions swap and /
> partition. Now i want to mirror the files on the root partition to
> another disk using LVM mirroring. Since i dint make root on a LV and
> have no allocated space left so i am thinking of using the free space
> on the root partition as a block device that can be converted into PV
> and then mirrored after making it a LV.
> Is this feasible?
> Can someone let me know wht can be done?
>=20
> Thanks
> Prateek
>
Hi Prateek !
IMHO this won't work.
As you spoke about mirroring, you can do this :
1) add another disk to the system (ideally same size of the original one)
2) partition it as :
	part #1 used as /boot (about a 100 MB, Ext2/3 FS )
	part #2 the remaining of the disk tagged as LVM.
3) boot your system under Fedora 9 and using LVM mamger create a PV ont=20
the second partition, then a VG on the PV and then as much LV as you=20
need. Do not forget to create the swap LV.
4) Format and temporary mount each LV ont the filesystem, recreating the=20
correct layout but under, say, /mnt.
5) copy the data using a command like : cd / && tar cf - . |(cd /mnt &&=20
tar xf -)
6) under the /mnt layout correct the Grub menu file, then using this as=20
the root with chroot, re-run grub-install.
7) boot under the new disk and test your system.
If fine,
8) create the same partition layout on the old disk as the new one and=20
create 2 software raid 1 (mirror) using mdadm, one for the first=20
partition used as /boot , the other one for the PV.
9) synchronize the md.
Enjoy.
Be carefull and read the man pages before proceding. A complete backup=20
may prove usefull, also.
Hope this helps.

--=20
If the only tool you have is a hammer, you tend to see every problem as=20
a nail.
                 Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.
