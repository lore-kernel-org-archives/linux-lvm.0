Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5IB0p019415
	for <linux-lvm@redhat.com>; Fri, 18 Jun 2004 07:00:51 -0400
Received: from fwproxy.iosmd.com ([195.6.124.189])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5IB0ne1026789
	for <linux-lvm@redhat.com>; Fri, 18 Jun 2004 07:00:50 -0400
Received: from [1.1.1.20] (pc-dev.ios.loc [1.1.1.20])
	by fwproxy.iosmd.com (AIX4.3/8.9.3p2/8.9.3) with ESMTP id NAA15992
	for <linux-lvm@redhat.com>; Fri, 18 Jun 2004 13:00:03 +0200
Message-ID: <40D2C9BA.6080301@iosmd.com>
Date: Fri, 18 Jun 2004 12:53:46 +0200
From: =?ISO-8859-15?Q?St=E9phane_Danel?= <stephane.danel@iosmd.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------050102070200010607000002"
Subject: [linux-lvm] volume group to another machine when system crashed
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------050102070200010607000002
Content-Type: text/plain; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hi,
bonjour,

I made a volume group with a SCSI tower of IBM  disk of 36 Go.

One disk is out and we are trying to restore the data.

AND the system disk crashed too.

Thus i can't do these commands to export my volume group:

http://tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html

# vgchange -an volumeGroup
# vgexport volumeGroup

If I get the Datas.
Is it possible without these commands to=20
create (or restore) my volume group to another system ?

thank you.

I am sorry for my english.... :-[=20







--=20

St=EF=BF=BDphane DANEL



--------------050102070200010607000002
Content-Type: text/html; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content=3D"text/html;charset=3DISO-8859-15"
 http-equiv=3D"Content-Type">
  <title></title>
</head>
<body bgcolor=3D"#ffffff" text=3D"#000000">
Hi,<br>
bonjour,<br>
<br>
I made a volume group with a SCSI tower of IBM=EF=BF=BD disk of 36 Go.<br>
<br>
One disk is out and we are trying to restore the data.<br>
<br>
AND the system disk crashed too.<br>
<br>
Thus i can't do these commands to export my volume group:<br>
<br>
<a class=3D"moz-txt-link-freetext" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/=
recipemovevgtonewsys.html">http://tldp.org/HOWTO/LVM-HOWTO/recipemovevgtone=
wsys.html</a><br>
<br>
# vgchange -an volumeGroup<font color=3D"#000000"><br>
</font># vgexport volumeGroup<br>
<font><font color=3D"#000000">
<pre class=3D"screen"><font color=3D"#000000"><pre class=3D"screen"><span
 class=3D"command">If I get the Datas.
Is it possible without these commands to=20
create (or restore) my volume group to another system ?

thank you.

I am sorry for my english....<span class=3D"moz-smiley-s6"><span> :-[ </spa=
n></span>


</span></pre></font>

</pre>
</font></font><br>
<br>
<br>
<div class=3D"moz-signature">-- <br>
<p style=3D"margin: 0cm 0cm 0pt;"><span
 style=3D"font-weight: normal; font-size: 10pt; color: black; font-family: =
Arial;"
 lang=3D"FR">St=EF=BF=BDphane DANEL</span></p>
<br>
</div>
</body>
</html>

--------------050102070200010607000002--
