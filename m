Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] any way to locate vg's on, say, /etc?
Date: Wed, 10 Jan 2001 01:39:13 +1100
References: <3A57B052.FA0DFBB2@wrkhors.com> <0101090031381K.05036@lyta> <3A5AAF8C.305C862D@wrkhors.com>
In-Reply-To: <3A5AAF8C.305C862D@wrkhors.com>
MIME-Version: 1.0
Message-Id: <01011001391323.05036@lyta>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Steven Lembark <lembark@wrkhors.com>
Cc: linux-lvm@sistina.com

On Tuesday 09 January 2001 17:28, you wrote:
> > Why is it impossible for make LVM configuration something that gets
> > started automatically at boot when it's possible to make RAID start a=
t
> > boot?
>
> see above:  if you store enough data to vgimport the
> volumes at boot time (however it is done) then you
> don't need to store the volume group inodes in any
> persistent storage.
>
> catch is that storing all of the data used to recover the
> media on the media to be recovered makes recovery more
> difficult when the media fries [not if].

For serious systems hard disk failure modes should be considered as discr=
ete=20
events.  A hard drive is either working perfectly (all data written is re=
ad=20
back correctly) or it is failed (it has returned an error so we put it=20
offline and replace it with a hot spare or send an emergency alert to the=
=20
administrator).
All data should be mirrored.  Hard drives are cheap.  I recently bought=20
myself two 46G hard drives for less than I once paid for a single 70M dri=
ve,=20
and less than I later paid for a 330M drive.
My "gut feeling" is that drives are more susceptible to damage now.  I kn=
ow=20
of cases of older 3600rpm drives being dropped, being hit by a car while=20
operating (car entered building through the wall of the computer room), a=
nd=20
suffering numerous other mechanically damaging events without data loss. =
 I=20
belive that modern 10K rpm drives are not as solid.
Also drives are more susceptible to heat problems.  3600rpm drives could=20
operate with all their air-holes blocked and while surrounded by other ha=
rd=20
drives without problems.  You can't stack two new 10K rpm drives without =
good=20
fans.

If things are correctly setup then you can lose a single drive at any tim=
e=20
without data loss.  If LVM on-disk data structures can be recovered with =
a=20
drive dead (which is the case if LVM is running on top of RAID 1) then th=
ere=20
shouldn't be a problem.

IMHO if you run LVM across multiple disks without RAID-1 backing then you=
=20
probably don't care much for your data.  Probability of no-failure of the=
=20
system is obtained by multiplying the probability of no-failure of each p=
art.

So if during a time period there is a 10% chance that a hard drive will f=
ail=20
then the probability of no-failure is 0.9.  Therefore the probability of =
two=20
drives in an LVM set not failing is 0.81 over the same time period.

> > One thing that I plan to do is create LVM, devfs, and RAID rescue dis=
ks
> > for Debian.  So far I have not had time.  :(
>
> if your software RAID gets blown you're in pretty deep
> water.  HP's trick of forcing the boot, primbary swap

RAID rescue disks does not inherantly mean rescue from RAID problems.  It=
=20
also means that if (for example) you have a non-autodetect RAID setup and=
 you=20
want to fix config files on that file system that prevent booting (eg a=20
corrupted /etc/fstab) then you can do it.  Also you need RAID enabled res=
cue=20
disks to install onto RAID in the first place, or to make a non-RAID root=
=20
file partition into a RAID partition.

> and root voumes to be on contiguous storage from cyl0
> makes recovering LVM a snap:  just boot without it,

If I did that then I'd only have one other file system left on most of my=
=20
machines and thus would not be able to achieve much benefit from LVM!

> q:  what is there to recover from a damaged devfs?  i
> though the entire file system was virtual (a la /proc).

Correct, Devfs can't get damaged in any way that a reboot won't fix
(rm -rf /dev/* will be hard to fix without a reboot).

But if you use devfs for /etc/fstab, /etc/lilo.conf, etc then using rescu=
e=20
disks that don't support devfs will be painful for you.  Also once you st=
art=20
using devfs everywhere you get used to the device names and don't want to=
=20
stop using them (having to remember two names for everything is painful).

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
