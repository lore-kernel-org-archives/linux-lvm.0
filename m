Date: Thu, 13 Sep 2001 15:05:42 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM
Message-ID: <20010913150542.B2727@sistina.com>
References: <3BA064FE.3020501@st-peter.stw.uni-erlangen.de> <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net>; from stuart@bh90210.net on Thu, Sep 13, 2001 at 03:27:30AM -0700
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
content-type: text/plain
To: linux-lvm@sistina.com

On Thu, Sep 13, 2001 at 03:27:30AM -0700, IT3 Stuart B. Tener, USNR-R wrote:
> Svetljo:
>=20
> 	So for LVM, you do need to use the lvmcreate_initrd program or not? I am=
 still not clear on that.
>=20
> 	If I need to make an lvmcreate_initrd, does not that mean it cannot be i=
n the kernel?

Because LVM doesn't have metadata read support directly in the driver, this
must be accomplished by running vgscan+vgchange from the /linuxrc script
of an initrd.

If you've got an initrd anyway, it doesn't force you to have the LVM driver
(and other drivers either) statically linked into the kernel.

Regards,
Heinz    -- The LVM Guy --

>=20
>=20
> Very Respectfully,=20
>=20
> Stuart Blake Tener, IT3, USNR-R, N3GWG=20
> Beverly Hills, California
> VTU 1904G (Volunteer Training Unit)=20
> stuart@bh90210.net=20
> west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043=
=20
> east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859=20
>=20
> Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's fr=
ee!)=20
>=20
> JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.=20
>=20
> Thursday, September 13, 2001 3:20 AM
>=20
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On =
Behalf Of svetljo
> Sent: Thursday, September 13, 2001 12:49 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM
>=20
> >
> >
> >LVM Listmembers:
> >
> >       The how-to is not clear on certain issues:
> >
> >(a) should ReiserFS support be compiled into the kernel or be a module?
> >(b) Should LVM support be compiled into the kernel or be a module?
> >(c) If you use LVM support as a module or in the kernel how does this ef=
fect the need or configuration of the initrd?
> >
> it's better to have them compiled in ,
>=20
> >Someone told me I don't need initrd, if its built in the kernel, no?
> >
> it's not needed for software RAID, IBM's EVMS (still alpha status) and
> is on the to-do list of lvm
> ( i have read this in the previous messages)
> but as of today you need initrd for the binaries for activating the VG's
> and LV's
>=20
> >
> >
> >Very Respectfully,
> >
> >Stuart Blake Tener, IT3, USNR-R, N3GWG
> >Beverly Hills, California
> >VTU 1904G (Volunteer Training Unit)
> >stuart@bh90210.net
> >west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043
> >east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859
> >
> >Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's f=
ree!)
> >
> >JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.
> >
> >Wednesday, September 12, 2001 4:26 PM
> >
> >-----Original Message-----
> >From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On=
 Behalf Of Andreas Dilger
> >Sent: Wednesday, September 12, 2001 4:21 PM
> >To: linux-lvm@sistina.com
> >Subject: Re: [linux-lvm] LVM
> >
> >On Sep 12, 2001  15:41 -0700, IT3 Stuart B. Tener, USNR-R wrote:
> >
> >>      I am curious what version of lilo in fact supports ReiserFS tails=
. I am running Mandrake 8.0, and using the lilo supplied therewith, and hav=
e been booting a / partition as ReiserFS (with tails I believe, how do I ch=
eck?).
> >>
> >
> >At least version 21.6+ support reiserfs tails (maybe earlier, I don't kn=
ow).
> >You should be able to verify with "strings /sbin/lilo | grep -i reiserfs=
".
> >What it does is unpack the tail on any kernel/initrd files so that LILO
> >can map the blocks directly.  In a way, it is strange that this is neede=
d,
> >since I thought tails only applied to files < 64kB or similar...
> >
> >Cheers, Andreas
> >--
> >Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipast=
o,
> >                 \  would they cancel out, leaving him still hungry?"
> >http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbe=
rt
> >
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> ?????????????????????????????????????{??[?????x%??e?{??[?????)???&??i????=
?l????)???&?f??f??X??)???b??????y?m???0s??3??=1Bm????=0C??+-?v?r?????=3D?=
=1E??h??????

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
