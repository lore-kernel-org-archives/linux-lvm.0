Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m96FAFM6015516
	for <linux-lvm@redhat.com>; Mon, 6 Oct 2008 11:10:15 -0400
Received: from bay0-omc2-s23.bay0.hotmail.com (bay0-omc2-s23.bay0.hotmail.com
	[65.54.246.159])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m96F9slR032419
	for <linux-lvm@redhat.com>; Mon, 6 Oct 2008 11:09:55 -0400
Message-ID: <BAY111-W17E35B1FDD1647A5FDBFF8DA390@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_3f8c84f7-811a-4cef-b3ca-c330173e881f_"
From: Robin Thompson <robane00@hotmail.com>
Subject: RE: [linux-lvm] Help with LVM reconstruction
Date: Mon, 6 Oct 2008 16:09:47 +0100
In-Reply-To: <613158041.20081005225221@marki-online.net>
References: <mailman.0.1223142047.24795.linux-lvm@redhat.com>
	<BAY111-W46B2F1F16550BBDF7B6293DA3E0@phx.gbl>
	<310119351.20081005215811@marki-online.net>
	<BAY111-W54A5BF416B569C8DC0E99FDA3E0@phx.gbl> 
	<613158041.20081005225221@marki-online.net> 
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
To: linux-lvm@redhat.com

--_3f8c84f7-811a-4cef-b3ca-c330173e881f_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 Hi=2CIt must be 4mb per PE=2C as the other PV would be estimated to be 100=
gb=2C when it should be 50gb. Does anyone know what I should be looking for=
 on the 2nd PV - is there LVM information data stored there?Robin

> Date: Sun=2C 5 Oct 2008 22:52:21 +0200> From: marki@marki-online.net> To:=
 linux-lvm@redhat.com> Subject: Re: FW: [linux-lvm] Help with LVM reconstru=
ction> > Hello=2C> > Sunday=2C October 5=2C 2008=2C 22:47:50=2C Robin Thomp=
son wrote:> > > Hi=2C> > > > Problem is that I don't - the card will only r=
efer to it in 2gb -> > but it could be actually 2tb as in 2 x 1024 x 1024 x=
 1024 x1024 bytes.> > > > I can extract this: > > physical_volumes {> > pv0=
 {> > id =3D "QADZl1-asMf-PyLf-EIw1-qLkv-ZbFI-2goQUD"> > device =3D "/dev/s=
db1"> > status =3D ["ALLOCATABLE"]> > pe_start =3D 384> > pe_count =3D 5242=
86> > That should be enough information... But it looks like 4 TB...> > PE =
size is 8 MB and you have 524286 PEs (Physical Extents). That's> 3.99 TB (a=
ctually it's 4 TB without 16 MB - two PEs=2C maybe the PV> header is locate=
d there - I don't remember the exact LVM structure> on disk).> > -- > bYE=
=2C Marki> > > _______________________________________________> linux-lvm m=
ailing list> linux-lvm@redhat.com> https://www.redhat.com/mailman/listinfo/=
linux-lvm> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
_________________________________________________________________
Make a mini you and download it into Windows Live Messenger
http://clk.atdmt.com/UKM/go/111354029/direct/01/=

--_3f8c84f7-811a-4cef-b3ca-c330173e881f_
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
FONT-SIZE: 10pt=3B
FONT-FAMILY:Tahoma
}
</style>
</head>
<body class=3D'hmmessage'>&nbsp=3B<BR>Hi=2C<BR><BR>It must be 4mb per PE=2C=
 as the other PV would be estimated to be 100gb=2C when it should be 50gb.<=
BR>&nbsp=3B<BR>Does anyone know what I should be looking for on the 2nd PV =
- is there LVM information data stored there?<BR><BR>Robin<BR><BR>
<HR id=3DstopSpelling>
<BR>&gt=3B Date: Sun=2C 5 Oct 2008 22:52:21 +0200<BR>&gt=3B From: marki@mar=
ki-online.net<BR>&gt=3B To: linux-lvm@redhat.com<BR>&gt=3B Subject: Re: FW:=
 [linux-lvm] Help with LVM reconstruction<BR>&gt=3B <BR>&gt=3B Hello=2C<BR>=
&gt=3B <BR>&gt=3B Sunday=2C October 5=2C 2008=2C 22:47:50=2C Robin Thompson=
 wrote:<BR>&gt=3B <BR>&gt=3B &gt=3B Hi=2C<BR>&gt=3B &gt=3B <BR>&gt=3B &gt=
=3B Problem is that I don't - the card will only refer to it in 2gb -<BR>&g=
t=3B &gt=3B but it could be actually 2tb as in 2 x 1024 x 1024 x 1024 x1024=
 bytes.<BR>&gt=3B &gt=3B <BR>&gt=3B &gt=3B I can extract this: <BR>&gt=3B &=
gt=3B physical_volumes {<BR>&gt=3B &gt=3B pv0 {<BR>&gt=3B &gt=3B id =3D "QA=
DZl1-asMf-PyLf-EIw1-qLkv-ZbFI-2goQUD"<BR>&gt=3B &gt=3B device =3D "/dev/sdb=
1"<BR>&gt=3B &gt=3B status =3D ["ALLOCATABLE"]<BR>&gt=3B &gt=3B pe_start =
=3D 384<BR>&gt=3B &gt=3B pe_count =3D 524286<BR>&gt=3B <BR>&gt=3B That shou=
ld be enough information... But it looks like 4 TB...<BR>&gt=3B <BR>&gt=3B =
PE size is 8 MB and you have 524286 PEs (Physical Extents). That's<BR>&gt=
=3B 3.99 TB (actually it's 4 TB without 16 MB - two PEs=2C maybe the PV<BR>=
&gt=3B header is located there - I don't remember the exact LVM structure<B=
R>&gt=3B on disk).<BR>&gt=3B <BR>&gt=3B -- <BR>&gt=3B bYE=2C Marki<BR>&gt=
=3B <BR>&gt=3B <BR>&gt=3B _______________________________________________<B=
R>&gt=3B linux-lvm mailing list<BR>&gt=3B linux-lvm@redhat.com<BR>&gt=3B ht=
tps://www.redhat.com/mailman/listinfo/linux-lvm<BR>&gt=3B read the LVM HOW-=
TO at http://tldp.org/HOWTO/LVM-HOWTO/<BR><BR><br /><hr />Win =A33000 to sp=
end on whatever you want at Uni! <a href=3D'http://clk.atdmt.com/UKM/go/111=
354032/direct/01/' target=3D'_new'>Click here to WIN!</a></body>
</html>=

--_3f8c84f7-811a-4cef-b3ca-c330173e881f_--
