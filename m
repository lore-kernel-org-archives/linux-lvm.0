Date: Thu, 12 Oct 2000 18:26:27 +0930
From: Mark Phillips <mark@ist.flinders.edu.au>
Subject: Re: [linux-lvm] Very tricky new install of Linux (using LVM and Kernel 2.4)
Message-ID: <20001012182627.G413@destiny.ist.flinders.edu.au>
References: <20001012160136.E413@destiny.ist.flinders.edu.au> <20001012102613.A15196@pdc.kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20001012102613.A15196@pdc.kth.se>; from bagfors@pdc.kth.se on Thu, Oct 12, 2000 at 10:26:13AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>
Cc: linux-lvm@msede.com

Erik B=E5gfors [bagfors@pdc.kth.se] wrote:

> This is more or less what I did.  But you only need a small partition to
> install to.

Thanks for this!  I have since been thinking about a similar plan,
though I was thinking of perhaps initially installing the basic
installation on another drive and then copying it across to my new
drive (on LVM partitions).  That way I could have / under LVM as well
if I wanted.

I have a few questions:

1. What is a safe way of copying between partitions?  Ie is there a
risk of corruption?

2. How stable is LVM?  Is it worth having your / partition as a real
partition (not a LV) just for reliability sake?  I agree that having a
non LVM / partition makes things easier to boot up, but is this the
only concern, or are there other reasons for not making / LVM?

3. How much space did you give to /?  I'm not sure how much you would
need.  And what parts of the filesystem did you chose to put on LVM?

4. How did you deal with the 8Gig disk barrier (assuming you have a
disk bigger than this)?  Did you also have a /boot partition, or did
you just include this in your / partition?

5. Doesn't reiserfs have some stability problems and problems with nfs
and a few other issues?  Also do you need to patch the 2.4.0-test9
kernel in order to get reiserfs?  Is reiserfs going to make it into
the 2.4 kernel?


Thanks again for your help.  It was very informative.

Cheers,

Mark.


>=20
> I can give you some step-by-step-instructions. Maybe other people like=20
> them too.
>=20
> *) compile a new kernel on another computer (use make-kpkg so you get a
>    debian-package
> *) Create two small partitions one for / and one for swap (I used 60MB for
>    /)
> *) install debian the usual way.
> *) After the base stuff is installed, install the new kernel-package and
>    reboot
> *) remove the swap-partition (swapoff -a and fdisk)
> *) create a lvm-partition, and do pvcreate.
> *) create a vg
> *) create lv's for swap, usr, var, tmp and so on
> *) fix the swap and start it
> *) create filesystems on the lv's (I use reiserfs and am really happy with
>    it)
> *) move data from /usr to the lv for /usr; mv /usr /usr.old; mount the new
>    /usr,  do the same for the other lv's. (remember to chmod /tmp correct=
ly
>    or you'll run into problems :) )
> *) edit /etc/fstab and add all the filesystem (don't forget the swap).
>=20
> I left / on a none-lvm partition just because it's the easiest way to do
> it and you normaly don't need to resize it or anything.
>=20
> *) reboot to make sure everything comes up right.
> *) finnish the debian-installation (dselect or apt-get or whatever).
>=20
> If you use reiserfs you can resize online and if your system crashes it
> will come upp safe (and fast).  I wrote a small perl-script to do the
> resizing for me.
>=20
> I still need to convert my / to reiserfs :)
>=20
> /Erik
> --=20
> Erik B=E5gfors               | Center for Parallel Computers
> http://erik.bagfors.nu/    | http://www.pdc.kth.se/
> erik@bagfors.nu            | bagfors@pdc.kth.se =20
> Supporter of free software | GSM +46 70 398 54 43=20
> fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32

--=20
_/~~~~~~~~\___/~~~~~~\____________________________________________________
____/~~\_____/~~\__/~~\__________________________Mark_Phillips____________
____/~~\_____/~~\________________________________mark@ist.flinders.edu.au_
____/~~\HE___/~~\__/~~\APTAIN_____________________________________________
____/~~\______/~~~~~~\____________________________________________________
__________________________________________________________________________
        "They told me I was gullible ... and I believed them!"=20
