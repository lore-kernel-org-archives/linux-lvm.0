From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM on Mylex DAC 960 (Raid1)
Message-ID: <20030527125616.A8518@sistina.com>
References: <8189.1053716777@www16.gmx.net>
Mime-Version: 1.0
In-Reply-To: <8189.1053716777@www16.gmx.net>; from grobe@gmx.de on Fri, May 23, 2003 at 09:06:17PM +0200
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
Date: Tue May 27 06:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Maybe I am getting you wrong, but your mail sounds like you've managed
to run pvcreate on the Mylex device nodes and created a VG and LVs just f=
ine.

The Mylex raid device nodes are just 'disks' to be used by Linux LVM.

What did I miss ?

On Fri, May 23, 2003 at 09:06:17PM +0200, grobe@gmx.de wrote:
> Hi!=20
> =20
> I know that this is a known problem, but I didn't find the=20
> solution so far, so I have to ask here now...=20
> =20
> I have some machines with Mylex-controllers that are to=20
> be used with RAID1s. As the controller supports only=20
> 6 partitions (and fo other reasons, too) I wanted to use=20
> LVM on this. I have created a primary /boot, a /swap and=20
> a logical partition in an extended one that became type "LVM".=20
> I am doing all this in SuSE 8.1's installation routine (Yast).=20
> =20
> I have choosed a VG, put the PV into it, and created LVs for=20
> /, /usr, /var, /tmp, /home, however, when Yast is going to=20
> execute the steps choosen before, I get a failure by pvcreate=20
> (can't get device size of /dev/rd/c0d0p5).=20
> =20
> I know that the Mylex raidset appears in a somehow special=20
> device in the Linux devtree, but I am quite sure it is possible=20
> to put LVM on top of it - now I just wonder how to do this?=20
> =20
> Thank You, CU, Lars.=20
>=20
> --=20
> +++ GMX - Mail, Messaging & more  http://www.gmx.net +++
> Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!
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
