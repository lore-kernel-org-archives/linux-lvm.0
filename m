Message-Id: <200307080853.h688rNvG021378@ruby.ridersoft.net>
From: lvm@ruby.ridersoft.net
Subject: Re: [linux-lvm] telling LVM it's not hda8 anymore but now it's hda7
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1057654403"
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
Date: Tue Jul  8 08:06:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

--bound1057654403
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by ruby.ridersoft.net id h688rNam021379

I am not sure I understand excactly what your problem is, but wouldn't sc=
anning with the lvm tools solve your problem ?

vgscan and pvscan should find your lvm volumes, and you can activate them=
 once you've found them right ?

best regards
Mark

"Martin Milner" <martin@newdomain.nl> wrote ..
> I am such a noob. I deleted a partition. I had /dev/hda8 in an lvm volu=
me
> but i deleted a lower partition then rebooted. Now i got a kernel panic
> because my /dev/hda9 (my / ) had gone. Running fdisk and fixing the
> partition table nicely made my old /dev/hda9 to /dev/hda8 (and my hda8
> was now hda7). After some
> fumbling around with grub i got it to boot again and most of my install=
ation
> is running again. Except for my LVM stuff
>=20
> I need to tell LVM that there no longer is a /dev/hda8, that it is now
> /dev/hda7. Without losing my data.
>=20
> Anyone?=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=E5=8A{=B1=FE[=E6=99=A8=A5=8Ax%=8A=
=CBe=8A{=B1=FE[=E6=FE=C8=AC=B6)=DA=FD=CA&=86=DBi=FF=FF=E5=8A=CBl=FE=C8=AC=
=B6)=DA=FD=CA&=FEf=A2=96f=A7=FEX=AC=B6)=DF=A3=F9b=9E=EC=FF=96=F9=ABy=A7m=85=
=E2=D50s=96=FD3=9A=B6=1Bm=A7=FF=FF=B6Wi=FE=8A=E0=FCs=96L=EF=CBT=CF=C79d=CE

--bound1057654403--
