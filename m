Return-Path: <jay@lazy.accessus.net>
Date: Fri, 15 Dec 2000 17:13:11 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <20001215231042.D25445@vestdata.no>
Message-ID: <Pine.OSF.4.21.0012151712370.23438-100000@lazy.accessus.net>
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
Cc: HIBINO Kei <ex8k-hbn@asahi-net.or.jp>

Does /proc/lvm exist if you turn off the LVM proc reporting flag?

On Fri, 15 Dec 2000, [iso-8859-1] Ragnar Kj=F8rstad wrote:

> On Fri, Dec 15, 2000 at 06:58:20PM +0100, Gergely Tamas wrote:
> > > 'http://www.asahi-net.or.jp/~ex8k-hbn/deb/lvm/'.
> >=20
> > Good work.
> >=20
> > But here are some remarks to your /etc/init.d/lvm script ...
> >=20
> > 1]----
> > if [ ! -f /proc/lvm ]; then
> > =09if [ ! -f /lib/modules/`uname -r`/block/lvm.o -a ! -f /lib/modules/`=
uname -r`/block/lvm-mod.o ]; then
> > =09=09exit 0
> > =09fi
> > fi
> > ------
> >=20
> > What if somebody compiled lvm into the kernel, not as a module? This
> > script doesn't work. :(
>=20
> If lvm was compiled into the kernel /proc/lvm will exist, right?
>=20
>=20
> --=20
> Ragnar Kj=F8rstad
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20
