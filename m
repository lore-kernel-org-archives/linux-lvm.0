Return-Path: <heinrichs@qis-systemhaus.de>
Message-Id: <3A7E9408.58179E5@qis-systemhaus.de>
Date: Mon, 05 Feb 2001 12:52:40 +0100
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Subject: Re: [linux-lvm] lv extend
References: <Pine.LNX.4.21.0102051213590.432-100000@munster.noc.fr.clara.net>
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

James wrote:
>=20
> Hello
>=20
> Is it normal after growing an LV not to see the change with df -h ? But it
> can be seen with vgdisplay -v ?
Did you also resize the filesystem? df shows filesystem sizes. If so,
maybe a remount of the filesystem could help.

Bye...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
QIS Systemhaus GmbH	| Fax:	+49 (0)241 413 2640
J=EF=BF=BDlicher Str. 338b	| Mail:	heinrichs@qis-systemhaus.de
D-52070 Aachen		| Web:	http://www.qis-systemhaus.de
