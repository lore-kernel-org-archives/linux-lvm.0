Message-Id: <199910181655.AA11114@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] FAQ Question not found
Date: Mon, 18 Oct 1999 18:54:14 METDST
In-Reply-To: <000801bf197e$45d7af80$0ebcfea9@brd>; from "Nicolas Brouard" at Oct 18, 99 5:34 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brouard@ined.fr
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Nicolaus.

> 
> I have used and appreciated LVM on AIX for years. The main use for me
> consisted in having initially a hard disk too big for my actual but
> increasing needs.
> It was very nice to increase a filesystem like /home /usr/local or /var when
> mail traffic increased.
> Now I have a similar need. I am using a laptop with 2Gb. I bought a 6Gb hard
> disk which should replace the old one. I would like to have at the beginning
> 2Gb for Win98 and some initially small logical volumes for a Linux system.
> With my 2Gb old disk, I used 1Gb for Windows and 1Gb for Linux.
> 
> Is it a good idea to try to implement LVM for the linux partition?

Yes 8*)

> How does it deal with other partitions and the limitation to 4 primary partitions.

Regular and LVM used partitions can coexist on the same disk(s).

> How to begin? Should I first install Linux with arbitrary partitions, and
> then build a LVM kernel and then? I do only have one physical disk and can't
> play so much with other partitions.

Yes, install a basic root only system which doesn't eat to much of your space,
install LVM, setup VG(s) and LVs (for /usr, /opt etc), build filesystems,
mount them and transfer data from your small root fs to the corresponding LVM
based filesystems, change /etc/fstab, put vgscan and "vgchange -ay" into your
system startup script (for eg. /sbin/init.d/boot for SuSE) before ext2 mounts
and reboot.

Install additional packages.

> 
> In fact I do not understand how it works. On AIX, all the disk was managed
> with LVM?

With Linus LVM you are free to manage some disks/partitions or all.

> Here, can I decide that logical volume manager will only deal with
> a big ext2 partition. And within this partition I would be able to have
> variable sized /var /home / ?

No, no ext2 partition. In fact you can use loop devices for evaluation purposes.

But this is _not_ recommended for production systems.
Use disk partitions, mutliple devices or total disks instead.

In pratice only having 1 disk in the first place, use at least 1 partition,
set the partition identifier to 0xfe with fdisk,
do a "pvcreate /dev/YourPartition", "vgcreate YourVG /dev/YourPartition"
and some lvcreate(s). For further command information, please have a look
at the corresponding manuals.

> 
> I would appreciate any help, even if it is: Ok, do fixed partitions and not
> LVM!
> 

Regards,
Heinz

Please look into lvm(8) and LVM-HOWTO for additional information.

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
