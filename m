From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] file system larger than lv
Message-ID: <20021118162339.B25728@sistina.com>
References: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM> <20021115115831.B11618@sistina.com> <20021115122708.GK8377@pc.ilinx> <20021115135424.A12164@sistina.com> <20021115134816.GL8377@pc.ilinx> <20021116025942.U17827@vestdata.no>
Mime-Version: 1.0
In-Reply-To: <20021116025942.U17827@vestdata.no>; from lvm@ragnark.vestdata.no on Sat, Nov 16, 2002 at 02:59:42AM +0100
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
Date: Mon Nov 18 09:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sat, Nov 16, 2002 at 02:59:42AM +0100, Ragnar Kj=F8rstad wrote:
> > > Putting additional overloading block/filesystem layer services not =
necessarily
> > > needed there into the kernel is unlikely to be accepted either IMO.
> >=20
> > No.  No.  Not in the kernel.  I mean the user space tools can simply
> > check what data is on the block device (i.e. look for a known
> > signature of given filesystems) and see if it can determine if it is
> > indeed a filesystem.
>=20
> First of all it's not possible to detect if the device includes a valid
> filesystem. You can only check for know filesystems and I don't think i=
t
> would be a good idea for lvm to include a list of filesystem-signatures.
>=20
> Second, reducing the size of a device is just as dangerous if there is
> something else (say a datbase) on that device.
>=20
> So, if anything, I think lvreduce should always warn the user that this
> is a dangerous operation.
>=20

And it does that since used by dinoaurs ;)

>=20
>=20
> --=20
> Ragnar Kj=F8rstad
> Big Storage
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
