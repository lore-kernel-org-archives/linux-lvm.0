Return-Path: <james@fr.clara.net>
Date: Mon, 5 Feb 2001 13:13:43 +0100 (CET)
From: James <james@fr.clara.net>
Subject: Re: [linux-lvm] lv extend
In-Reply-To: <3A7E9408.58179E5@qis-systemhaus.de>
Message-ID: <Pine.LNX.4.21.0102051308370.517-100000@munster.noc.fr.clara.net>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com


> >=20
> > Hello
> >=20
> > Is it normal after growing an LV not to see the change with df -h ? But=
 it
> > can be seen with vgdisplay -v ?
> Did you also resize the filesystem? df shows filesystem sizes. If so,
> maybe a remount of the filesystem could help.

All I did was lvextend -L+500 /dev/lvdev/usr I have just realised from the
DOC (it isn't clear that I have to do the ex2resize stuff.) It says if I
want to do it manually to use ex2resize, is thare another way?


=20
> Bye...
>=20
> =09Dirk
> --=20
> Dirk Heinrichs=09=09| Tel:=09+49 (0)241 413 260
> QIS Systemhaus GmbH=09| Fax:=09+49 (0)241 413 2640
> J=FClicher Str. 338b=09| Mail:=09heinrichs@qis-systemhaus.de
> D-52070 Aachen=09=09| Web:=09http://www.qis-systemhaus.de
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20
