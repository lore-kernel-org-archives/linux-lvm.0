Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3ECUTq8028832
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 08:30:29 -0400
Received: from bay0-omc3-s21.bay0.hotmail.com (bay0-omc3-s21.bay0.hotmail.com
	[65.54.190.159])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3ECUIcr023747
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 08:30:20 -0400
Message-ID: <BAY110-W4728F879DCB6C9F915B971BE100@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_e321b166-f6af-4a59-9e59-ed8245f52d8d_"
From: Vickie Troy-McKoy <vtmckoy@hotmail.com>
Date: Wed, 14 Apr 2010 08:16:56 -0400
In-Reply-To: <20100414052151.GA28457@maude.comedia.it>
References: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>,
	<20100414052151.GA28457@maude.comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--_e321b166-f6af-4a59-9e59-ed8245f52d8d_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



 Thank you=3B but I've tried that command.  It gives me the output below=3B=
 however=2C I want to ensure that /dev/md10 [root_vg] resides on the intern=
al disks.  How can I ensure that?
=20
 =20
  PV         VG      Fmt  Attr PSize   PFree=20
  /dev/dm-10 san_vg  lvm2 a-   299.99G     0=20
  /dev/dm-9  san_vg  lvm2 a-   174.99G     0=20
  /dev/md10  root_vg lvm2 a-    68.22G 12.44G

Regards=2C



=20

> Date: Wed=2C 14 Apr 2010 07:21:51 +0200
> From: bluca@comedia.it
> To: linux-lvm@redhat.com
> Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
>=20
> On Tue=2C Apr 13=2C 2010 at 08:59:40PM -0400=2C Vickie Troy-McKoy wrote:
> >
> >Hi All=2C
> >
> >=20
> >
> >I have a RedHat4 server connected to a SAN 3510 Array. On the host serve=
r=2C there are two volume groups set up--root_vg and san_vg. I'm assuming t=
hat root_vg resides on the internal disks and san_vg on the SAN. But=2C how=
 can I check to make sure this is the case?
> >
> vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> try with the pvs command
>=20
> --=20
> Luca Berra -- bluca@comedia.it
> Communication Media & Services S.r.l.
> /"\
> \ / ASCII RIBBON CAMPAIGN
> X AGAINST HTML MAIL
> / \
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
 		 	   		 =20
_________________________________________________________________
Hotmail is redefining busy with tools for the New Busy. Get more from your =
inbox.
http://www.windowslive.com/campaign/thenewbusy?ocid=3DPID28326::T:WLMTAGL:O=
N:WL:en-US:WM_HMP:042010_2=

--_e321b166-f6af-4a59-9e59-ed8245f52d8d_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
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
--></style>
</head>
<body class=3D'hmmessage'>
<BR>&nbsp=3BThank you=3B but I've tried that command.&nbsp=3B It gives me t=
he output below=3B however=2C I want to ensure that /dev/md10 [root_vg] res=
ides on the internal disks.&nbsp=3B How can I ensure that?
<P>&nbsp=3B
<P>&nbsp=3B <BR>&nbsp=3B PV&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B=
&nbsp=3B&nbsp=3B VG&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B Fmt&nbsp=3B Att=
r PSize&nbsp=3B&nbsp=3B PFree <BR>&nbsp=3B /dev/dm-10 san_vg&nbsp=3B lvm2 a=
-&nbsp=3B&nbsp=3B 299.99G&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B 0 <BR>&nbsp=3B /d=
ev/dm-9&nbsp=3B san_vg&nbsp=3B lvm2 a-&nbsp=3B&nbsp=3B 174.99G&nbsp=3B&nbsp=
=3B&nbsp=3B&nbsp=3B 0 <BR>&nbsp=3B /dev/md10&nbsp=3B root_vg lvm2 a-&nbsp=
=3B&nbsp=3B&nbsp=3B 68.22G 12.44G<BR>
<P>Regards=2C<BR><BR><BR><BR>&nbsp=3B
<BR>&gt=3B Date: Wed=2C 14 Apr 2010 07:21:51 +0200<BR>&gt=3B From: bluca@co=
media.it<BR>&gt=3B To: linux-lvm@redhat.com<BR>&gt=3B Subject: Re: [linux-l=
vm] How do I tell what disk a volume group reside on<BR>&gt=3B <BR>&gt=3B O=
n Tue=2C Apr 13=2C 2010 at 08:59:40PM -0400=2C Vickie Troy-McKoy wrote:<BR>=
&gt=3B &gt=3B<BR>&gt=3B &gt=3BHi All=2C<BR>&gt=3B &gt=3B<BR>&gt=3B &gt=3B <=
BR>&gt=3B &gt=3B<BR>&gt=3B &gt=3BI have a RedHat4 server connected to a SAN=
 3510 Array. On the host server=2C there are two volume groups set up--root=
_vg and san_vg. I'm assuming that root_vg resides on the internal disks and=
 san_vg on the SAN. But=2C how can I check to make sure this is the case?<B=
R>&gt=3B &gt=3B<BR>&gt=3B vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv=
vvvvvvv<BR>&gt=3B &gt=3Bread the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HO=
WTO/<BR>&gt=3B ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<BR>=
&gt=3B <BR>&gt=3B try with the pvs command<BR>&gt=3B <BR>&gt=3B -- <BR>&gt=
=3B Luca Berra -- bluca@comedia.it<BR>&gt=3B Communication Media &amp=3B Se=
rvices S.r.l.<BR>&gt=3B /"\<BR>&gt=3B \ / ASCII RIBBON CAMPAIGN<BR>&gt=3B X=
 AGAINST HTML MAIL<BR>&gt=3B / \<BR>&gt=3B <BR>&gt=3B _____________________=
__________________________<BR>&gt=3B linux-lvm mailing list<BR>&gt=3B linux=
-lvm@redhat.com<BR>&gt=3B https://www.redhat.com/mailman/listinfo/linux-lvm=
<BR>&gt=3B read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<BR> 		 	=
   		  <br /><hr />Hotmail is redefining busy with tools for the New Busy. =
Get more from your inbox. <a href=3D'http://www.windowslive.com/campaign/th=
enewbusy?ocid=3DPID28326::T:WLMTAGL:ON:WL:en-US:WM_HMP:042010_2' target=3D'=
_new'>See how.</a></body>
</html>=

--_e321b166-f6af-4a59-9e59-ed8245f52d8d_--
