Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] hard drive shock tolerance
Date: Sat, 13 Jan 2001 05:51:57 +1100
References: <3A57B052.FA0DFBB2@wrkhors.com> <01011001391323.05036@lyta> <20010110195439.A11865@bar.nowhere>
In-Reply-To: <20010110195439.A11865@bar.nowhere>
MIME-Version: 1.0
Message-Id: <0101130551570E.27982@lyta>
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
To: linux-lvm@sistina.com, zoo1@corecomm.net

On Thursday 11 January 2001 11:54, zoo1@corecomm.net wrote:
> On Wed, Jan 10, 2001 at 01:39:13AM +1100, Russell Coker wrote:
> >My "gut feeling" is that drives are more susceptible to damage now.  I
> > know of cases of older 3600rpm drives being dropped, being hit by a c=
ar
> > while operating (car entered building through the wall of the compute=
r
> > room), and suffering numerous other mechanically damaging events with=
out
> > data loss.  I belive that modern 10K rpm drives are not as solid.
>
> hit by a car? you're serious? i can't even imagine a modern disk

An idiot in the drive of the next house mistook the accelerator pedal in =
an=20
automatic car for the brake, she kept pressing it harder when the car did=
n't=20
stop.
The car entered through a solid brick wall that the computer had been in=20
front of.  The computer ended up on the floor at the far side of the room=
 (~4=20
meters away).
The car was stopped from going further through the house by rubble which=20
supported much of the weight of the car and prevented the rear wheels fro=
m=20
gaining traction.  For some time the car was burning rubber on the spot..=
=2E

> >Also drives are more susceptible to heat problems.  3600rpm drives
> >could operate with all their air-holes blocked and while surrounded by
> >other hard drives without problems.  You can't stack two new 10K rpm
> >drives without good fans.
>
> i'll take your word for it. myself, i never see drives like that in
> PCs, just in workstations and RAID arrays with more than adequate
> cooling; but then again, i don't see PCs much these days anymore.

Most hardware work I do is with PCs.  When dealing with rack mounted serv=
er=20
equipment I generally do the software and someone else deals with the=20
hardware.
Given a choice I prefer hard drives with lower rotational speeds because =
of=20
the lesser heat production.  Read the spec sheets and you'll see that as =
a=20
general rule 10K rpm drives use twice as much power as 7200 rpm drives, t=
wice=20
the power =3D=3D twice the heat!

The really worrying thing about heat death is that it's one of the few wa=
ys=20
that I could imagine two hard drives in a mirrored set dieing before I ge=
t a=20
chance to replace one!

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
