Message-Id: <199908271940.AA21078@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM and devices
Date: Fri, 27 Aug 1999 21:37:13 METDST
In-Reply-To: <37C6AE9E.A93F0D8A@geotec.net>; from "mrharris" at Aug 27, 99 10:28 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mrharris <mrharris@geotec.net>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> I may be a day late and a dollar short here, but I experienced a problem
> this morning when I added a new scsi drive to my 2.2.10 system. I know
> that the os scans for devices when the system boots and assigns device
> names then. Well this screwed up my volume groups because sda1 is now
> sdb1, you get the idea nothing new here. I know this has been discussed
> before.

Run vgscan and VGs should be o.k. again.

> In AIX new devices are assigned and that's the way it stays unless you
> manually delete the device and readd it so that when one of your mirred
> drives gets blown away or you add a drive the assignments are the same
> (more to it than this but you get the idea).  I believe this needs to
> change in linux before LVM is added to the kernel, life would be much
> simpler (md is effected by this as well I beleive). LVM does need to be
> there though, the old way is just that the old way. I don't know how I
> would live without LVM when you manage over 200 systems.  Just my
> opinion.
> 
> add LVM to 2.4 -- YES.
> 

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
