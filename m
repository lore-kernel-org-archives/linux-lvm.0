Message-Id: <199902171307.AA03826@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: your mail
Date: Wed, 17 Feb 1999 14:05:32 MET
In-Reply-To: <99021711471501.00456@piglet>; from "Mark Alleyne" at Feb 17, 99 11:45 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marka@a-wicked.demon.co.uk, linux-lvm@msede.com
Cc: mge@u9ete.ez-darmstadt.telekom.de

> 
> Hello,
> 
> Firstly  great product,

Thanks.

> but have a couple of questions
> 
> 1.  will we be able to use this as our boot disk [vg00]

Yes, but not supported with the standard distribution.
Hope to have supprt in the next release.

>  
> 2.  has anyone tested if lilo can handle /dev/vg00/lvol1 so it knows how to

No, it can't because it deals with sectors on a single boot disk.

You have to have a (small) boot partition (for eg. /dev/sda5) to boot
from and have to change to the real-root-dev in a LV after activating
volume groups.

>       boot the kernel,  I would assume changes would need to be made to allow
>       lilo to issue a vgchange on the [vg00] volume group.

LILO had to be enhanced to be able to load sectors from multiple disks
if the root logical volume is not continuous.
If it must stay continuous for LILO to be able to address kernel sectors
to load there would not be a real enhancement compared
to booting from a hard disk partition.
On Intel compatible PCs BIOS restrictions limiting the number of
BIOS addressable disks apply too (LILO uses the BIOS).


> Or could we leave
>       /boot  as a disk section and build into the kernel the ability to active
>       [vg00] ??

Yes, we could boot with LILO form a partition based boot FS and enhance
the LVM driver init stuff to activate LV root.
But this driver overhead is not necessary, if we boot from a small
partition based fs anyway.
OTOH it would make sense if LILO could directly load the kernel image from a LV.

> 
> 3.  are there plans for LVM-MIRRORING

Yes, but no fixed time frame 8*(

> 
> 4.  for allowing root on lvm, is their anny recommended file system sizes and
>         should contingous be set for /boot ?

/boot must be in a regular disk partition containing basic commands,
device specials and LVM driver/commands.
About 20-30MB should be sufficient to set this up.

> 
> Sorry if some of these questions have been duplicated, at time of writing
> couldn't see anything in the archive listing.
> 

Maybe you like to subscribe to our new linux-lvm maling list at
linux-lvm@msede.com by sending a "subscribe linux-lvm" in the body of the mail
to majordomo@msede.com.


Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
