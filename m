Return-Path: <root@srv.sistina.com>
Date: Mon, 16 Jul 2001 13:33:21 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010716133321.E11625@sistina.com>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net> <20010713131200.C32198@sistina.com> <200107131652.MAA15766@burns.luca.2y.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200107131652.MAA15766@burns.luca.2y.net>; from luca@lucarella.com.ar on Fri, Jul 13, 2001 at 12:33:31PM -0300
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

On Fri, Jul 13, 2001 at 12:33:31PM -0300, Leandro Lucarella wrote:
> El Fri, 13 Jul 2001 13:12:00 +0200 Heinz J. Mauelshagen <Mauelshagen@sist=
ina.com> escribi=EF=BF=BD:
>=20
> HJM> On Thu, Jul 12, 2001 at 11:53:58AM -0300, Leandro Lucarella wrote:
> HJM> > Hi, I'm new in LVM (I'm so new that I'm not even using it :) and I=
 have a
> HJM> > question:
> HJM> >=20
> HJM> > I want to know if the stiper mode, the performance gain is sompara=
ble to Software
> HJM> > RAID 0.
> HJM>=20
> HJM> In theory they should be pretty similar :-)
> HJM>=20
> HJM> But people reported differences which are probably caused by their p=
articular
> HJM> hardware setup.
> HJM>=20
> HJM> In order to answer the question for your particular configuration, y=
ou should
> HJM> test both ;-)
>=20
> Fair enought for me! LVM has some good advanges so if the performance is
> comparable, I'm with LVM! ;)
> Now I have a question. I read the HOWTO migrate the old root partition to=
 a
> LV, and the method is to make a LV on another HD (or the same if it's
> room), copy the root FS to this LV, delete the old partition and add it to
> the new LV. My question is. It's possible to make a VG without striping
> ('cause I have just 1 HD in the begining) and then, when I add the old
> partition to the VG, make this VG to do striping????

No, as stated in another answer.

> (I'm really sory about my primitive english... ;)

You shouldn't be. My own is primitive too ;-)

>=20
> HJM> > Another question is the boot stuff, what is better? compile LVM as=
 a module
> HJM> > and use inird or compile the kernel with built-in LVM support?
> HJM>=20
> HJM> It doesn't make a difference if you go for the module or the build i=
n driver,
> HJM> you need to have an initrd today anyway to activate your VGs at boot=
 time.
> HJM>=20
> HJM> We are working on boot time recognition of VGs in the driver which w=
ill vanish
> HJM> the initrd. That will be in a post 1.0 version of the Linux LVM.
>=20
> OK, initrd is allways needed until 1.0...

No, it will be needed at least including 1.0.
We'll enhance that later.

> And how close we are to this release??? ;)
>=20
> --
> LUCA - Leandro Lucarella
> ------------------------
> luca@lucarella.com.ar
> http://www.luca.2y.net
> LICQ UIN: 2847576
> ------------------------
> Usando Debian GNU/Linux
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
