Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] Debian packaging
Date: Thu, 14 Dec 2000 17:22:17 +0100
References: <Pine.LNX.4.30.0012141645040.17005-100000@falka.mfa.kfki.hu>
In-Reply-To: <Pine.LNX.4.30.0012141645040.17005-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Message-Id: <00121417221738.00826@lyta>
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
To: Tamas Gergely <dice@mfa.kfki.hu>
Cc: Linux-LVM@sistina.com

On 2000-12-14 16:50, Tamas Gergely wrote:
>As I noticed the LVM utilities are placed under /usr in this LVM.DEB .

That's what the old package does.

>Wouldn't it be better to use '/' as root not '/usr'?

That's what my development packages (which I have shared with no-one) do.

>I mean, it would be better to place the utilities into /sbin instead of
>/usr/sbin.

Depends.  One thing I would like to do is go through the utilities and pu=
t=20
things that are needed to kickstart a system or to recover a hosed system=
=20
into /sbin .  Then things that aren't so critical to the boot process (lv=
msar=20
springs to mind) belong in /usr/sbin .

>(on many systems /usr is located on an LV. But activiting/disactivating
>using vgchange is impossible after unmounting /usr)

Yes.  My package will differ quite a bit from the existing Debian package=
=2E =20
Also I plan to make everything use shared libraries.  ls, cp, and mv are =
not=20
statically linked so I don't think that there is any need for statically=20
linked lvm utilities.  My lvm package will be considerably smaller than t=
he=20
current one (which is necessary for boot support).

I would appreciate any suggestions on this.  Also if anyone is brave and=20
wants to beta-test my packages then I would be very interested in hearing=
=20
from them.

One other thing, it seems that the protocol is changing often.  How shoul=
d=20
this be managed in Debian packages?  I had thought of doing lvm22 and lvm=
24=20
as package names for the 2.2.x and 2.4.x kernels, but now I get the=20
impression that the interfaces will change between those series.  Also 0.=
8.1,=20
0.9, and 0.8i all seem to have different protocol versions.

This has two problems, one is that users won't know which one they need, =
the=20
other is how to manage an upgrade of a kernel!

I was thinking that perhaps what I should do is have /sbin/lvm-ver and=20
/lib/lvm-ver directories where "ver" is the version of LVM in question.  =
Then=20
at boot time there is a script that determines the version of LVM in the=20
kernel and creates sym-links from /sbin and /lib to the correct directori=
es. =20
This is REALLY ugly, but it enables a user to cleanly have a machine that=
 can=20
be booted on 2.2 or 2.4 kernel and just work each time you boot it.

Any better suggestions?

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
