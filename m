From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Logical Volume max-size?
Message-ID: <20011117231120.C12510@auctionwatch.com>
References: <20011117223754.B12510@auctionwatch.com> <003801c16ffd$757c3d50$fc00a8c0@xp>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <003801c16ffd$757c3d50$fc00a8c0@xp>
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
Date: Sun Nov 18 01:09:02 2001
List-Id: <linux-lvm.redhat.com>
content-type: text/plain
To: linux-lvm@sistina.com

On Sun, Nov 18, 2001 at 03:51:32PM +0900, Sean Oh wrote:
> Yes, it is still in the current CVS, if I am not wrong.
> But, you can go away with by defining PE size to a bigger number than def=
ault 4MB.
> By defining PE size to 16M, it gives=20
> 16M * 65534 =3D 1,048,544M, which is about 1TB.
> take a look at -s switch in vgcreate.

    Cool. I need about 300 gig.=20

    Those 3ware cards rock. Lots of disk, fast and cheap.=20

> ----- Original Message -----=20
> From: "Petro" <petro@auctionwatch.com>
> To: <linux-lvm@sistina.com>
> Sent: Sunday, November 18, 2001 3:37 PM
> Subject: [linux-lvm] Logical Volume max-size?
>=20
>=20
> > Is the 255.99 Gigabyte limit for a logical volume still in place, or
> > does that go away/get bigger with the later (post 0.91) versions?=20
> >=20
> > --=20
> > Share and Enjoy.=20
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >=20
> ?)??[?????x%??e?{??????b??(?=1Bm?????l?+-?v??o?j)fj=7F???b????)??[?????=
=17?T??Y3??=1Bm????=0B"???i?&?[????z???=0Bh???

--=20
Share and Enjoy.=20
