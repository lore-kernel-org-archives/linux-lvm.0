Message-Id: <199902171032.AA25705@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] root filesystem in lvm
Date: Wed, 17 Feb 1999 11:30:07 MET
In-Reply-To: <003401be5a59$6a3c04a0$6630aec1@trpc.dkfz-heidelberg.de>; from "Tobias Reber" at Feb 17, 99 10:39 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tobias.reber@dkfz-heidelberg.de, linux-lvm@msede.com
Cc: mge@u9ete.ez-darmstadt.telekom.de

> 
> On a test system I have put the root filesystem into lvm. Everything works
> fine, however during shutdown I cannot vgchange -a n to the volumegroup,
> where the root filesystem sits. Does that any harm?

No it doesn't because "vgchange -an" does not write anything back to the
physical volumes these days.
The only cause for documenting this is to go the "clean" way to stop subsystems
before halt/reboot.

BTW: would you mind sending your solution to the list?
     Tried an hour or so by myself but run into trouble doing
     the switch from the boot partion to real-root-dev in a LV 8*(

> Also did anybody out there look into lilo in order to make the kernel
> bootable from an lvm volume?

Not that i'm aware of.


> IMHO lvm looks very keen especially if you have
> large disks, where you still have only 8 partitions. I prefer having my
> filesystem spread out into several partitions for /, /usr and so forth.

Yep.


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
