Date: Tue, 11 Sep 2001 16:16:54 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM
Message-ID: <20010911161654.C20767@sistina.com>
References: <NBBBJHKIOKPKOGOEPEDPOEDKDNAA.stuart@bh90210.net> <3B9DFDC5.1020306@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
In-Reply-To: <3B9DFDC5.1020306@st-peter.stw.uni-erlangen.de>; from galia@st-peter.stw.uni-erlangen.de on Tue, Sep 11, 2001 at 02:04:21PM +0200
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

Well,

LVM 1.0.1-rc2 supports the old ondisk format and you can get it from
ftp.sistina.com.

Regards,
Heinz    -- The LVM Guy --


On Tue, Sep 11, 2001 at 02:04:21PM +0200, svetljo wrote:
> Hi
>=20
> > I am using version 2.4.8-12mdk (mandrake) of the kernel. Mandrake 8.1=
 is going to be coming soon, and when it does come forth, I plan to upgra=
de. Having LVM running will make the upgrade much less painful!
> >
> I think you can have troubles with upgrading to MDK-8.1 if you use=20
>  lvm-1.0.1 or anything after lvm-0.91beta8
> as far i know they are still using  the integrated in the kernel=20
> lvm-0.91beta2 and they don't wont to upgrade to lvm-1.0 or 1.0.1  so=20
> when you boot from the CD the kernel will not  see the exiting logical=20
> volumes
> but i think i have read somewhere that lvm-1.0.1 supports both the old=20
> and new phisical volumes
>=20
> my advice befor copying anything to the LV ( i mean all the partitions=20
> you mean to upgrade : / , /usr  ...
> go through all the documentation and man pages and try to find out=20
> whether it's posible to create VG and LV's in the old format ( pre=20
> lvm-0.9.1beta8) but i think it's not possible
>=20
> or wait until MDK-8.1 come and then install lvm-1.0.1=20
>=20
> >
> >	As we speak, I am downloading this file. But, can you tell me, are th=
ere any major caveats to using this version in the link below?
> >
> >
> >Very Respectfully,=20
> >
> >Stuart Blake Tener, IT3, USNR-R, N3GWG=20
> >Beverly Hills, California
> >VTU 1904G (Volunteer Training Unit)=20
> >stuart@bh90210.net=20
> >west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-204=
3=20
> >east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859=
=20
> >
> >Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's=
 free!)=20
> >
> >JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.=
=20
> >
> >Tuesday, September 11, 2001 4:00 AM
> >
> >-----Original Message-----
> >From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]=
On Behalf Of Jos=E9 Luis Domingo L=F3pez
> >Sent: Tuesday, September 11, 2001 5:20 AM
> >To: linux-lvm@sistina.com
> >Subject: Re: [linux-lvm] LVM
> >
> >On Monday, 10 September 2001, at 19:35:13 -0700,
> >IT3 Stuart B. Tener, USNR-R wrote:
> >
> >>Dear Sir:
> >>
> >>      I HAVE READ (and DID READ) PRIOR TO ASKING MY QUESTIONS, (when =
I noted I downloaded it, I figured everyone would realize I had read it a=
s well!).
> >>
> >>All those whom are telling me to read the How-To, PLEASE, GO READ IT =
YOURSELF! SPECIFICALLY: section 7.2, paragraph 2. There is no such direct=
ory located on the Sistina FTP server. Where is this patch?
> >>
> >Your are right, links on the HOWTO don't point to the right location. =
To
> >get current sources of LVM download:
> >ftp://ftp.sistina.com/pub/LVM/1.0/lvm_1.0.1-rc2.tar.gz
> >
> >It works for recent kernels (even 2.4.9) and the documentation include=
d
> >explains how to create a patch specifically suited for your current Li=
nux
> >source tree.
> >
> >--
> >Jos=E9 Luis Domingo L=F3pez
> >Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB =
RAM)
> >
> >jdomingo EN internautas PUNTO org  =3D> =BF Spam ? Atente a las consec=
uencias
> >jdomingo AT internautas DOT   org  =3D> Spam at your own risk
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
