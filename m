Message-Id: <46CEA578.B03DDD14@qis-systemhaus.de>
Date: Fri, 24 Aug 2007 11:31:36 +0200
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Subject: Re: [linux-lvm] LVM, rawio, ext2?
References: <20010823014012.A32700@greenhydrant.com>
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

David Rees wrote:
>=20
> Hi,
>=20
> I'd like to create an ext2 filesystem over a raw io device, is this eve=
n
> possible?  (If not, skip the rest of this message! ;-)
Why do you want to do that?

These are two opposite things. One uses a raw device where an
application has it's own storage layout, like databases.

If you just want to make shure that your files on an ext2 are written
immediately, then mount with sync option.

Bye...

	Dirk
--=20
Dirk Heinrichs		| Tel:	+49 (0)241 413 260
Configuration Manager	| Fax:	+49 (0)241 413 2640
QIS Systemhaus GmbH	| Mail:	dheinrichs@qis-systemhaus.de
J=FClicher Str. 338b	| Web:	http://www.qis-systemhaus.de
D-52070 Aachen		| ICQ#:	110037733
