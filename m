Return-Path: <root@srv.sistina.com>
Date: Thu, 12 Jul 2001 10:01:48 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Just installed LVM on deb - got module errors - retry
Message-ID: <20010712100148.A26928@sistina.com>
References: <MPEELPOMDADEHPNEDEPBCELPCAAA.ka@filanet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <MPEELPOMDADEHPNEDEPBCELPCAAA.ka@filanet.dk>; from ka@filanet.dk on Wed, Jul 11, 2001 at 10:03:47PM +0200
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

Klaus,

we have mostly updated -ac series in order to make it into vanilla to avoid
recompiling the kernel. For now if you want to use an actual LVM version,
you need to follow the instructions in the INSTALL and PATCHES/README files
in order to patch and compile/install a new kernel, sorry.

Regards,
Heinz    -- The LVM Guy --


On Wed, Jul 11, 2001 at 10:03:47PM +0200, Klaus Agnoletti wrote:
> Hi there
>=20
> I tried reading both the How-to and the README.debian file - and everythi=
ng
> else I could find, and found nothing that could help me.
> I must be missing some block device - how do I get that ?
> Can I do it the easy way at all ? - without compiling a new kernel ? (I am
> just being lazy on this - I know that :-)
> Later on when I tried LVM out and know how great it is, I will make it all
> the hard way =3D)
>=20
> Thanks in advance
>=20
> /Klaus
> -----Oprindelig meddelelse-----
> Fra: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]P=EF=
=BF=BD
> vegne af Klaus Agnoletti
> Sendt: 10. juli 2001 22:08
> Til: linux-lvm@sistina.com
> Emne: [linux-lvm] Just installed LVM on deb - got module errors
>=20
>=20
> Hi,
>=20
> I just installed lvm 0.9.1 beta 7 from .deb archives via apt-get
> For some reason I get the following error when trying to prepare a LVM
> partition :
>=20
> vault:/etc/modutils# pvcreate /dev/hdb1
> pvcreate -- LVM driver/module not loaded?
>=20
> Clearly it is missing a kernel module.
>=20
> trying to modprobe lvm-mod gives the following error :
>=20
> vault:/etc/modutils# modprobe lvm-mod
> modprobe: Can't locate module lvm-mod
>=20
> I assume the following messages in /var/log/syslog is related :
>=20
> Jul 10 22:00:02 vault modprobe: modprobe: Can't locate module char-major-=
109
> Jul 10 22:00:02 vault modprobe: modprobe: Can't locate module char-major-=
109
>=20
> So I guess that this really is what it needs. Am I right ? - how do I get
> this then ?
>=20
> If I am totally off the track, please help me back =3D)
>=20
>=20
> Thanks in advance
>=20
>=20
> Klaus Agnoletti
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
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
