Return-Path: <heinrichs@qis-systemhaus.de>
Message-Id: <3A88DCA6.C7672745@qis-systemhaus.de>
Date: Tue, 13 Feb 2001 08:05:10 +0100
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Subject: Re: [linux-lvm] LVM with devfs questions and patches
References: <20010212205229.A3375@trez42.net>
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

Benoit Gaussen wrote:
>=20
> I have another little question, I read the recent thread concerning the
> startup scripts, and the fact to put vgscan in them. But when the startup
> script is launched, the file system is mounted read only and since vgscan
> updates the /etc/lvmtab files, it fails...  or maybe I missed something ?

I solved this on my RH system by putting vgscan and vgcreate in
/etc/rc.sysconfig _after_ root filesystem is remounted rw and before the
filesystem checks. I also had to move the swapon command, because I swap
to an lv.

Bye...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
QIS Systemhaus GmbH	| Fax:	+49 (0)241 413 2640
J=EF=BF=BDlicher Str. 338b	| Mail:	heinrichs@qis-systemhaus.de
D-52070 Aachen		| Web:	http://www.qis-systemhaus.de
