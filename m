From: "more" <more0401@sina.com>
Subject: RE: [linux-lvm] LVM or LVM2?
Message-ID: <JPEFKGGHAMLCEEAJKMNIGEEMCAAA.more0401@sina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1070653985.2686.2.camel@gecko.indygecko.com>
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
Date: Mon Dec  8 07:24:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

I have tried LVM1, LVM2 and EVMS, and I think LVM2 is the better choice.

Since from Linux kernel 2.6.0, the kernel only supports device-mapper =
(LVM2). So LVM2 is better than LVM1.
Actually for the user friendly interfaces, EVMS is better for user =
friendly. But for the robust and maintenance, LVM2 is better obviously.
I think robust and maintenance is most important for a storage server of =
course.


more


-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Jord Tanner
Sent: 2003=E5=B9=B412=E6=9C=886=E6=97=A5 3:53
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM or LVM2?


I know this is the LVM list, and I may be shot for saying this, but I
have found EVMS to be fabulous. The curses based interface is good, and
the X interface is fantastic. Others will certainly have other opinions,
and as always YMMV.

Jord Tanner

On Fri, 2003-12-05 at 06:56, Yanick Quirion wrote:
> Hi all,
> =20
> I want to implement LVM on a new system. The server will be a Fedora =
Core 1 and this distribution comes with utilities of LVM version 1.0.x. =
I also read some stuff about LVM2, but I can't figure out which one is =
the best solution. On a old system I use LVM 1.1RC2, but this version =
seems now to be unavailable.
> =20
> So for my new server I just want to make the good decision. Which one, =
between the two, is the best solution for now and the future?
> =20
> Thanks for your suggestion.
> =20
> Best regards,
>=20
>=20
> -----------
> Yanick Quirion
> Administrateur R=C3=A9seau/Network Manager
> NEOKIMIA INC.
> Institut de Pharmacologie de Sherbrooke
> 3e =C3=A9tage (=C3=A9difice Z5)
> 3001 12e avenue Nord
> Sherbrooke, Qu=C3=A9bec
> CANADA
> J1H 5N4
> =20
> T=C3=A9l.:    +1 819 820-6040
> Direct:  +1 819 820-6855
> Fax.:    +1 819 820-6841
> =20
> email: Yanick.Quirion@neokimia.com
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--=20
Jord Tanner <jord@indygecko.com>


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
