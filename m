From: Stefan Weigel <sw@global-linxs.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210170859.03682.sw@global-linxs.de>
Subject: [linux-lvm] Re: problem with lvm on root-fs
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Oct 17 02:01:42 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi erveryone!
I'm a little bit closer now. I've create an initrd with lvmcreate_initrd.
In this initrd there was no module for my mylex-raid-controller. I've fix=
ed=20
that problem, e.g. put the kernel module in it and changed linuxrc.
After rebooting there's another kernel panic, but on this time the system=
=20
finds my volume groups. Output:

kernel panic: no init found. Try passing init=3D to...

This is a little bit strange. I checked the initrd another time and in th=
e=20
ramdisk-bin-dir there's the bash and sh.
A little help would be nice!

Greetings

Stefan Weigel

P.S.: I'm using SLES7.2 with the standard-packages.

> Hi!
> I'm trying to get lvm on my root-fs working. But there's is an kernel-p=
anic=20
> error. Some details:
>
>
> - system with Mylex RAID-controller (DAC960). It's included in the init=
rd.
>
>
> - root-partition is /dev/rd/c0d0p1
>
>
> I used the HowTo from sistina.com, copied the files from /dev/rd/c0d0p1=
 to=20
> /dev/sysvg/rootlv, edited the /etc/fstab pointing to the new partition=20
> /dev/sysvg/rootlv.
> I made a reboot and everything worked fine. But in /etc/lilo.conf there=
's=20
> the=20
> entry root=3D/dev/rd/c0d0p1. I changed this entry to /dev/sysvg/rootlv.=
 Then I=20
> run lilo. After another reboot I got the kernel panic.
> The initrd is IMO working. But when I change the "root=3D" entry in=20
> /etc/lilo.conf a kernel panic occurs.
> Can anybody help me ??
>
>
> Best regards=20
>=20
>
> Stefan Weigel
