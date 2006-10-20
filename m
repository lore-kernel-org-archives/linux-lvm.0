Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9K957rH018112
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 05:05:07 -0400
Received: from qb-out-0506.google.com (qb-out-0506.google.com [72.14.204.236])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9K94wsm019517
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 05:05:00 -0400
Received: by qb-out-0506.google.com with SMTP id b14so143054qbc
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2006 02:04:57 -0700 (PDT)
Message-ID: <da4b2d050610200204r4d95a1cclb33c3a5f2167112c@mail.gmail.com>
Date: Fri, 20 Oct 2006 10:04:57 +0100
From: "Choque Virtual Informations" <info.choquevirtual@gmail.com>
Subject: Re: [linux-lvm] Question about Physical volume
In-Reply-To: <45388202.7070305@nethinks.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_29791_2994727.1161335097321"
References: <45388202.7070305@nethinks.com>
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
To: tom@nethinks.com, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_29791_2994727.1161335097321
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

HI Thomas
I normally create a vg with vgcreate, with these steps:
1) Create the physical volume:
    pvcreate /dev/sdb
    pvcreate /dev/sdc
2) Then create the Volume Group:
    vgcreate vg00 /dev/sdb /dev/sdc
3) Create the lv
    lvcreate -L 40960M -n lvxpto /dev/vg00
4) then mke2fs -j /dev/vg00/lvxpto
5) This way, if you need more space to create new lv or to extende lvxpto,
you nedd to extend the vg00 with vgextend

I Hope that this helps you
Gon=E7alo

2006/10/20, Thomas Marmetschke <thomas.marmetschke@nethinks.com>:
>
> Hi,
>
> is it possible to extend a phyiscal volume?
>
> I have a strange problem, i resized the /dev/sda4 partion (8e Linux LVM)
> from 130GB to 220GB. so far so good.
>
> But with pvdisplay i still get the 130Gb Partion :
>
> pvdisplay
> --- Physical volume ---
> PV Name               /dev/sda4
> VG Name               msa
> PV Size               130,98 GB / not usable 0
> Allocatable           yes
> PE Size (KByte)       4096
> Total PE              33530
> Free PE               6394
> Allocated PE          27136
> PV UUID               TnggaW-0rIL-JaRp-JiwR-ZRlP-JJ83-LOjHfg
>
> Can i do something like a Rescan? that the Information will be updated.
> The big problem is that on this server a productive data so i can=B4t
> remove any partions.
>
> thx!
>
> -tom
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--=20
--=20
Gon=E7alo Jos=E9 do Casal Ribeiro Mendes Ramos
System Administrator

Choque Virtual - Tecnologias de Informa=E7=E3o Unipessoal, LDA
Edificio Colombo I
Rua Dr. M=E1rio Sacramento, N=BA 177 1=BAK
3810-106 Aveiro
Portugal
www.choque-virtual.pt
Phone: (+351) 234 194 518
Fax:     (+351) 234 194 515
Mobile Phone: (+351) 936 987 583

------=_Part_29791_2994727.1161335097321
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>HI Thomas</div>
<div>I normally create a vg with vgcreate, with these steps:</div>
<div>1) Create the physical volume:</div>
<div>&nbsp;&nbsp;&nbsp; <span lang=3D"EN-GB" style=3D"FONT-SIZE: 12pt; FONT=
-FAMILY: 'Times New Roman'; mso-fareast-font-family: 'Times New Roman'; mso=
-ansi-language: EN-GB; mso-fareast-language: PT; mso-bidi-language: AR-SA">=
pvcreate /dev/sdb
<br>&nbsp;&nbsp;&nbsp; pvcreate <font face=3D"Times New Roman">/dev/sdc</fo=
nt><br></span>2) Then create the Volume Group:</div>
<div>&nbsp;&nbsp;&nbsp; <span lang=3D"EN-GB" style=3D"FONT-SIZE: 12pt; FONT=
-FAMILY: 'Times New Roman'; mso-fareast-font-family: 'Times New Roman'; mso=
-ansi-language: EN-GB; mso-fareast-language: PT; mso-bidi-language: AR-SA">=
vgcreate vg00 /dev/sdb /dev/sdc=20
</span><br>3) Create the lv</div>
<div>&nbsp;&nbsp;&nbsp;<span lang=3D"EN-GB" style=3D"FONT-SIZE: 12pt; FONT-=
FAMILY: 'Times New Roman'; mso-fareast-font-family: 'Times New Roman'; mso-=
ansi-language: EN-GB; mso-fareast-language: PT; mso-bidi-language: AR-SA"> =
lvcreate -L 40960M -n lvxpto /dev/vg00
</span></div>
<div><span lang=3D"EN-GB" style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New=
 Roman'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-=
GB; mso-fareast-language: PT; mso-bidi-language: AR-SA">4) then <span lang=
=3D"EN-GB" style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; mso-fa=
reast-font-family: 'Times New Roman'; mso-ansi-language: EN-GB; mso-fareast=
-language: PT; mso-bidi-language: AR-SA">
mke2fs -j /dev/vg00/lvxpto</span></span></div>
<div><span lang=3D"EN-GB" style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New=
 Roman'; mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-=
GB; mso-fareast-language: PT; mso-bidi-language: AR-SA"></span>5) This way,=
 if you need more space to create new lv or to extende lvxpto, you nedd to =
extend the vg00 with vgextend
<br>&nbsp;</div>
<div>I Hope that this helps you</div>
<div>Gon=E7alo</div>
<div>&nbsp;</div>
<div><span class=3D"gmail_quote">2006/10/20, Thomas Marmetschke &lt;<a href=
=3D"mailto:thomas.marmetschke@nethinks.com">thomas.marmetschke@nethinks.com=
</a>&gt;:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi,<br><br>is it possible to ext=
end a phyiscal volume?<br><br>I have a strange problem, i resized the /dev/=
sda4 partion (8e Linux LVM)
<br>from 130GB to 220GB. so far so good.<br><br>But with pvdisplay i still =
get the 130Gb Partion :<br><br>pvdisplay<br>--- Physical volume ---<br>PV N=
ame&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; /dev/sda4<br>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msa<br>PV Size&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 130,98 G=
B / not usable 0
<br>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 yes<br>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>Total P=
E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;33530<br>Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6394<br>Allocated PE&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;27136<br>PV UUID&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TnggaW-0=
rIL-JaRp-JiwR-ZRlP-JJ83-LOjHfg<br><br>
Can i do something like a Rescan? that the Information will be updated.<br>=
The big problem is that on this server a productive data so i can=B4t<br>re=
move any partions.<br><br>thx!<br><br>-tom<br><br>_________________________=
______________________
<br>linux-lvm mailing list<br><a href=3D"mailto:linux-lvm@redhat.com">linux=
-lvm@redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/l=
inux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the=
 LVM HOW-TO at=20
<a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWT=
O/</a><br></blockquote></div><br><br clear=3D"all"><br>-- <br>-- <br>Gon=E7=
alo Jos=E9 do Casal Ribeiro Mendes Ramos<br>System Administrator<br><br>Cho=
que Virtual - Tecnologias de Informa=E7=E3o Unipessoal, LDA
<br>Edificio Colombo I<br>Rua Dr. M=E1rio Sacramento, N=BA 177 1=BAK <br>38=
10-106 Aveiro<br>Portugal<br><a href=3D"http://www.choque-virtual.pt">www.c=
hoque-virtual.pt</a><br>Phone: (+351) 234 194 518<br>Fax:&nbsp;&nbsp;&nbsp;=
&nbsp; (+351) 234 194 515
<br>Mobile Phone: (+351) 936 987 583=20

------=_Part_29791_2994727.1161335097321--
