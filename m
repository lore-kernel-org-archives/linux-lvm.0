Date: Thu, 12 Oct 2000 16:01:36 +0930
From: Mark Phillips <mark@ist.flinders.edu.au>
Subject: [linux-lvm] Very tricky new install of Linux (using LVM and Kernel 2.4)
Message-ID: <20001012160136.E413@destiny.ist.flinders.edu.au>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I have recently bought an IBM 15 Gig drive and want to do a new
install of Debian Linux on it.  Fairly straightforward _except_...

I want to install it on logical partitions using LVM.  This introduces
a number of problems.  Firstly I need kernel 2.4 to use LVM.  I've
compiled my own 2.4-test9 kernel and it runs fine on my old disk
(using debian).  But the debian installation disk uses an older
kernel, nor will it probably know how to cope with LVM.

I am currently toying with a number of strategies for how to do the
install.  Here are my ideas so far:


Plan 1.  Boot under my old disk, and from here, create and format all
the required partitions on top of LVM on my new disk.  Then see if I
can somehow put my own 2.4 kernel on the debian rescue disk (the one
used for installing).  I'm not sure how this is done, but I think it
can be.  Then boot using this disk, mount the partitions of the new
disk manually, and then hope the rest of the install goes okay.

Plan 2.  Create a normal partition on my new drive, using a single
partition covering roughly half my new disk.  Install debian on this
partition in the usual way.  Get it set up with the 2.4 kernel and
have everything working more or less.  Then create a second partition
covering roughly the other half of the disk.  Create a LVM volume
group consisting of just this partition.  Create several logical
partitions on this volume group.  Then copy across all the stuff from
the newly installed debian onto the logical partitions.  That way I
have two identical installs of debian, one on a single physical
partition, the other on several logical ones.  Make sure the LVM
installation works fine, then delete the physical installation
partition.  Then add the physical partition it was on, to the volume
group of the LVM installation.


I'm interested in feedback on these two plans.  Which is best?
Problems?  Alternative plans etc?  Oh, and with plan 2, what is the
safest way to do large scale copying from one partition to another?

Cheers,

Mark.


-- 
_/~~~~~~~~\___/~~~~~~\____________________________________________________
____/~~\_____/~~\__/~~\__________________________Mark_Phillips____________
____/~~\_____/~~\________________________________mark@ist.flinders.edu.au_
____/~~\HE___/~~\__/~~\APTAIN_____________________________________________
____/~~\______/~~~~~~\____________________________________________________
__________________________________________________________________________
        "They told me I was gullible ... and I believed them!" 
