Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Date: Sat, 16 Dec 2000 19:44:54 +0100
MIME-Version: 1.0
Message-Id: <00121619445400.00774@lyta>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvm-081 package available for testing
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
To: debian-devel@lists.debian.org
Cc: linux-lvm@sistina.com

At http://www.coker.com.au/lvm/ I have my first attempt at packaging LVM =
for=20
Linux.  It is only lvm0.8.1 at the moment, I will do 0.9 shortly.

There are 2 packages that depend on each other, lvm-common provides the m=
an=20
pages, wrappers, init script, etc.  lvm081 does the binaries and the shar=
ed=20
library.

Please let me know what you think.

Also please DON'T install this on a server type system.  I can't guarante=
e=20
that it'll work well.  Install it on a machine where you are just playing=
=20
with LVM.  Preferrably do it on a test machine that doesn't matter much.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
