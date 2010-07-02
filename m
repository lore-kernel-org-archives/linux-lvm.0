Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o62FfLT5011092
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2010 11:41:21 -0400
Received: from web38903.mail.mud.yahoo.com (web38903.mail.mud.yahoo.com
	[209.191.125.109])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o62FfChs015931
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2010 11:41:13 -0400
Message-ID: <162631.56245.qm@web38903.mail.mud.yahoo.com>
Date: Fri, 2 Jul 2010 08:41:11 -0700 (PDT)
From: Octavio <octaviomaiden@yahoo.com>
In-Reply-To: <5C30BE7ED8B03E448B2E104602D4848A59228864AC@USINDEVS02.corp.hds.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1092890377-1278085271=:56245"
Subject: Re: [linux-lvm] rescue a lvm
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-1092890377-1278085271=:56245
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Taka
Thanks for reply and for the links, fortunately I already have recovery my =
info, Wha t I do was edit the backup of the metadata manually to remove the=
 missing disk (it doesn't have any info) then I restore the backup and done=
, the disk starts OK and all the data was there=20

Octavio



--- El lun, 6/28/10, Takahiro Yasui <takahiro.yasui@hds.com> escribi=F3:

De: Takahiro Yasui <takahiro.yasui@hds.com>
Asunto: Re: [linux-lvm] rescue a lvm
A: "LVM general discussion and development" <linux-lvm@redhat.com>
Fecha: lunes, 28 de junio de 2010, 10:19 am

Hello Octavio,

> I remove a PV from a GV on a umounted system and then I lost the whole gr=
oup, now I just have the first HD and I want to read the data it has

> I have the pv without change the the VG is lost
> I have the backup of meta data in the PV so can I wondering to know if is=
 safe to vgcfgrestore the file? or I could lost the data?

I'm not an expert of this area and not sure if you can rescue it or not,
but the following document might be helpful to you.

Chapter 6. LVM Troubleshooting
http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5.5/html/Logical_=
Volume_Manager_Administration/troubleshooting.html

6.4. Recovering Physical Volume Metadata
http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5.5/html/Logical_=
Volume_Manager_Administration/mdatarecover.html

Thanks,
Taka

--=20
Takahiro Yasui
Hitachi Data Systems

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=0A=0A=0A      
--0-1092890377-1278085271=:56245
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Hello Taka<br>Thanks for reply and for the li=
nks, fortunately I already have recovery my info, Wha t I do was edit the b=
ackup of the metadata manually to remove the missing disk (it doesn't have =
any info) then I restore the backup and done, the disk starts OK and all th=
e data was there <br><br>Octavio<br><br><br><br>--- El <b>lun, 6/28/10, Tak=
ahiro Yasui <i>&lt;takahiro.yasui@hds.com&gt;</i></b> escribi=F3:<br><block=
quote style=3D"border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; p=
adding-left: 5px;"><br>De: Takahiro Yasui &lt;takahiro.yasui@hds.com&gt;<br=
>Asunto: Re: [linux-lvm] rescue a lvm<br>A: "LVM general discussion and dev=
elopment" &lt;linux-lvm@redhat.com&gt;<br>Fecha: lunes, 28 de junio de 2010=
, 10:19 am<br><br><div class=3D"plainMail">Hello Octavio,<br><br>&gt; I rem=
ove a PV from a GV on a umounted system and then I lost the whole group, no=
w I just
 have the first HD and I want to read the data it has<br><br>&gt; I have th=
e pv without change the the VG is lost<br>&gt; I have the backup of meta da=
ta in the PV so can I wondering to know if is safe to vgcfgrestore the file=
? or I could lost the data?<br><br>I'm not an expert of this area and not s=
ure if you can rescue it or not,<br>but the following document might be hel=
pful to you.<br><br>Chapter 6. LVM Troubleshooting<br><a href=3D"http://www=
.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5.5/html/Logical_Volume_Man=
ager_Administration/troubleshooting.html" target=3D"_blank">http://www.redh=
at.com/docs/en-US/Red_Hat_Enterprise_Linux/5.5/html/Logical_Volume_Manager_=
Administration/troubleshooting.html</a><br><br>6.4. Recovering Physical Vol=
ume Metadata<br><a href=3D"http://www.redhat.com/docs/en-US/Red_Hat_Enterpr=
ise_Linux/5.5/html/Logical_Volume_Manager_Administration/mdatarecover.html"
 target=3D"_blank">http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linu=
x/5.5/html/Logical_Volume_Manager_Administration/mdatarecover.html</a><br><=
br>Thanks,<br>Taka<br><br>-- <br>Takahiro Yasui<br>Hitachi Data Systems<br>=
<br>_______________________________________________<br>linux-lvm mailing li=
st<br><a ymailto=3D"mailto:linux-lvm@redhat.com" href=3D"/mc/compose?to=3Dl=
inux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href=3D"https://www.red=
hat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.co=
m/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=3D"http:=
//tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HO=
WTO/</a><br></div></blockquote></td></tr></table><br>=0A=0A=0A=0A=0A      &=
nbsp;
--0-1092890377-1278085271=:56245--
