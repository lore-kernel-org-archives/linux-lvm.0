From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010142339.TAA10100@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Re: vgcreate -- ERROR "lvm_tab_read(): size" inserting...
Date: Sat, 14 Oct 2000 19:39:47 -0400 (EDT)
In-Reply-To: <Pine.GSO.4.10.10010141624510.12772-100000@kurango> from "Mark Phillips" at Oct 14, 2000 04:29:19 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: linux-lvm@msede.com


Mark Phillips writes:
> I'm using LVM for the first time and I got this error:
> 
> # vgcreate main_vg /dev/hda2
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- ERROR "lvm_tab_read(): size" inserting volume group "main_vg"
> into "/etc/lvmtab"
> 
> Can anyone tell me what's wrong?
> 
> All I've did before the above command was make /dev/hda2 into a 8e
> partition and then run:
> 
> # pvcreate /dev/hda2
> pvcreate -- physical volume "/dev/hda2" successfully created
> 
> 
> I thought I'd add a bit of extra information:
> 
> I run Debian Linux.  I am running linux kernel version 2.4.0-test9 and
> have installed LVM tools provided by the Debian package
> lvm_0.8.final-1_i386.deb which corresponds to version 0.8.final of the LVM
> tools.

Try running the patched 0.8final tools on my web site:

ftp://ftp.stelias.com/pub/adilger/lvm*.src.rpm

You will probably need to install the "rpm" package to install and build
the new tools, and then you can use "alien" to convert the .rpm to .deb.
(I have a .deb package at home, but I'm out of town now).

> The other thing I thought of doing is sending the output of
>
>  vgcreate -vd main_vg /dev/hda2
> 
> but first I would need to delete the main_vg that is already there, but I
> can't because of the error:
> 
> # vgremove main_vg
> vgremove -- ERROR: can't remove active volume group "main_vg"
> 
> I can't even display info:
> 
> # vgdisplay
> vgdisplay -- "/etc/lvmtab.d/main_vg" doesn't exist
> vgdisplay -- volume group "main_vg" not found

If you don't have any other LVs, you can safely "rm -r /etc/lvm* /dev/main_vg"
and everything should be working again.  There were a couple of bugs with
the older LVM tools, so it is probably a lot easier on everyone if you start
over with the newer tools.

Cheers, Andreas
