Message-ID: <001b01bf3c16$21b32980$7b0c86c0@ined.fr>
From: "Nicolas Brouard" <brouard@ined.fr>
References: <199910181655.AA11114@mailgate1b.telekom.de>
Subject: [linux-lvm] Gated and Re:  FAQ Question not found
Date: Wed, 1 Dec 1999 17:07:04 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

Thanks a lot to people having answer my naive question : experimenting =
LVM on a laptop with only one physical hard disk.

I haven't had the opportunity to test LVM with my new 6.4Gb (Toshiba) on =
my Dell Xpi 133MHZ laptop.
The reason is that I got problems with this disk during a fdisk action: =
I partitionned the disk with one primary partition for Windows98 and an =
extended partition for the rest of the disk. I used WIndows fdisk for =
creating windows primary and extended partitions and used Linux fdisk to =
create linux partitions within the extended partitions. The problem I =
got is that the controller of the disk tried to read, apparently, wrong =
sectors, and started to make noise and bangs. I stopped the computer and =
rebooted with the already defined partitions (Windows and linux) and it =
worked. But when I tried to use fdisk on windows to create other =
partitions like D: for windows,  it started again to bang and this time =
it was fatal. The disk was no more recognized at boot time (it is not a =
MBR problem but a hardware problem) and I am waiting for a new disk from =
the constructor even if I don't know  the reason for the break. So, I =
haven't had time to play with LVM with this disk!

Concurrently I also upgraded my desktop, a Dell XPs 166 MHZ, from 2.6 GB =
to 8.4 GB. I downloaded the new bios and the sytem was now able to =
recognize the disk in auto mode. I have been able to setup again Windows =
and Linux (using xcopy32 for Windows and a simple tar for Linux) by =
copying the old disk on the new one (on a desktop we have place for two =
disks, not on a laptop).=20

Everything was fine. But looking at the WEB on how to do easier =
partitionning, I founded "Partition magic" (on WIndows) which is =
commercial and  "parted" on Linux which is free but still experimental. =
I installed parted on linux. But unfortunately, parted told me that the =
real size of my new disk did not correspond to what was written in the =
master boot record. In fact gated was correct, the Dell Bios (even if =
updated) did a wrong translation address and  I was losing 500 Mb.=20

I lacked of courage to force the Dell bios to work with fixed Cylinder =
Head (I am under but close to the 8.4 GB limit) and to reformat all the =
Windows and Linux partitions and to reimplement everything.

So, now  I have a working system but I am not able to play with =
partitions and to implement LVM. But I discovered the existence of =
"gated", even if I haven't been able to experiment it.=20

And here is my question:
Is "gated" a serious alternative to LVM? I am not trying to add "online" =
a new disk and, still online, remove the old one, with a nice LVM which =
tranparently copies the old disk to the new one. That kind of operation =
was possible on AIX LVM. But I am simply trying to find a tool which =
increases progressively the size of my different partitions according to =
my changing needs. "Gated" seemed to do the job.

Any remark on gated?

Nicolas Brouard
brouard@ined.fr

=20
----- Message d'origine -----=20
De : Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
=C0 : <brouard@ined.fr>
Cc : <mge@ts1.ez-darmstadt.telekom.de>; <linux-lvm@msede.com>
Envoy=E9 : lundi 18 octobre 1999 19:54
Objet : Re: [linux-lvm] FAQ Question not found



Hi Nicolaus.

>=20
> I have used and appreciated LVM on AIX for years. The main use for me
> consisted in having initially a hard disk too big for my actual but
> increasing needs.
> It was very nice to increase a filesystem like /home /usr/local or =
/var when
> mail traffic increased.
> Now I have a similar need. I am using a laptop with 2Gb. I bought a =
6Gb hard
> disk which should replace the old one. I would like to have at the =
beginning
> 2Gb for Win98 and some initially small logical volumes for a Linux =
system.
> With my 2Gb old disk, I used 1Gb for Windows and 1Gb for Linux.
>=20
> Is it a good idea to try to implement LVM for the linux partition?

Yes 8*)

> How does it deal with other partitions and the limitation to 4 primary =
partitions.

Regular and LVM used partitions can coexist on the same disk(s).

> How to begin? Should I first install Linux with arbitrary partitions, =
and
> then build a LVM kernel and then? I do only have one physical disk and =
can't
> play so much with other partitions.

Yes, install a basic root only system which doesn't eat to much of your =
space,
install LVM, setup VG(s) and LVs (for /usr, /opt etc), build =
filesystems,
mount them and transfer data from your small root fs to the =
corresponding LVM
based filesystems, change /etc/fstab, put vgscan and "vgchange -ay" into =
your
system startup script (for eg. /sbin/init.d/boot for SuSE) before ext2 =
mounts
and reboot.

Install additional packages.

>=20
> In fact I do not understand how it works. On AIX, all the disk was =
managed
> with LVM?

With Linus LVM you are free to manage some disks/partitions or all.

> Here, can I decide that logical volume manager will only deal with
> a big ext2 partition. And within this partition I would be able to =
have
> variable sized /var /home / ?

No, no ext2 partition. In fact you can use loop devices for evaluation =
purposes.

But this is _not_ recommended for production systems.
Use disk partitions, mutliple devices or total disks instead.

In pratice only having 1 disk in the first place, use at least 1 =
partition,
set the partition identifier to 0xfe with fdisk,
do a "pvcreate /dev/YourPartition", "vgcreate YourVG /dev/YourPartition"
and some lvcreate(s). For further command information, please have a =
look
at the corresponding manuals.

>=20
> I would appreciate any help, even if it is: Ok, do fixed partitions =
and not
> LVM!
>=20

Regards,
Heinz

Please look into lvm(8) and LVM-HOWTO for additional information.

--

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum =
Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
