Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k36Lj7VP025450
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 17:45:07 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k36Lj52V019485
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 17:45:05 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k36LixZN026227
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 17:44:59 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VER6.8) with ESMTP id
	k36LfbTA249810
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 15:41:37 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	k36LixUj006094
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 15:44:59 -0600
Received: from d03nm118.boulder.ibm.com (d03nm118.boulder.ibm.com
	[9.17.195.144])
	by d03av02.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	k36Lix6c006086
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 15:44:59 -0600
Message-ID: <OF3B16C5BB.0FB8E06C-ON88257148.007618A5-88257148.0077796C@us.ibm.com>
From: Graham Norris <norrisg@us.ibm.com>
Date: Thu, 6 Apr 2006 14:44:58 -0700
MIME-Version: 1.0
Content-type: multipart/alternative; 
	Boundary="0__=07BBFBDBDFE59E358f9e8a93df938690918c07BBFBDBDFE59E35"
Content-Disposition: inline
Subject: [linux-lvm] fsck for LVM?
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

--0__=07BBFBDBDFE59E358f9e8a93df938690918c07BBFBDBDFE59E35
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: quoted-printable






I've got a user complaining that his filesystem in an lv is being
corrupted. It's not clear whether it is the lv that is corrupted or the=

filesystem, I've not actually seen it in this state. I have seen a fsck=
 log
from when it is formatted with reiserfs failing though.

The user says he's tried both reiserfs and ext3 in this lv, and both en=
d up
corrupted after a period of time (days). Since this user obviously has =
root
(or they couldn't format the lv), I have to suspect they're breaking th=
eir
own filesystem. They, OTOH, seem to think it is LVM's fault and want me=
 to
fix it.

Is there something which can be run on an LVM setup to verify its integ=
rity
in much the same way as fsck is used on file systems? I've used vgck,
vgscan, vgdisplay, lvscan, lvdisplay, pvscan and pvdisplay on the vario=
us
pieces, and can see no problems. I've also scanned the physical disk th=
e pv
lives on and that shows no problems either.

Graham.=

--0__=07BBFBDBDFE59E358f9e8a93df938690918c07BBFBDBDFE59E35
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-transfer-encoding: quoted-printable

<html><body>
<p>I've got a user complaining that his filesystem in an lv is being co=
rrupted. It's not clear whether it is the lv that is corrupted or the f=
ilesystem, I've not actually seen it in this state. I have seen a fsck =
log from when it is formatted with reiserfs failing though.<br>
<br>
The user says he's tried both reiserfs and ext3 in this lv, and both en=
d up corrupted after a period of time (days). Since this user obviously=
 has root (or they couldn't format the lv), I have to suspect they're b=
reaking their own filesystem. They, OTOH, seem to think it is LVM's fau=
lt and want me to fix it.<br>
<br>
Is there something which can be run on an LVM setup to verify its integ=
rity in much the same way as fsck is used on file systems? I've used vg=
ck, vgscan, vgdisplay, lvscan, lvdisplay, pvscan and pvdisplay on the v=
arious pieces, and can see no problems. I've also scanned the physical =
disk the pv lives on and that shows no problems either.<br>
<br>
Graham.</body></html>=

--0__=07BBFBDBDFE59E358f9e8a93df938690918c07BBFBDBDFE59E35--
