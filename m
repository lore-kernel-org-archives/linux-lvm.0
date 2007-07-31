Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6VL1BJH021345
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2007 17:01:11 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.33])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6VL19Cs021960
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2007 17:01:09 -0400
Received: from mail.dougware.net ([71.77.64.18])
	by cdptpa-omta01.mail.rr.com with ESMTP id
	<20070731210054.XGSV21280.cdptpa-omta01.mail.rr.com@mail.dougware.net>
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2007 21:00:54 +0000
Received: from localhost ([127.0.0.1]) by mail.dougware.net
	for linux-lvm@redhat.com; Tue, 31 Jul 2007 17:00:52 -0400
From: "Doug Eubanks" <admin@dougware.net>
Message-ID: <20070731210052.da6bf8cb@mail.dougware.net>
Date: Tue, 31 Jul 2007 17:00:52 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="-----------8eb6914a08f1e34be6d5051045358142"
Subject: [linux-lvm] LVM on hardware RAID
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

This is a multi-part message in MIME format.

-------------8eb6914a08f1e34be6d5051045358142
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Quick question....

I've got three drives in on a hardware SCSI raid.  Within the next week,=
 I will be adding two drives to the array and using the controller's exp=
and function to increase the size of my array.

Will the pv and vg sizes automatically be increased after a parted a reb=
oot=3F  I was also considering just adding a second LVM partition to onc=
e the expand has completed and adding that pv to the vg.

Does anyone have any advice or pointers or best practices=3F

I've been using linux for over 10 years, and only recently discovered th=
e joys and advantages of LVM....it's a lifesaver!

Doug
-------------8eb6914a08f1e34be6d5051045358142
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
 <meta http-equiv=3D'Content-Type' content=3D'text/html;charset=3Dus-asc=
ii'>
 <style>BODY{font:10pt Tahoma, Verdana, sans-serif;}</style>
</head>
<body>
Quick question....<br><br>I've got three drives in on a hardware SCSI ra=
id.&nbsp; Within the next week, I will be adding two drives to the array=
 and using the controller's expand function to increase the size of my a=
rray.<br><br>Will the pv and vg sizes automatically be increased after a=
 parted a reboot=3F&nbsp; I was also considering just adding a second LV=
M partition to once the expand has completed and adding that pv to the v=
g.<br><br>Does anyone have any advice or pointers or best practices=3F<b=
r><br>I've been using linux for over 10 years, and only recently discove=
red the joys and advantages of LVM....it's a lifesaver!<br><br>Doug<br><=
/body></html>
-------------8eb6914a08f1e34be6d5051045358142--
