Message-ID: <BAY107-W29C6E87177CC7E627964F28F0D0@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_526f0a19-68f3-4bf7-9481-a6392a800f32_"
From: Mark Reardon <markreardon4@hotmail.com>
Subject: RE: [linux-lvm] messages in /var/adm
Date: Wed, 19 Nov 2008 11:39:35 +0000
In-Reply-To: <491C4285.20302@redhat.com>
References: <BAY107-W26871D7D9114EE57CB567B8F170@phx.gbl>
	<491C4285.20302@redhat.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: bmr@redhat.com
Cc: linux-lvm@redhat.com

--_526f0a19-68f3-4bf7-9481-a6392a800f32_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello All=2C

Would anybody have a list of return codes and their meenings to hand?

Thanks=2C

Kind regards.

Mark=2C

> Date: Thu=2C 13 Nov 2008 15:06:45 +0000
> From: bmr@redhat.com
> To: markreardon4@hotmail.com
> Subject: Re: [linux-lvm] messages in /var/adm
>=20
> Mark Reardon wrote:
> > Hello All=2C
> >=20
> > Has anybody ever come across these messages before.  They have only sta=
rted logging since we upgrade our kernel and PowerPath version.
> >=20
> > Redhat 4 U7
> >=20
> > kernel: SCSI error : <1 0 0 19> return code =3D=20
> > 0x8000002
> > kernel: Current sdt: sense key Aborted=20
> > Command
> > kernel: Additional sense: Internal target=20
> > failure
>=20
> Hi Mark=2C
>=20
> This is a very specific SCSI error message. The storage controller is=20
> telling us that it had to abort the I/O command and that this occurred=20
> due to an internal failure. This is a quite rare error to see in a fibre=
=20
> channel storage environment.
>=20
> What type of arrays are you using here? I have seen this specific error=20
> combination with certain firmware revisions on Hitachi arrays in the=20
> past (although it is possible with other vendors/products).
>=20
> If you'd like to open a support request with Red Hat Global Support=20
> Services and pass me the ticket details=2C I'll make sure that it gets=20
> escalated to my group for further analysis.
>=20
> Kind regards=2C
> Bryn.
>=20
> ----------------------------------------------------------------
>   Bryn M. Reeves                         direct: +44 1252 362926
>   Senior Software Maintenance Engineer   mobile: +44 7740 812997
>   Red Hat=2C 200 Fowler Avenue=2C  Farnborough=2C Hants=2C UK.  GU14 7JP
>   GnuPG : C61463DE BE48 187A 378B D0FD 7773  49AF E984 90A0 C614
> ----------------------------------------------------------------

_________________________________________________________________
BigSnapSearch.com - 24 prizes a day=2C every day - Search Now!
http://clk.atdmt.com/UKM/go/117442309/direct/01/=

--_526f0a19-68f3-4bf7-9481-a6392a800f32_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style>
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Verdana
}
</style>
</head>
<body class=3D'hmmessage'>
Hello All=2C<br><br>Would anybody have a list of return codes and their mee=
nings to hand?<br><br>Thanks=2C<br><br>Kind regards.<br><br>Mark=2C<br><br>=
&gt=3B Date: Thu=2C 13 Nov 2008 15:06:45 +0000<br>&gt=3B From: bmr@redhat.c=
om<br>&gt=3B To: markreardon4@hotmail.com<br>&gt=3B Subject: Re: [linux-lvm=
] messages in /var/adm<br>&gt=3B <br>&gt=3B Mark Reardon wrote:<br>&gt=3B &=
gt=3B Hello All=2C<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B Has anybody ever come=
 across these messages before.  They have only started logging since we upg=
rade our kernel and PowerPath version.<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B R=
edhat 4 U7<br>&gt=3B &gt=3B <br>&gt=3B &gt=3B kernel: SCSI error : &lt=3B1 =
0 0 19&gt=3B return code =3D <br>&gt=3B &gt=3B 0x8000002<br>&gt=3B &gt=3B k=
ernel: Current sdt: sense key Aborted <br>&gt=3B &gt=3B Command<br>&gt=3B &=
gt=3B kernel: Additional sense: Internal target <br>&gt=3B &gt=3B failure<b=
r>&gt=3B <br>&gt=3B Hi Mark=2C<br>&gt=3B <br>&gt=3B This is a very specific=
 SCSI error message. The storage controller is <br>&gt=3B telling us that i=
t had to abort the I/O command and that this occurred <br>&gt=3B due to an =
internal failure. This is a quite rare error to see in a fibre <br>&gt=3B c=
hannel storage environment.<br>&gt=3B <br>&gt=3B What type of arrays are yo=
u using here? I have seen this specific error <br>&gt=3B combination with c=
ertain firmware revisions on Hitachi arrays in the <br>&gt=3B past (althoug=
h it is possible with other vendors/products).<br>&gt=3B <br>&gt=3B If you'=
d like to open a support request with Red Hat Global Support <br>&gt=3B Ser=
vices and pass me the ticket details=2C I'll make sure that it gets <br>&gt=
=3B escalated to my group for further analysis.<br>&gt=3B <br>&gt=3B Kind r=
egards=2C<br>&gt=3B Bryn.<br>&gt=3B <br>&gt=3B ----------------------------=
------------------------------------<br>&gt=3B   Bryn M. Reeves            =
             direct: +44 1252 362926<br>&gt=3B   Senior Software Maintenanc=
e Engineer   mobile: +44 7740 812997<br>&gt=3B   Red Hat=2C 200 Fowler Aven=
ue=2C  Farnborough=2C Hants=2C UK.  GU14 7JP<br>&gt=3B   GnuPG : C61463DE B=
E48 187A 378B D0FD 7773  49AF E984 90A0 C614<br>&gt=3B --------------------=
--------------------------------------------<br><br /><hr />Click here for =
FREE customisable desktop wallpapers. <a href=3D'http://wallpapers.msn.com/=
?ocid=3D[B001MSN42A0716B]' target=3D'_new'>Get them Now!</a></body>
</html>=

--_526f0a19-68f3-4bf7-9481-a6392a800f32_--
