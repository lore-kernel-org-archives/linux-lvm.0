From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] lvm-1.0.1-rc4 and 2.4.13
Message-ID: <20011026213005.C928@sky.net>
References: <20011026005405.A21775@sky.net> <20011026095641.C587@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20011026095641.C587@tykepenguin.com>
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
Date: Fri Oct 26 14:27:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

* Patrick Caulfield <caulfield@sistina.com> [011026 10:56]:
> On Fri, Oct 26, 2001 at 12:54:05AM +0200, Ulrich Wiederhold wrote:
> > Hello,
> > I untared 2.4.13, applied the official xfs patch, then the fresh created
> > lvm patch.
> >=20
> > No mistakes.
>=20
> The XFS patch removes some essential LVM bits from the Makefile I think (=
maybe
> it has an old LVM in there or something)
>=20
> Edit drivers/md/Makefile and change the lvm-mod-objs line to read:
>=20
> lvm-mod-objs    :=3D lvm.o lvm-snap.o lvm-fs.o
>=20
Hello,
thanks again.
I did:
* untar the kernel 2.4.13
* patched with xfs
* created lvm-patch
* patched with lvm
* changed the line as described above
* configured the kernel
* built the kernel

This won=B4t work in another order, e.g. built the lvmpatch with a
vanilla-kernel or apply the lvm patch first! I always got errors doing
this.

Two questions:
1. Why isn=B4t lvm-1.0.1-rc4 in the current Linux-Kernel? Why do I still
need to patch? I think this version is already stable and better than
the older one, isn=B4t it?
2. Should I write a bug-report to the xfs-guys? If yes, can I include
your Email, Patrick?

Regards
Uli


--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
