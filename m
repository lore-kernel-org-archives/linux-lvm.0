Message-ID: <3BBCB1C1.92EE150F@promofinarsa.es>
Date: Thu, 04 Oct 2001 21:00:17 +0200
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm 1.0 and kernel 2.2.19.Is rawio patch necessary ??
References: <3BBC550E.442F190C@ti.com> <3BBC7C22.1119BF0@promofinarsa.es> <3BBC90C9.309A3D75@ti.com> <3BBCA384.EC6D4D53@ti.com>
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

Hi again christian:

christian e wrote:
>=20
> christian e wrote:
>=20
> > I think I'll try the 2.2.18 patch as well..Will let you all know if it
> > turned out ok or not..
>=20
> Just tried the following:
>=20
> removed old kernel source tree,untarred a fresh 2.2.19 source.Did a
> ./configure in the lvm source dir.Then a make in the PATCHES DIR.Then
> applied the rawio patch for 2.2.18 and then the lvm-1.0 patch for my
> kernel 2.2.19.Patched clean without problems.
>=20
> Then compiled the kernel again.Then the modules..mind you I compiled lvm
> into the kernel not as module..No problems.
>=20
> Bootup withput problems (only forgetting to patch with aacraid driver
> but htat's another story :-)
>=20
> compiled lvm and installed..Works ok..
>=20

I had a fast day with some other snmp stuff so I didn't have time for
the LVM stuff.  Only concern i I won't use root as LVM and it is stayed
that LVM should be compiled as a module preferably (I think coz the
developers don't considered that code so stable).  Anyway, it seems that
we're near of a goal (at least, what's the problem with the de struct
member is allocated and pointed out to some 2.3.x kernel addition, so I
think it can be repaired for rc5 next week).   Let's see...
In any case, thanks for your aid folks.
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
