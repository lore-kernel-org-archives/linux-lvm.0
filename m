Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
Date: Thu, 21 Dec 2000 08:40:47 +1100
References: <Pine.LNX.4.30.0012201012130.4495-100000@falka.mfa.kfki.hu>
In-Reply-To: <Pine.LNX.4.30.0012201012130.4495-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Message-Id: <0012210840470T.08762@lyta>
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
To: linux-lvm@sistina.com, Gergely Tamas <dice@mfa.kfki.hu>

On Wednesday 20 December 2000 20:29, Gergely Tamas wrote:
> Hi!
>
> Some notes to the /etc/init.d/lvm script in the debian packages ...
>
> 1] --- it would be better to add '-a ! -d /proc/lvm' as shown bellow,
>        becouse in in the newer versions '/proc/lvm' is a directory
>        (but what if compiled without /proc/lvm info...)
>
> if [ ! -f /proc/lvm -a ! -d /proc/lvm ]; then
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ was: '[ ! -f /proc/lvm ]; then'
>
> =09if [ ! -f /lib/modules/`uname -r`/block/lvm.o -a ! -f /lib/modules/`=
uname
> -r`/block/lvm-mod.o ]; then exit 0
> =09fi
> fi

Thanks for the suggestion about checking for a directory.  But how will I=
=20
determine what version of LVM if it's a directory?  Will there be=20
/proc/lvm/version?

As for the checking for the module file.  With the way module management =
is=20
being changed in recent kernels I'm not about to do such checking as it's=
 too=20
likely that things will get broken.

I'll just assume that if the LVM module isn't loaded then the administrat=
or=20
doesn't want it to start.

LVM isn't something that you want to be automatically loading on demand,=20
either you need it or you don't.  If you need it then you will probably w=
ant=20
to compile it in or put it in /etc/modules for loading on boot.

> 2] --- I still think that an init.d script should display a usage help =
as
>        default
>
> case "$1" in
> =09start)
>         ^^^^^^ was: 'start|"")'

Done.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
