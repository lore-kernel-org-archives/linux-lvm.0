Message-Id: <199906180656.AA25684@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
Date: Fri, 18 Jun 1999 8:56:16 METDST
In-Reply-To: <m10umJP-0000YbC@duffy1.franken.de>; from "Rolf Jakob" at Jun 18, 99 2:15 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rolf Jakob <rjakob@duffy1.franken.de>
Cc: linux-lvm@msede.com, mge@ts1.ez-darmstadt.telekom.de


Hello Jakob.

> as stated before lvm works with the devfs-patch-v99. Now I use a
> Linux 2.2.9 with lvm, devfs and dtfs patched in.
> (There is devfs-patch-v99-3, I haven't tried yet).

Good to hear.
devfs support is already in the LVM TODO.

> 
> What would be nice as the next step is a resizable file system.
> Is there any ?
> 

AFAIK we only have Ted Tso's resize2fs which is able to resize
unmonted ext2fses.

It will be available under GPL next year.

For today you are only able to have an Intel binary copy
as a Quarterdesk Partition Magic customer.

If you have the resize2fs binary the LVM e2fsadm(8) command is able 
to resize a logical volume _and_ the contained ext2fs.

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
