Message-ID: <20020530180012.95991.qmail@web10102.mail.yahoo.com>
From: Vahid Pazirandeh <vpaziran@yahoo.com>
Subject: Re: [linux-lvm] can't use all VG free space for an LV stripe
In-Reply-To: <0d3e01c206d0$7fc1b280$070414ac@Home.PIN.LU>
MIME-Version: 1.0
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
Date: Thu May 30 13:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-lvm@sistina.com

hi Christian,

does this imply that all PV sizes in a VG must have the same size if i want=
 to
stripe along all of them, thus using 100% of the VG space?

ps. i'm no longer on the linux-lvm mail list.

regards,
vahid



--- Christian Limpach <chris@Pin.LU> wrote:
> > my volume group has 48396 PEs free using three disks.  whenever i try to
> setup
> > a striped LV using 48396 PEs it fails with "please check, if physical
> volumes
> > are allocatable".
>=20
> yes, I guess you can't stripe over a single disk. ;-)  i.e of those 48396
> PEs only 43977 are on 3 disks, the rest is on a single disk.  With 43977 =
PEs
> you get around 171G.
>=20
>     christian
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


=3D=3D=3D=3D=3D
< NPACI Education Center on Computational Science and Engineering >
< http://edcenter.sdsu.edu >

"Career is great, but you can=EF=BF=BDt run your hands through its hair."
=3D=3D=3D=3D=3D

__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
