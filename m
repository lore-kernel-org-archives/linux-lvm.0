From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003221725.SAA21066@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] snapshots not stable with 2.3.99pre2
Date: Wed, 22 Mar 2000 18:25:17 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com
Cc: mge@ez-darmstadt.telekom.de

> While testing lvm with linux 2.3.99pre2 I had 2 crashes while trying out snapshots.
> Without snapshots lvm seems to be stable.

Investigating in the area of trouble with 2.3.99pr2 kio support...

> 
> Another problem is (probably) a missing check in lvextend: I tried to extend a
> striped lv, and while I had enough space available, nearly all this space was on
> one pv, so it was not possible to create a correctly striped volume with the 
> extended size. But I didn't get the error message I expected: lvextend told me
> everything is ok, but when I tried to ext2resize the filesystem, I got a 
> segmentation fault.
> 
> 

Could you provide more configuration information by "vgdisplay -v" on the
involved VG, a "lvextend -d" stdout/stderr and an "strace ext2resize" of your
try, please.

Do you get any segfaults when you just read/write to the extended part
of the Logical Volume with dd?

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
