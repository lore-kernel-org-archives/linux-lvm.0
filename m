From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to remove a vg manually?
Message-ID: <20011123130931.B4829@sistina.com>
References: <20011123002839.A806@sky.net>
Mime-Version: 1.0
In-Reply-To: <20011123002839.A806@sky.net>; from U.Wiederhold@gmx.net on Fri, Nov 23, 2001 at 12:28:40AM +0100
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
Date: Fri Nov 23 06:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Nov 23, 2001 at 12:28:40AM +0100, Ulrich Wiederhold wrote:
> Hey,
> first I wanna say, the resize of the reiserfs worked ok. Thanks.
>=20
> I move my hole data from the old vg01 with that error
> "pvmove -- ERROR reading input physical volume "/dev/hdb1" (still 65536=
 bytes to read)"
>=20
> to the new vg store at the moment. If it=B4s done I would like to remov=
e
> the old vg01.
> How can I do this? Delete all files /etc/lvmconf/vg01* and change all
> Partition Types tp 83 instead of 8e?

vgchange -an vg01
for d in AllOfvg01sPVs; do dd if=3D/dev/zero of=3D$d bs=3D512 count=3D1; =
done
vgscan

You can change the partition type to an arbitray value optionally.

>=20
> Anything else or another possibility?
>=20
> Thanks
> Uli
>=20
> --=20
> 'The box said, 'Requires Windows 95 or better', so i installed Linux - =
TKK 5
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
