From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003201131.MAA05896@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] 0.8i --> 0.8final
In-Reply-To: <200003201130.MAA05698@u9etz.ez-darmstadt.telekom.de> from Heinz Mauelshagen at "Mar 20, 2000 12:30: 2 pm"
Date: Mon, 20 Mar 2000 12:31:08 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com

> Hi
> 
> I tried to migrate my system (currently running 2.2.14 / 0.8i with devfs)
> to 2.3.99-pre1 with the lvm patch applied. I built the new user space
> tools and copied the new vgscan and vgchange and liblvm.so to my initrd
> image (as i'm using root on LVM) and tried to boot. It failed as the
> vgscan reported no volume groups! I was unable to debug further as I can't
> boot into anything using this new kernel now - so i've reverted to 2.2.14.
> Any ideas?

The new lib uses /proc/partitions to figure out the existing block devices
by default.

Did you create your initrd file with the new lvmcreate_initrd, which
takes care of mounting /proc?

> 
> CHeers!
> 
> James
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
