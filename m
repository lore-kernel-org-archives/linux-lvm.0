Date: Thu, 12 Oct 2000 10:26:13 +0200
From: =?iso-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>
Subject: Re: [linux-lvm] Very tricky new install of Linux (using LVM and Kernel 2.4)
Message-ID: <20001012102613.A15196@pdc.kth.se>
References: <20001012160136.E413@destiny.ist.flinders.edu.au>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20001012160136.E413@destiny.ist.flinders.edu.au>; from mark@ist.flinders.edu.au on Thu, Oct 12, 2000 at 04:01:36PM +0930
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: linux-lvm@msede.com

On Thu, Oct 12, 2000 at 04:01:36PM +0930, Mark Phillips wrote:
> I have recently bought an IBM 15 Gig drive and want to do a new
> install of Debian Linux on it.  Fairly straightforward _except_...
>=20
> I want to install it on logical partitions using LVM.  This introduces
> a number of problems.  Firstly I need kernel 2.4 to use LVM.  I've
> compiled my own 2.4-test9 kernel and it runs fine on my old disk
> (using debian).  But the debian installation disk uses an older
> kernel, nor will it probably know how to cope with LVM.
>=20
> I am currently toying with a number of strategies for how to do the
> install.  Here are my ideas so far:
>=20
>=20
> Plan 1.  Boot under my old disk, and from here, create and format all
> the required partitions on top of LVM on my new disk.  Then see if I
> can somehow put my own 2.4 kernel on the debian rescue disk (the one
> used for installing).  I'm not sure how this is done, but I think it
> can be.  Then boot using this disk, mount the partitions of the new
> disk manually, and then hope the rest of the install goes okay.

This would be the best way to do it.  But not the easiest I think.

> Plan 2.  Create a normal partition on my new drive, using a single
> partition covering roughly half my new disk.  Install debian on this
> partition in the usual way.  Get it set up with the 2.4 kernel and
> have everything working more or less.  Then create a second partition
> covering roughly the other half of the disk.  Create a LVM volume
> group consisting of just this partition.  Create several logical
> partitions on this volume group.  Then copy across all the stuff from
> the newly installed debian onto the logical partitions.  That way I
> have two identical installs of debian, one on a single physical
> partition, the other on several logical ones.  Make sure the LVM
> installation works fine, then delete the physical installation
> partition.  Then add the physical partition it was on, to the volume
> group of the LVM installation.

This is more or less what I did.  But you only need a small partition to
install to.

I can give you some step-by-step-instructions. Maybe other people like=20
them too.

*) compile a new kernel on another computer (use make-kpkg so you get a
   debian-package
*) Create two small partitions one for / and one for swap (I used 60MB for
   /)
*) install debian the usual way.
*) After the base stuff is installed, install the new kernel-package and
   reboot
*) remove the swap-partition (swapoff -a and fdisk)
*) create a lvm-partition, and do pvcreate.
*) create a vg
*) create lv's for swap, usr, var, tmp and so on
*) fix the swap and start it
*) create filesystems on the lv's (I use reiserfs and am really happy with
   it)
*) move data from /usr to the lv for /usr; mv /usr /usr.old; mount the new
   /usr,  do the same for the other lv's. (remember to chmod /tmp correctly
   or you'll run into problems :) )
*) edit /etc/fstab and add all the filesystem (don't forget the swap).

I left / on a none-lvm partition just because it's the easiest way to do
it and you normaly don't need to resize it or anything.

*) reboot to make sure everything comes up right.
*) finnish the debian-installation (dselect or apt-get or whatever).

If you use reiserfs you can resize online and if your system crashes it
will come upp safe (and fast).  I wrote a small perl-script to do the
resizing for me.

I still need to convert my / to reiserfs :)

/Erik
--=20
Erik B=EF=BF=BDgfors               | Center for Parallel Computers
http://erik.bagfors.nu/    | http://www.pdc.kth.se/
erik@bagfors.nu            | bagfors@pdc.kth.se =20
Supporter of free software | GSM +46 70 398 54 43=20
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
