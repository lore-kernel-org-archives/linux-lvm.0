Message-Id: <200112121953.fBCJr6g15595@ecdl.ecdl.hut.fi>
From: Mika Lansirinne <Mika.Lansirinne@ecdl.hut.fi>
Subject: Re: [linux-lvm] loop devices?
References: <E16EEuF-0005u6-00@hermes.sistina.com>
In-Reply-To: <E16EEuF-0005u6-00@hermes.sistina.com>
MIME-Version: 1.0
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
Date: Wed Dec 12 13:51:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Harri Haataja wrote:
> On Wed, Dec 12, 2001 at 06:16:31PM +0200, Mika Lansirinne wrote:
> > I was trying to use a loop device(s) for LVM. In the pvcreate man-pag=
e it=20
is=20
> > said that a PV can also be a loopback file. That also seem to work=20
correct.=20
> > But when I try to create a VG on that I get:
> >=20
> > [root@arthur /tmp]# vgcreate tmpvg /dev/loop0
> > vgcreate -- no valid physical volumes in command line
>=20
> I didnt bother to look deep into those messages but first though that
> came into my mind is that you didn't mention losetup. You did this?

Sorry, probably should have mentioned that to be complete. I indeed did u=
se=20
losetup first. (And I can create filesystem to that and can mount that. N=
o=20
problem with the loop device itself).

These are the steps I have done:
dd if=3D/dev/zero of=3Dlvm-file bs=3D1M count=3DXX
losetup /dev/loop0 lvm-file
pvcreate /dev/loop0
=3D> pvcreate -- physical volume "/dev/loop0" successfully created
vgcreate tmpvg /dev/loop0
=3D> vgcreate -- no valid physical volumes in command line


-Mika

--=20
Mika L=E4nsirinne, System Manager / Research Engineer, M.Sc. (E.E.)
Helsinki University of Technology
Electronic Circuit Design Laboratory
P.O. Box 3000				Email: mla@ecdl.hut.fi
FIN-02015 HUT				Tel: +358 9 451 2277
Finland					Fax: +358 9 451 2269
