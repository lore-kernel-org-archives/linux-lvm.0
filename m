Message-Id: <199909021631.AA11965@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] question about lvm
Date: Thu, 02 Sep 1999 18:26:38 METDST
In-Reply-To: <EXECMAIL.9909020919.B4883@crow.sep.com>; from "Andrew Sutton" at Sep 2, 99 9:42 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Sutton <ansutton@sep.com>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> i'm not really certain if this is the appropriate place to air a 
> question about lvm problems, but since i couldn't find any other 
> documented support - i figured i'd just go to the source.
> 
> i'm fairly new at using lvm (yesterday) so this is probably just a 
> newbie question... anyway, i installed lvm, rebuilt my kernel (with lvm
> in the kernel), compiled the utilities, the whole thing. i then 
> proceeded to drop 2 pv's into a volume group (vda) and allocate one 
> logical volume (lvol1) consisting of all my disk space. and it worked 
> (at which point i was ecstatic). so i built an ext2fs on the lv and 
> mounted it, and again it worked fine. i then put a line in my fstab to 
> mount it on boot, and rebooted.
> 
> when the machine came back up, the drive was not mounted. when i tried 
> mounting it by hand, i kept getting a "/dev/vda/lvol1 is not a valid 
> block driver" error. using some of the lvm utils, i uncovered the fact 
> that the entire volume group was "inactive".

you have to insert a "vgscan" and a "vgchange -ay" into your 
startup files (see step 9 in file INSTALL in the LVM source top directory)

> 
> i'm not entirely certain what went wrong or where, but i couldn't find 
> any documentation about this particular problem. does anybody have any 
> idea where i might have gone wrong?
> 

Regards,
Heinz

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
