Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4EB41001F5B
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2018 08:33:43 +0000 (UTC)
Received: from mail.desktop.co.za (mail.desktop-ns.co.za [169.255.228.2])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D59A5D5EE
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2018 08:33:39 +0000 (UTC)
From: Jaco van Niekerk <jaco@desktop.co.za>
Date: Mon, 27 Aug 2018 08:33:55 +0000
Message-ID: <83AC2A1B573A1341BD85C441C9109F591D927C29@desktoptdc.desktop.local>
References: <83AC2A1B573A1341BD85C441C9109F591D925AE2@desktoptdc.desktop.local>
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_";
	type="multipart/alternative"
MIME-Version: 1.0
Subject: Re: [linux-lvm] Volume/Logic group failed to start - Pacemaker
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_004_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_
Content-Type: multipart/alternative;
	boundary="_000_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_"

--_000_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

Same thing happens when I try and start the volume group:

vgchange -a y vg_iscsi -v
  WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs on /dev/vg_drbd/lv_drb=
d was already found on /dev/drbd0.
  WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs prefers device /dev/vg=
_drbd/lv_drbd because device is in dm subsystem.
    Activating logical volume vg_iscsi/lv_iscsi_lun0.
    activation/volume_list configuration setting not defined: Checking only=
 host tags for vg_iscsi/lv_iscsi_lun0.
    Creating vg_iscsi-lv_iscsi_lun0
    Loading table for vg_iscsi-lv_iscsi_lun0 (253:3).
  device-mapper: reload ioctl on  (253:3) failed: Device or resource busy
    Removing vg_iscsi-lv_iscsi_lun0 (253:3)
    Activated 0 logical volumes in volume group vg_iscsi
  0 logical volume(s) in volume group "vg_iscsi" now active


Regards

Jaco van Niekerk

Office:   011 608 2663  E-mail:  jaco@desktop.co.za
[Desktop]
accepts no liability for the content of this email, or for the consequences=
 of any actions taken on the basis of the information provided, unless that=
 information is subsequently confirmed in writing. If you are not the inten=
ded recipient, you are notified that disclosing, copying, distributing or t=
aking any action in reliance on the contents of this information is strictl=
y prohibited.

Disclaimer added by CodeTwo Exchange Rules 2010
www.codetwo.com<http://www.codetwo.com/?sts=3D1048>
On 27/08/2018 09:19, Jaco van Niekerk wrote:

Hi

I am receiving the following error when Pacemaker tries to start the LVM vo=
lume/logical groups:

pcs resource debug-start r_lvm
Operation start for r_lvm (ocf:heartbeat:LVM) returned: 'unknown error' (1)
 >  stdout: volume_list=3D["centos","vg_drbd"]
 >  stderr:   WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs prefers de=
vice /dev/vg_drbd/lv_drbd because device is in dm subsystem.
 >  stderr: mkdir: cannot create directory '/run/systemd/system/resource-ag=
ents-deps.target.d': File exists
 >  stderr: INFO: Activating volume group vg_iscsi
 >  stderr: INFO: Reading all physical volumes. This may take a while... Fo=
und volume group "vg_iscsi" using metadata type lvm2 Found volume group "ce=
ntos" using metadata type lvm2 Found volume group "vg_drbd" using metadata =
type lvm2
 >  stderr: WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs prefers devi=
ce /dev/vg_drbd/lv_drbd because device is in dm subsystem. device-mapper: r=
eload ioctl on (253:3) failed: Device or resource busy 0 logical volume(s) =
in volume group "vg_iscsi" now active


Regards

--

Jaco van Niekerk

Office:   011 608 2663  E-mail:  jaco@desktop.co.za
[Desktop]
accepts no liability for the content of this email, or for the consequences=
 of any actions taken on the basis of the information provided, unless that=
 information is subsequently confirmed in writing. If you are not the inten=
ded recipient, you are notified that disclosing, copying, distributing or t=
aking any action in reliance on the contents of this information is strictl=
y prohibited.

Disclaimer added by CodeTwo Exchange Rules 2010
www.codetwo.com<http://www.codetwo.com/?sts=3D1048>


--_000_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<p>Hi</p>
<p>Same thing happens when I try and start the volume group:</p>
<p>vgchange -a y vg_iscsi -v<br>
&nbsp; WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs on /dev/vg_drbd/l=
v_drbd was already found on /dev/drbd0.<br>
&nbsp; WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs prefers device /d=
ev/vg_drbd/lv_drbd because device is in dm subsystem.<br>
&nbsp;&nbsp;&nbsp; Activating logical volume vg_iscsi/lv_iscsi_lun0.<br>
&nbsp;&nbsp;&nbsp; activation/volume_list configuration setting not defined=
: Checking only host tags for vg_iscsi/lv_iscsi_lun0.<br>
&nbsp;&nbsp;&nbsp; Creating vg_iscsi-lv_iscsi_lun0<br>
&nbsp;&nbsp;&nbsp; Loading table for vg_iscsi-lv_iscsi_lun0 (253:3).<br>
&nbsp; device-mapper: reload ioctl on&nbsp; (253:3) failed: Device or resou=
rce busy<br>
&nbsp;&nbsp;&nbsp; Removing vg_iscsi-lv_iscsi_lun0 (253:3)<br>
&nbsp;&nbsp;&nbsp; Activated 0 logical volumes in volume group vg_iscsi<br>
&nbsp; 0 logical volume(s) in volume group &quot;vg_iscsi&quot; now active<=
br>
<br>
</p>
<p>Regards<br>
</p>
<div class=3D"moz-signature">
<p style=3D"font-family: Arial; background-color: rgb(255, 255,=0A=
        255); margin-bottom: 6pt; margin-top: 6pt;">
<span style=3D"font-size: 13.3333px;">Jaco van Niekerk</span></p>
<br>
<span style=3D"font-family: Arial; font-size: 10pt; font-weight:=0A=
        bold; color: rgb(0, 77, 187);"><font color=3D"#2b86cc">Office:</fon=
t></span>
<span style=3D"font-family: Arial; font-size: 11pt;">&nbsp;</span> <span st=
yle=3D"font-family: Arial; font-size: 10pt;">
011 608 2663</span><span style=3D"font-family: Arial; font-size: 10pt;">&nb=
sp;</span> <span style=3D"font-family: Arial; font-size: 10pt; font-weight:=
 bold;=0A=
        color: rgb(0, 77, 187);">
<font color=3D"#2b86cc">E-mail:</font></span> <span style=3D"font-family: A=
rial; font-size: 10pt;">
&nbsp;jaco</span><span style=3D"font-family: Arial; font-size: 10pt;">@desk=
top.co.za</span><br>
<img src=3D"cid:part1.CB34B8DE.ACB1DCB3@desktop.co.za" alt=3D"Desktop"><br>
<span style=3D"color: rgb(165, 165, 165); font-size: 10pt;=0A=
        background-color: rgb(255, 255, 255); font-family: Arial;">accepts =
no liability for the content of this email, or for the consequences of any =
actions taken on the basis of the information provided,
 unless that information is subsequently confirmed in writing. If you are n=
ot the intended recipient, you are notified that disclosing, copying, distr=
ibuting or taking any action in reliance on the contents of this informatio=
n is strictly prohibited.</span>
<div style=3D"background-color: rgb(255, 255, 255); color: rgb(153,=0A=
        153, 153); font-size: 11px; font-family: verdana;">
<br>
Disclaimer added by&nbsp;<b>CodeTwo Exchange Rules 2010</b><br>
<a style=3D"color: purple;" href=3D"http://www.codetwo.com/?sts=3D1048">www=
.codetwo.com</a></div>
</div>
<div class=3D"moz-cite-prefix">On 27/08/2018 09:19, Jaco van Niekerk wrote:=
<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:83AC2A1B573A1341BD85C441C9109F591D925=
AE2@desktoptdc.desktop.local">
<p>Hi</p>
<p>I am receiving the following error when Pacemaker tries to start the LVM=
 volume/logical groups:</p>
<p>pcs resource debug-start r_lvm<br>
Operation start for r_lvm (ocf:heartbeat:LVM) returned: 'unknown error' (1)=
<br>
&nbsp;&gt;&nbsp; stdout: volume_list=3D[&quot;centos&quot;,&quot;vg_drbd&qu=
ot;]<br>
&nbsp;&gt;&nbsp; stderr:&nbsp;&nbsp; WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D=
-OJBe-GdscSs prefers device /dev/vg_drbd/lv_drbd because device is in dm su=
bsystem.<br>
&nbsp;&gt;&nbsp; stderr: mkdir: cannot create directory '/run/systemd/syste=
m/resource-agents-deps.target.d': File exists<br>
&nbsp;&gt;&nbsp; stderr: INFO: Activating volume group vg_iscsi<br>
&nbsp;&gt;&nbsp; stderr: INFO: Reading all physical volumes. This may take =
a while... Found volume group &quot;vg_iscsi&quot; using metadata type lvm2=
 Found volume group &quot;centos&quot; using metadata type lvm2 Found volum=
e group &quot;vg_drbd&quot; using metadata type lvm2<br>
&nbsp;&gt;&nbsp; stderr: WARNING: PV Tj9uTS-m5QT-10el-boNH-Yu2D-OJBe-GdscSs=
 prefers device /dev/vg_drbd/lv_drbd because device is in dm subsystem. dev=
ice-mapper: reload ioctl on (253:3) failed: Device or resource busy 0 logic=
al volume(s) in volume group &quot;vg_iscsi&quot; now active<br>
<br>
</p>
<p>Regards<br>
</p>
<div class=3D"moz-signature">-- <br>
<p style=3D"font-family: Arial; background-color: rgb(255, 255,=0A=
          255); margin-bottom: 6pt; margin-top: 6pt;">
<span style=3D"font-size: 13.3333px;">Jaco van Niekerk</span></p>
<br>
<span style=3D"font-family: Arial; font-size: 10pt; font-weight:=0A=
          bold; color: rgb(0, 77, 187);"><font color=3D"#2b86cc">Office:</f=
ont></span>
<span style=3D"font-family: Arial; font-size: 11pt;">&nbsp;</span> <span st=
yle=3D"font-family: Arial; font-size: 10pt;">
011 608 2663</span><span style=3D"font-family: Arial; font-size:=0A=
          10pt;">&nbsp;</span>
<span style=3D"font-family: Arial; font-size:=0A=
          10pt; font-weight: bold; color: rgb(0, 77, 187);">
<font color=3D"#2b86cc">E-mail:</font></span> <span style=3D"font-family: A=
rial; font-size: 10pt;">
&nbsp;jaco</span><span style=3D"font-family: Arial; font-size: 10pt;">@desk=
top.co.za</span><br>
<img><br>
<span style=3D"color: rgb(165, 165, 165); font-size: 10pt;=0A=
          background-color: rgb(255, 255, 255); font-family: Arial;">accept=
s no liability for the content of this email, or for the consequences of an=
y actions taken on the basis of the information provided,
 unless that information is subsequently confirmed in writing. If you are n=
ot the intended recipient, you are notified that disclosing, copying, distr=
ibuting or taking any action in reliance on the contents of this informatio=
n is strictly prohibited.</span>
<div style=3D"background-color: rgb(255, 255, 255); color:=0A=
          rgb(153, 153, 153); font-size: 11px; font-family: verdana;">
<br>
Disclaimer added by&nbsp;<b>CodeTwo Exchange Rules 2010</b><br>
<a style=3D"color: purple;" href=3D"http://www.codetwo.com/?sts=3D1048" moz=
-do-not-send=3D"true">www.codetwo.com</a></div>
</div>
</blockquote>
<br>
</body>
</html>

--_000_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_--

--_004_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_
Content-Type: image/png; name="Signature.png"
Content-Description: Signature.png
Content-Disposition: inline; filename="Signature.png"; size=17343;
	creation-date="Mon, 27 Aug 2018 08:33:55 GMT";
	modification-date="Mon, 27 Aug 2018 08:33:55 GMT"
Content-ID: <part1.CB34B8DE.ACB1DCB3@desktop.co.za>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAlMAAAC/CAYAAADaWFk4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAQ2FJREFUeNrsvQl4HNd153uqsQNcmosoStQCKo6tRHIE2XHGtvws0Jbz
YjsTkXEmM7GTUWOcmUky34zIyWS+yXvfDMmXN0vely+k4jiJxgtAyyIlSiRA7bRkAfIWayPBXSRF
ClyxkUBjR6O7qt49Vbeqb1VXL1i6iAb+P6nY6Opabt2quvd/zz33XCIAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAWLxqyADB3tZyJio+GuTiWaZriH/7DIOtP
8Q8vmun9TbM+TGcnufCH/Ru528t9iT+d/ZX93P3tPw3nwebzOisDH36xlaZZW0TUN0KTr4X6Kf43
Nc3ax5TbaJr82/oaSe/r7BdxfrR/c7bX5L72Zlr8g6/f3Vniz02zWKI3OCld52MfblrM7/AvNJ+O
itepWTzPUetRFM+/+y7I98B5Xex3gzzvkPObRv7vcm+5QjO9b5Xx6nOU6nzT3ic1Jd5p3fkpLpam
viuvxW9Eftz+lz9v1NLXGBVpbkh/d8oTuo+fXVNeo+bkBTnXmi5TlAzzfffmj/M9Y51pBpSV6mF8
v5vKcaZZqWuBtXt6RSSg5tfUnayyzncIuU4logUf1y0XnadPlolOOcu/G6+2dpkXz11Qj3f1/f3b
SvX9K4eMALJCbJ8TMeUXO/7SwVOw+wSRv9B3f5eFW5CAUs6pFohuYZglKfxuO8fkF95wCg9TntDa
IPPTKiRMKa6sA2vkKj9ZDWn+/eRvdiK1jEJu/XdP25vZBU6nrISYN+Sns65TCIb4gnxu5iY920X+
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
PYr0AAAAAElFTkSuQmCC

--_004_83AC2A1B573A1341BD85C441C9109F591D927C29desktoptdcdeskt_--
