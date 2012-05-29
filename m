Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4TBxF4t028571
	for <linux-lvm@redhat.com>; Tue, 29 May 2012 07:59:15 -0400
Received: from bay0-omc3-s26.bay0.hotmail.com (bay0-omc3-s26.bay0.hotmail.com
	[65.54.190.164])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4TBxEp9021807
	for <linux-lvm@redhat.com>; Tue, 29 May 2012 07:59:14 -0400
Message-ID: <BAY166-W60B477669A8522D41C708D86050@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_c1e0af01-c0ba-4565-95bf-e71884f6cb4a_"
From: abdul jabbar <ajsaif_11@hotmail.com>
Date: Tue, 29 May 2012 17:29:14 +0530
MIME-Version: 1.0
Subject: [linux-lvm] LVM disappeared
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

--_c1e0af01-c0ba-4565-95bf-e71884f6cb4a_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi=2C

I am going trough a peculiar problem after Linux server reboot.

I had rebooted RHEL-5.3 server and found /var filesystem got corrupted and =
i was able to restore /var from Mondorescue image which was  taken 1 month =
back.

I had 2 VGs with a LV configured under each VG.=20
After reboot i lost one of my Lvs =2CVG under which Lv is created showing "=
 0 logical volume(s) in volume group "VGGLOTAM-BLD8" now active "
If i run pvscan i am able to see PVs under VG.

 PV /dev/sdai        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB free]
  PV /dev/sdah        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB free]
  PV /dev/sdag        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB free]
  PV /dev/sdaf        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB free]
  PV /dev/sdae        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB free]



Is  there any possibilty to recover my LV as it contains very critical data=
?


Thanks in advance
 		 	   		  =

--_c1e0af01-c0ba-4565-95bf-e71884f6cb4a_
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
font-family:Tahoma
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>
Hi=2C<br><br>I am going trough a peculiar problem after Linux server reboot=
.<br><br>I had rebooted RHEL-5.3 server and found /var filesystem got corru=
pted and i was able to restore /var from Mondorescue image which was&nbsp=
=3B taken 1 month back.<br><br>I had 2 VGs with a LV configured under each =
VG. <br>After reboot i lost one of my Lvs =2CVG under which Lv is created s=
howing " 0 logical volume(s) in volume group "VGGLOTAM-BLD8" now active "<b=
r>If i run pvscan i am able to see PVs under VG.<br><br>&nbsp=3BPV /dev/sda=
i&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B VG VGGLOTAM-BLD8&=
nbsp=3B&nbsp=3B lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp=3B PV /dev/sdah&=
nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B VG VGGLOTAM-BLD8&nb=
sp=3B&nbsp=3B lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp=3B PV /dev/sdag&nb=
sp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B VG VGGLOTAM-BLD8&nbsp=
=3B&nbsp=3B lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp=3B PV /dev/sdaf&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B VG VGGLOTAM-BLD8&nbsp=
=3B&nbsp=3B lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp=3B PV /dev/sdae&nbsp=
=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B&nbsp=3B VG VGGLOTAM-BLD8&nbsp=
=3B&nbsp=3B lvm2 [100.00 GB / 100.00 GB free]<br><br><br><br>Is&nbsp=3B the=
re any possibilty to recover my LV as it contains very critical data?<br><b=
r><br>Thanks in advance<br> 		 	   		  </div></body>
</html>=

--_c1e0af01-c0ba-4565-95bf-e71884f6cb4a_--
