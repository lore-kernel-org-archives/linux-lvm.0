Message-Id: <199904202237.AA04089@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Swap/DB devices
Date: Wed, 21 Apr 1999 0:34:51 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


On Sat, 17 Apr 1999 21:03:50 +0100 (BST), Stephen Tweedie
<sct@redhat.com> said:

> 
> On Sat, 17 Apr 1999 13:22:29 METDST, Heinz Mauelshagen
> <mauelsha@ez-darmstadt.telekom.de> said:
> 
> > The LVM lib creates the device special nodes dynamically if a logical volume
> > is created by lvcreate(8) or found by vgscan(8)/vgimport(8).
> 
> > LVM function lv_create_node() has to be extended to create the raw
> > device too.  The LVM driver can then be accessed by that raw device
> > node _without_ modification.
> 
> No, it doesn't work that way.  The major/minor numbers for the raw
> devices are 100% meaningless.  Creating a raw device inode is all very
> well, but it won't do anything AT ALL until you have done a raw ioctl to
> bind it to a block device.

O.k., o.k ;*)

Didn't see your recent major raw-io rewrite which avoids
the problems of the earlier implementaion.

But my argument basically stays the same.

If i want to have raw i/o specials for the LVM, i'ld prefer to
extend the LVM library and the tools to do the job.
The user does have the option to create and bind them 'by hand' anyway.

> 
> As long as you can create the LVM block devices either in some known
> location or with some known block device number, you can then bind a raw
> device on top without any changes to the driver underneath.
> 

Yes.
Let the LVM lib/tools do it for the user.

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
