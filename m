From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002161133.MAA23217@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Installation on Debian (LVM Newbie)x
In-Reply-To: <38AA49DF.A7F19810@tenure.com> from Byron Pearce at "Feb 16, 2000  0:55:27 am"
Date: Wed, 16 Feb 2000 12:33:29 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bpearce@tenure.com
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Pardon the interruption with what I am certain will be considered a
> trivial question, but I just getting on the Linux LVM bandwagon (taking
> the leap from the world of Sun and HP). . .
> 
> I am running a home system with Debian v2.1 and I am trying to determine
> the best way to get things setup.  I have installed the source code into
> the 2.2.13 kernel (yes, I upgraded it) and compiled all support for LVM
> into the kernel, as well as installing the LVM software onto the
> system.  So far, so good.
> 
> When I attempt to run pvcreate as per the LVM-HOWTO, however, it
> complains as follows:
> 
>     # pvcreate /dev/sda1
>     pvcreate -- invalid partition type 0x83 for "/dev/sda1" (must be
> 0x8e)
> 
> If I am understanding this message correctly, it is instructing me to
> make certain the the partition type is set to 8E through cfdisk.

Exactly.

This is to avoid overwriting valuable partitions by accident with pvcreate(8).

> However, I note that this partition type is not defined (or at least
> isn't in my version of Linux).

It is officially registered.
Nevertheless *fdisk have to implement it still.

> Am I observing things correctly or
> missing something obvious?

No, you're right.

> I am assuming that the only way to correct
> this is to change that partition type and to reload Linux.

Yes.
But ou are free to use whole disks with LVM as well.
IOW: all but the boot drive can be used without partitions at all.

> If so,
> that's fine as this is a new system that I am playing with to get
> working.  I assume that I would simply set the partition type on the
> disk to 8E and then move on.  Will Linux boot like this?  Or does it
> require at least a small Linux native partition first?

It does require one, because lilo/milo need them to load th kernel.

> 
> This is a lead into my second question (assuming worst case scenario
> from above) is more general.  I am wondering how the majority of you are
> setting up LVM on your systems.  In a traditional LVM environment (at
> least on the systems I have worked with), the entire physical disk is
> given to the LVM and then the file systems are mounted from the logical
> volumes created in the individual volume groups.  So, assuming an 18GB
> physical SCSI disk, which I have, I would simply create a 18GB "/"
> partition and give this over to LVM as /dev/sda1, from where I would
> create swap, /tmp, /opt, /usr, etc. and mount them from within Linux.

I know.
But with the actual lilo, we can't do that.
If we would not have the IDE contraints (1024 cylinders...) it would make
sense to implement support in lilo (logical to physical sector translation).

It is much more easy just to live with a small 20-30MB boot partition
which even can hold an emergency system setup.
Without beeing able to boot an emergency system from this boot partition,
even a 4-8MB partition would be sufficient.
The only way to boot an LVM system with root ect. in Logical Volumes
today is to setup an initrd configuration.
The lvmcreate_initrd(8) script helps you to create the /boot/initrd.gz
file containing all the necessary files to boot.

Nevertheless you have to create the boot partition, the Logical Volumes
for root ect. and the copy of all files in this LVs yourself today 8-{(

BTW: the solution to have a ~100MB root filesystem in a partition
     and all the rest in Logical Volumes is preferable anyway.

> 
> Is there a gotcha involved that I may be missing?  On some systems, you
> have to leave a small partition out of the LVM to mount the bootstrap
> O/S from (say, a 20MB partition or so) and then everything else can be
> under the LVM.  I am just trying to make certain that if I have to
> reload, that I only have to do it once and that I setup the disks
> correclty.
> 

Heinz
-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
