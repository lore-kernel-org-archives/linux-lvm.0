From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] physical volume timeout
Message-ID: <20030825152315.A2618@sistina.com>
References: <sf4a1cca.017@lvnbb.brandenburg.de>
Mime-Version: 1.0
In-Reply-To: <sf4a1cca.017@lvnbb.brandenburg.de>; from Stephan.Hendl@lds.brandenburg.de on Mon, Aug 25, 2003 at 02:27:02PM +0200
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
Date: Mon Aug 25 08:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Aug 25, 2003 at 02:27:02PM +0200, Stephan Hendl wrote:
> Hi all,
>=20
> I'd like to know the default physical volume timeout parameter. In HPUX=
 the value is about 60 seconds - in Linux too?

No, there's no PV timeout parameter.

It is handled in lower components of the IO chain within the Linux kernel
(e.g. low-level device drivers), which do internal timeout processing.
One 2.7 develoment work item is to enhance this.

>=20
> Thanks in advance
>=20
> Stephan
>=20
> Dr. Stephan Hendl
> Systemmanagement
> -----------------------------------
> Landesbetrieb f=FCr
> Datenverarbeitung und Statistik
> Land Brandenburg
>=20
> Adresse: 14467 Potsdam, Dortustr. 46
> Telefon: +49-(0)331 39-471
> Fax:: +49-(0)331 27548-1187
> Mobil: +49-(0)160 90 645 893
> EMail: Stephan.Hendl@lds.brandenburg.de
> Internet: http://www.lds-bb.de
>=20
>=20
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
