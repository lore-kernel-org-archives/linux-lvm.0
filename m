Message-Id: <scebc243.095@MS104BN>
From: "Dmitri Levitin" <dmitri.levitin@postbank.de>
Subject: Antw: Re: [linux-lvm] Problem with vgscan
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Date: Wed May 22 09:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've sent you the data to mge@sistina.com.

>>> mauelshagen@sistina.com 22.05.2002  14.50 Uhr >>>

Well, this is an ancient LVM version:

 - what does pvscan say?

 - what does "vgscan -d" say?

Send both outputs plus the file "Dmitri.vgda" created with
"dd if=3D/dev/sdd1 bs=3D1k count=3D4k of=3DDmitri.vgda" in a bziped tar =
archive to
me for further investigation (mge@sistina.com).

On Wed, May 22, 2002 at 02:30:02PM +0200, Dmitri Levitin wrote:
> Hi,
>=20
> I have installed the LVM-0.9-1 on my Linux Suse7.0 Kernel 2.2.18 and I =
have marked /dev/sdd1 with Linux LVM label. When I run vgscan for the =
first time it tells the follows:
>=20
> $ vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- found inactive volume group "data"
> vgscan -- reading data of volume group "data" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get =
data of volume group "data" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating =
"/etc/lvmtab" and "/etc/lvmtab.d"
>=20
>=20
> What's the problem? Could anybody help my?
>=20
> Thanks a lot
>=20
> Dmitri
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com=20
> http://lists.sistina.com/mailman/listinfo/linux-lvm=20
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html=20

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

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com=20
http://lists.sistina.com/mailman/listinfo/linux-lvm=20
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
