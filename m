Return-Path: <heinrichs@qis-systemhaus.de>
Message-ID: <3AB5B7B4.31471853@qis-systemhaus.de>
Date: Mon, 19 Mar 2001 08:39:32 +0100
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Getting LVM to startup on RedHat
References: <Pine.LNX.4.33.0103171814270.19966-100000@bugs.home.shadowstar.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Alec Smith wrote:
>=20
> I've compiled kernel 2.2.17+LVM-0.9 patches on a RedHat 6.2 machine. If I
> run
>=20
> vgscan
> vgchange -ay
> mount /dev/malepages/data /data
>=20
> at a command prompt, all works well. However, if I include
>=20
> /usr/sbin/vgscan
> /usr/sbin/vgchange -ay
Seems that your /usr is on a separate partition, which is not mounted at
the time vg* are called. If this is the case, try to "configure
--prefix=3D/", recompile and reinstall. Then put

/sbin/vgscan
/sbin/vgchange -ay

in rc.sysinit.

Hope this helps.

Bye...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
QIS Systemhaus GmbH	| Mail:	heinrichs@qis-systemhaus.de
J=EF=BF=BDlicher Str. 338b	| Web:	http://www.qis-systemhaus.de
D-52070 Aachen		| ICQ#:	110037733
