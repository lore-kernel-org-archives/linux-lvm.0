Return-Path: <ragnark@stine.vestdata.no>
Date: Fri, 15 Dec 2000 23:10:42 +0100
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Debian packaging
Message-ID: <20001215231042.D25445@vestdata.no>
References: <87hf46kifi.wl@pear.hibi-local.net> <Pine.LNX.4.30.0012151849540.24097-100000@falka.mfa.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.30.0012151849540.24097-100000@falka.mfa.kfki.hu>; from Gergely Tamas on Fri, Dec 15, 2000 at 06:58:20PM +0100
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
Cc: HIBINO Kei <ex8k-hbn@asahi-net.or.jp>

On Fri, Dec 15, 2000 at 06:58:20PM +0100, Gergely Tamas wrote:
> > 'http://www.asahi-net.or.jp/~ex8k-hbn/deb/lvm/'.
>=20
> Good work.
>=20
> But here are some remarks to your /etc/init.d/lvm script ...
>=20
> 1]----
> if [ ! -f /proc/lvm ]; then
> 	if [ ! -f /lib/modules/`uname -r`/block/lvm.o -a ! -f /lib/modules/`unam=
e -r`/block/lvm-mod.o ]; then
> 		exit 0
> 	fi
> fi
> ------
>=20
> What if somebody compiled lvm into the kernel, not as a module? This
> script doesn't work. :(

If lvm was compiled into the kernel /proc/lvm will exist, right?


--=20
Ragnar Kj=EF=BF=BDrstad
