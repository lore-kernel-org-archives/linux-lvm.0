Message-Id: <199910192313.AA15213@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] how to remove PV from a VG?
Date: Wed, 20 Oct 1999 1:12:41 METDST
In-Reply-To: <19991019231507.A337@redneck.sk.oracle.com>; from "Adrien Farkas" at Oct 19, 99 11:15 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: freddy@sk.oracle.com
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Hey folks,
> 

Hi Freddy.

> the subject says it (almost) all, I need to remove three PVs that were added to my VG by mistake (namely /dev/sdi, /dev/sdj and /dev/sdk), I guess you see where the error is. I can access data on previous PVs (yet), but don't know how to remove PVs, there is nothing linke 'pvremove'. I can assure you there is no data (perhaps except signature) on those disks.
> 

vgreduce YourVG /dev/sd[i-k]

- or, if the 3 partitions hold the only empty PVs of YourVG -

vgreduce -a YourVG


> Another question regarding devfs, some time ago a guy had a problem with devfs and 'smart' libs and Heinz pointed him to mailing list archives to look for patches. I did so, too (because I have tha same probs) but didn't find anything regarding this issue, anyone can help me with this?


I don't recall if it was me 8*)

If you refer to the code in tools/lib/pv_read_all_pv.c which tried to
optimize performance while scanning the device special files, you can
comment out lines 103-105 and 107 to fix this.

HTH.

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
