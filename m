Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
Date: Sat, 23 Dec 2000 05:23:22 +1100
References: <Pine.LNX.4.31.0012211041260.9973-100000@falka.mfa.kfki.hu>
In-Reply-To: <Pine.LNX.4.31.0012211041260.9973-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Message-Id: <00122305232204.02330@lyta>
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
To: linux-lvm@sistina.com

Here's my current effort:

#!/bin/sh
#
# lvm=09=09This script handles the LVM startup/shutdown
#=09=09so that LVMs are properly configured and available.
#

if [ "0" =3D `grep -c lvm /proc/devices` ]; then
  exit 0
fi
[ -f /etc/lvmtab ] || exit 0
[ -x /sbin/vgscan ] || exit 0

case "$1" in
=09start)
=09=09echo "Setting up LVM Volume Groups..."
=09=09#/sbin/vgscan
=09=09/sbin/vgchange -a y
=09=09;;
=09
=09stop)
=09=09echo "Shutting down LVM Volume Groups... "
=09=09/sbin/vgchange -a n
=09=09;;

=09restart|force-reload)
=09=09echo "Does not make sense to restart."
=09=09exit 1
=09=09;;
=09*)
=09=09echo "Usage: lvm {start|stop}" >&2
=09=09exit 1
=09=09;;
esac


--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
