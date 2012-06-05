Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q552oLR2022839
	for <linux-lvm@redhat.com>; Mon, 4 Jun 2012 22:50:21 -0400
Received: from nm18.bullet.mail.sp2.yahoo.com (nm18.bullet.mail.sp2.yahoo.com
	[98.139.91.88])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q552oKlH023848
	for <linux-lvm@redhat.com>; Mon, 4 Jun 2012 22:50:20 -0400
References: <1338839030.65847.YahooMailNeo@web43136.mail.sp1.yahoo.com>
	<1338839157.25152.YahooMailNeo@web43136.mail.sp1.yahoo.com>
	<4FCD131E.7090904@redhat.com>
Message-ID: <1338864619.52368.YahooMailNeo@web43140.mail.sp1.yahoo.com>
Date: Mon, 4 Jun 2012 19:50:19 -0700 (PDT)
From: shashank khandelwal <khandu20@yahoo.com>
In-Reply-To: <4FCD131E.7090904@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="-123459156-1465914698-1338864619=:52368"
Subject: [linux-lvm] Fw: Fw: Query on vgchange: Please help
Reply-To: shashank khandelwal <khandu20@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Cc: "pmyers@redhat.com" <pmyers@redhat.com>, "fdinitto@redhat.com" <fdinitto@redhat.com>

---123459156-1465914698-1338864619=:52368
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi =0A=A0=0ARequest you to help me with the issue resolution.=0A=A0I am get=
ting vgchange addtag error sometimes when my vg is trying to come online. N=
ot able to get the reason behind this. It's a random behaviour and may not =
occur next time when the same package fails over to this node and will succ=
essfully come online.=0A=0AWARNING: Locking disabled. Be careful! This coul=
d corrupt your metadata.=0Avg_tag=0AAttempting to addtag to vg TestVG21...=
=0Avgchange --addtag error:=0AWARNING: Locking disabled. Be careful! This c=
ould corrupt your metadata. /dev/mpath/mpath89: write failed after 0 of 409=
6 at 8192: Operation not permitted=0AActivating volume group TestVG21 .=0As=
g_filesystems=0Asg_check_and_mount=0AChecking filesystems:=0A/dev/TestVG21/=
TestLV21=0Ae2fsck 1.39 (29-May-2006)=0Ae2fsck: No such file or directory wh=
ile trying to open /dev/TestVG21/TestLV21=0A=0AThe superblock could not be =
read or does not describe a correct ext2=0Afilesystem.  If the device is va=
lid and it really contains an ext2=0Afilesystem (and not swap or ufs or som=
ething else), then the superblock=0Ais corrupt, and you might try running e=
2fsck with an alternate superblock:=0Ae2fsck -b 8193 <device>=0A=0AIn the s=
imilar environment sometimes i also get this error:=0A=0Amount: unknown fil=
esystem type 'ext3'=0A=A0=0A=0A----- Forwarded Message -----=0AFrom: Perry =
Myers <pmyers@redhat.com>=0ATo: shashank khandelwal <khandu20@yahoo.com>=0A=
Cc: "fdinitto@redhat.com" <fdinitto@redhat.com>; Lon Hohberger <lhh@redhat.=
com>=0ASent: Tuesday, June 5, 2012 1:27 AM=0ASubject: Re: Fw: Query on vgch=
ange: Please help=0A=0AOn 06/04/2012 03:45 PM, shashank khandelwal wrote:=
=0A> Hi=0A> =0A> Since Lon is out of office would request you to help me wi=
th the query.=0A=0AHi,=0A=0AI'm more on the management side so probably can=
't help you much with=0Atechnical issues.=A0 Have you emailed your question=
 to one of the upstream=0Amailing lists?=A0 I'm sure Fabio or someone upstr=
eam can help you with the=0Abelow question.=0A=0AThanks,=0A=0APerry=0A=0A> =
Regards=0A> Sk=0A> =0A> ----- Forwarded Message -----=0A> *From:* shashank =
khandelwal <khandu20@yahoo.com>=0A> *To:* Lon Hohberger <lhh@redhat.com>=0A=
> *Cc:* "fdinitto@redhat.com" <fdinitto@redhat.com>=0A> *Sent:* Tuesday, Ju=
ne 5, 2012 1:13 AM=0A> *Subject:* Query on vgchange: Please help=0A> =0A>=
=A0 Hi Lon=0A> =0A> Bothering you again for one of my cluster software rela=
ted issue.=0A> I am getting vgchange addtag error sometimes when my vg is t=
rying to=0A> come online. Not able to get the reason behind this. It's a ra=
ndom=0A> behaviour and may not occur next time when the same package fails =
over=0A> to this node and will successfully come online.=0A> =0A> WARNING: =
Locking disabled. Be careful! This could corrupt your metadata.=0A>=A0 vg_t=
ag=0A> Attempting to addtag to vg TestVG21...=0A> vgchange --addtag error:=
=0A> WARNING: Locking disabled. Be careful! This could corrupt your metadat=
a.=0A> /dev/mpath/mpath89: write failed after 0 of 4096 at 8192: Operation =
not=0A> permitted=0A> Activating volume group TestVG21 .=0A> sg_filesystems=
=0A>=A0 sg_check_and_mount=0A>=A0 Checking filesystems:=0A>=A0 =A0 /dev/Tes=
tVG21/TestLV21=0A> e2fsck 1.39 (29-May-2006)=0A> e2fsck: No such file or di=
rectory while trying to open=0A> /dev/TestVG21/TestLV21=0A> =0A> The superb=
lock could not be read or does not describe a correct ext2=0A> filesystem.=
=A0 If the device is valid and it really contains an ext2=0A> filesystem (a=
nd not swap or ufs or something else), then the superblock=0A> is corrupt, =
and you might try running e2fsck with an alternate superblock:=0A>=A0 =A0  =
e2fsck -b 8193 <device>=0A> =0A> In the similar environment sometimes i als=
o get this error:=0A> =0A> mount: unknown filesystem type 'ext3'=0A> =0A> 
---123459156-1465914698-1338864619=:52368
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:; background-color:; font-family:times new =
roman, new york, times, serif;font-size:12pt"><div><span>Hi </span></div><d=
iv><span></span>&nbsp;</div><div><span>Request you to help me with the issu=
e resolution.</span></div><div><span></span>&nbsp;</div><span><div><font fa=
ce=3D"times new roman, new york, times, serif"><span style=3D"font-size: 19=
px;">I am getting vgchange addtag error sometimes when my vg is trying to c=
ome online. Not able to get the reason behind this. It's a random behaviour=
 and may not occur next time when the same package fails over to this node =
and will successfully come online.</span></font></div><div><font face=3D"ti=
mes new roman, new york, times, serif"><span style=3D"font-size: 19px;"><br=
></span></font></div><div><font face=3D"times new roman, new york, times, s=
erif"><span style=3D"font-size: 19px;">WARNING: Locking disabled. Be carefu=
l! This could corrupt your metadata.</span></font></div><div><font face=3D"=
times new
 roman, new york, times, serif"><span style=3D"font-size: 19px;"> vg_tag</s=
pan></font></div><div><font face=3D"times new roman, new york, times, serif=
"><span style=3D"font-size: 19px;">Attempting to addtag to vg TestVG21...</=
span></font></div><div><font face=3D"times new roman, new york, times, seri=
f"><span style=3D"font-size: 19px;">vgchange <span style=3D"background-colo=
r: rgb(255, 255, 0);">--addtag error</span>:</span></font></div><div><font =
face=3D"times new roman, new york, times, serif"><span style=3D"font-size: =
19px;">WARNING: Locking disabled. Be careful! This could corrupt your metad=
ata. /dev/mpath/mpath89: write failed after 0 of 4096 at 8192: <span style=
=3D"background-color: rgb(255, 255, 0);">Operation not permitted</span></sp=
an></font></div><div><font face=3D"times new roman, new york, times, serif"=
><span style=3D"font-size: 19px;">Activating volume group TestVG21 .</span>=
</font></div><div><font face=3D"times new roman, new york, times, serif"><s=
pan
 style=3D"font-size: 19px;">sg_filesystems</span></font></div><div><font fa=
ce=3D"times new roman, new york, times, serif"><span style=3D"font-size: 19=
px;"> sg_check_and_mount</span></font></div><div><font face=3D"times new ro=
man, new york, times, serif"><span style=3D"font-size: 19px;"> Checking fil=
esystems:</span></font></div><div><font face=3D"times new roman, new york, =
times, serif"><span style=3D"font-size: 19px;">   /dev/TestVG21/TestLV21</s=
pan></font></div><div><font face=3D"times new roman, new york, times, serif=
"><span style=3D"font-size: 19px;">e2fsck 1.39 (29-May-2006)</span></font><=
/div><div><font face=3D"times new roman, new york, times, serif"><span styl=
e=3D"font-size: 19px; background-color: rgb(255, 255, 0);">e2fsck: No such =
file or directory while trying to open /dev/TestVG21/TestLV21</span></font>=
</div><div><font face=3D"times new roman, new york, times, serif"><span sty=
le=3D"font-size: 19px;"><br></span></font></div><div><font face=3D"times ne=
w roman, new york,
 times, serif"><span style=3D"font-size: 19px;">The superblock could not be=
 read or does not describe a correct ext2</span></font></div><div><font fac=
e=3D"times new roman, new york, times, serif"><span style=3D"font-size: 19p=
x;">filesystem.  If the device is valid and it really contains an ext2</spa=
n></font></div><div><font face=3D"times new roman, new york, times, serif">=
<span style=3D"font-size: 19px;">filesystem (and not swap or ufs or somethi=
ng else), then the superblock</span></font></div><div><font face=3D"times n=
ew roman, new york, times, serif"><span style=3D"font-size: 19px;">is corru=
pt, and you might try running e2fsck with an alternate superblock:</span></=
font></div><div><font face=3D"times new&#10; roman, new york, times, serif"=
><span style=3D"font-size: 19px;">    e2fsck -b 8193 &lt;device&gt;</span><=
/font></div><div style=3D"font-family: times, serif; font-size: 14pt;"><br>=
</div><div style=3D"font-family: times, serif; font-size: 14pt;"><span
 style=3D"background-color: rgb(255, 255, 0);">In the similar environment s=
ometimes i also get this error:</span></div><div style=3D"font-family: time=
s, serif; font-size: 14pt;"><br></div><div style=3D"font-family: times, ser=
if;"><div class=3D"yiv623963893MsoNormal"><span style=3D"font-family: Arial=
, sans-serif;">mount: unknown filesystem type 'ext3'</span><span style=3D"f=
ont-family: Verdana, sans-serif; font-size: 9pt;"></span></div></div></span=
><div><var id=3D"yui-ie-cursor"></var>&nbsp;<br> <div>----- Forwarded Messa=
ge -----<br> From: Perry Myers &lt;pmyers@redhat.com&gt;<br> To: shashank k=
handelwal &lt;khandu20@yahoo.com&gt;<br> Cc: "fdinitto@redhat.com" &lt;fdin=
itto@redhat.com&gt;; Lon Hohberger &lt;lhh@redhat.com&gt;<br> Sent: Tuesday=
, June 5, 2012 1:27 AM<br> Subject: Re: Fw: Query on vgchange: Please help<=
br> <br>On 06/04/2012 03:45 PM, shashank khandelwal wrote:<br>&gt; Hi<br>&g=
t; <br>&gt; Since Lon is out of office would request you to help me with th=
e
 query.<br><br>Hi,<br><br>I'm more on the management side so probably can't=
 help you much with<br>technical issues.&nbsp; Have you emailed your questi=
on to one of the upstream<br>mailing lists?&nbsp; I'm sure Fabio or someone=
 upstream can help you with the<br>below question.<br><br>Thanks,<br><br>Pe=
rry<br><br>&gt; Regards<br>&gt; Sk<br>&gt; <br>&gt; ----- Forwarded Message=
 -----<br>&gt; *From:* shashank khandelwal &lt;<a href=3D"mailto:khandu20@y=
ahoo.com" ymailto=3D"mailto:khandu20@yahoo.com">khandu20@yahoo.com</a>&gt;<=
br>&gt; *To:* Lon Hohberger &lt;<a href=3D"mailto:lhh@redhat.com" ymailto=
=3D"mailto:lhh@redhat.com">lhh@redhat.com</a>&gt;<br>&gt; *Cc:* "<a href=3D=
"mailto:fdinitto@redhat.com" ymailto=3D"mailto:fdinitto@redhat.com">fdinitt=
o@redhat.com</a>" &lt;<a href=3D"mailto:fdinitto@redhat.com" ymailto=3D"mai=
lto:fdinitto@redhat.com">fdinitto@redhat.com</a>&gt;<br>&gt; *Sent:* Tuesda=
y, June 5, 2012 1:13 AM<br>&gt; *Subject:* Query on vgchange: Please help<b=
r>&gt;
 <br>&gt;&nbsp; Hi Lon<br>&gt; <br>&gt; Bothering you again for one of my c=
luster software related issue.<br>&gt; I am getting vgchange addtag error s=
ometimes when my vg is trying to<br>&gt; come online. Not able to get the r=
eason behind this. It's a random<br>&gt; behaviour and may not occur next t=
ime when the same package fails over<br>&gt; to this node and will successf=
ully come online.<br>&gt; <br>&gt; WARNING: Locking disabled. Be careful! T=
his could corrupt your metadata.<br>&gt;&nbsp; vg_tag<br>&gt; Attempting to=
 addtag to vg TestVG21...<br>&gt; vgchange --addtag error:<br>&gt; WARNING:=
 Locking disabled. Be careful! This could corrupt your metadata.<br>&gt; /d=
ev/mpath/mpath89: write failed after 0 of 4096 at 8192: Operation not<br>&g=
t; permitted<br>&gt; Activating volume group TestVG21 .<br>&gt; sg_filesyst=
ems<br>&gt;&nbsp; sg_check_and_mount<br>&gt;&nbsp; Checking filesystems:<br=
>&gt;&nbsp; &nbsp; /dev/TestVG21/TestLV21<br>&gt; e2fsck 1.39
 (29-May-2006)<br>&gt; e2fsck: No such file or directory while trying to op=
en<br>&gt; /dev/TestVG21/TestLV21<br>&gt; <br>&gt; The superblock could not=
 be read or does not describe a correct ext2<br>&gt; filesystem.&nbsp; If t=
he device is valid and it really contains an ext2<br>&gt; filesystem (and n=
ot swap or ufs or something else), then the superblock<br>&gt; is corrupt, =
and you might try running e2fsck with an alternate superblock:<br>&gt;&nbsp=
; &nbsp;  e2fsck -b 8193 &lt;device&gt;<br>&gt; <br>&gt; In the similar env=
ironment sometimes i also get this error:<br>&gt; <br>&gt; mount: unknown f=
ilesystem type 'ext3'<br>&gt; <br>&gt; <br><br> </div> </div> </div></body>=
</html>
---123459156-1465914698-1338864619=:52368--
