From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] telling LVM it's not hda8 anymore but now it's hda7
Message-ID: <20030708124618.C28295@sistina.com>
References: <006701c3452d$68a22ed0$2101a8c0@martin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <006701c3452d$68a22ed0$2101a8c0@martin>; from martin@newdomain.nl on Tue, Jul 08, 2003 at 10:46:21AM +0200
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
Date: Tue Jul  8 05:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

On Tue, Jul 08, 2003 at 10:46:21AM +0200, Martin Milner wrote:
> I am such a noob. I deleted a partition. I had /dev/hda8 in an lvm volume
> but i deleted a lower partition then rebooted. Now i got a kernel panic
> because my /dev/hda9 (my / ) had gone. Running fdisk and fixing the
> partition table nicely made my old /dev/hda9 to /dev/hda8 (and my hda8 wa=
s now hda7). After some
> fumbling around with grub i got it to boot again and most of my installat=
ion
> is running again. Except for my LVM stuff
>=20
> I need to tell LVM that there no longer is a /dev/hda8, that it is now
> /dev/hda7. Without losing my data.

Running vgscan before "vgchange -ay" should do it.

>=20
> Anyone?=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=E5=8A{=B1=FE[=E6=99=A8=A5=8Ax%=8A=
=CBe=8A{=B1=FE[=E6=FE=C8=AC=B6)=DA=FD=CA&=86=DBi=FF=FF=E5=8A=CBl=FE=C8=AC=
=B6)=DA=FD=CA&=FEf=A2=96f=A7=FEX=AC=B6)=DF=A3=F9b=9E=EC=FF=96=F9=ABy=A7m=85=
=E2=D50s=96=FD3=9A=B6=1Bm=FF=FF=FF=B6Wi=FE=8A=E0=FCs=96L=EF=CBT=FF=C79d=CE
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
