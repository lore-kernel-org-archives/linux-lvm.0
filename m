From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM 1.0.3 VGDA corrupted often ??
Message-ID: <20020621130445.A3472@sistina.com>
References: <HDECLOCKOCGGLBCFEEHCIEJPCAAA.catherineShen@iei.com.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <HDECLOCKOCGGLBCFEEHCIEJPCAAA.catherineShen@iei.com.tw>; from catherineShen@iei.com.tw on Fri, Jun 21, 2002 at 05:47:49PM +0800
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
Date: Fri Jun 21 06:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

On Fri, Jun 21, 2002 at 05:47:49PM +0800, Catherine Shen wrote:
> Hi,
>=20
> Has anyone found the VGDA corrupted very often?
> message --
> 	"ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan"
>=20
> I create a volume group "MainVG" and several LVs (and some snapshots) in =
it.
> After creating and removing the logical volumes or snapshots for several =
times,
> the VGDA error message comes up easily.
> And after "vgscan", my "MainVG" is gone.
> (But the mounted LVs work fine until next boot??)
>=20
> Should I execute "sync" every time I make changes to my LVs?
> Or should I execute "vgcfgbackup" and restore them if the error occurs?

Nope, everything should work without those.
Looks like a bug, if you can reproduce it.

Could you send the before/after metadata to me directly <mge@sistina.com>
for further investigation?

Please retrieve it with *before* the problem occurs and another
time *after* it occurs and replace "WHEN" below with before or after
respectively:

#!/bin/bash
mkdir /tmp/vgda
cd /tmp/vgda
for p in ListOfAllPVsOfTheVG
do
	dd if=3D$p of=3D$(basename $p).vgda bs=3D1k count=3D4k
done
tar cvf - *vgda | bzip2 -c > Catherine_Shen${WHEN}.vgda.tar.bz2
rm *vgda


>=20
> BTW, I resized a LV today and execute "resize2fs"; but after mounting the=
 LV again,
> the size was not what I expected??
> My command : "resize2fs -f /dev/MainVG/LV1"
> no error message at all??
>=20
> Thanks in advance!!
>=20
> Catherine=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=E5=8A{=B1=FE[=E6=99=A8=A5=8Ax%=
=8A=CBe=8A{=B1=FE[=E6=FE=C8=AC=B6)=DA=FD=CA&=86=DBi=FF=FF=E5=8A=CBl=FE=C8=
=AC=B6)=DA=FD=CA&=FEf=A2=96f=A7=FEX=AC=B6)=DF=A3=F9b=9E=EC=FF=96=F9=ABy=A7m=
=85=E2=D50s=96=FD3=9A=B6=1Bm=FF=FF=FF=C3=0C=FF=B2+-=8Av=FFr=89=BF=96=F9=BF=
=3D=A8=1E=B3=F8h=C2=DA=FF=86=D9=A5
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
