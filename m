From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Strange behaviour on a SuSE8.0 with LVM
Message-ID: <20020822133443.A5699@sistina.com>
References: <3D6226F9.8080906@mindmatics.de>
Mime-Version: 1.0
In-Reply-To: <3D6226F9.8080906@mindmatics.de>; from andreas.baier@mindmatics.de on Tue, Aug 20, 2002 at 01:24:41PM +0200
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
Date: Thu Aug 22 06:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Aug 20, 2002 at 01:24:41PM +0200, Andreas Baier wrote:
> Hi all,
>=20
> I am posting this error since I don=B4t know what is going wrong and ho=
w=20
> severe this condition is.
>=20
> This is from my syslog and the message repeats a thousand times
>=20
>=20
>   20 13:20:10 cruise kernel: lvm -- lvm_blk_ioctl: unknown command x24b

This is an ioctl command not supported by the LVM driver.
Check which tool is run so rapidly and you know who causes it.

>=20
>=20
> One Filesystem on this volume was severly ruined, I had to reinstall=20
> from a backup.

Hmmm...

You didn't mention when the FS was fully checked successfully last time.
If there was no other device errors after that check, it got probably toa=
sted
by VM or FS bugs.

>=20
> My system is a SuSE8-0 professional with the SuSE-Kernel
> 2.4.18-4GB #1 Wed Mar 27 13:57:05 UTC 2002 i686 unknown
>=20
> My LVM-utils are Version
> backup1:~ # vgdisplay --version
> vgdisplay: Logical Volume Manager 1.0.3
> Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
>=20
>=20
>=20
> --=20
> Andreas Baier
> MindMatics AG			fon:      +49 (0)89 322986-0 =09
> Frankfurter Ring 193a		fax:      +49 (0)89 9227 9897
> 80807 Munich			internet: www.mindmatics.de
> Germany=20
>=20
> -------------------------------------------------------------------
> Besuchen Sie uns vom 1.-3.09.2002 auf der DIMA (Halle 4 Stand A24)
> und melden Sie sich schon jetzt f=FCr den Messe SMS Service an unter:
> http://www.mindmatics.de Wir freuen uns auf Ihren Besuch!
>=20
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
