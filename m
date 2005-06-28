Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5SLYbu17157
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 17:34:37 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.131])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5SLYahW012814
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 17:34:36 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e33.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j5SLYUvN440238
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 17:34:30 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j5SLYTj4313560
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 15:34:29 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j5SLYT6h025116
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 15:34:29 -0600
Received: from d03nm114.boulder.ibm.com (d03nm114.boulder.ibm.com
	[9.17.195.140])
	by d03av03.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j5SLYTud025105
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 15:34:29 -0600
From: Jim Schisler <jschis@us.ibm.com>
MIME-Version: 1.0
Message-ID: <OF2C29465B.24F55B4D-ON8725702E.0074297E-8825702E.007667C9@us.ibm.com>
Sender: Jim Schisler <jschis@us.ibm.com>
Date: Tue, 28 Jun 2005 14:34:28 -0700
Content-Type: multipart/alternative;
	boundary="=_alternative 007667C58825702E_="
Subject: [linux-lvm] pv resize from dve
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

This is a multipart message in MIME format.
--=_alternative 007667C58825702E_=
Content-Type: text/plain; charset="US-ASCII"

Is it possible to dynamically resize a physical volume with the 2.6 
kernel?
I am using DVE(dynamic volume expansion) on a storage product to increase 
the size of a volume which I am using in LVM and can see the volume size 
increase in /sys/block devices and other utilities(fdisk) after doing a 
rescan of the device but cannot see the new size in pvdisplay on that 
device. 
Is there a way to rescan the physical volume so that the new volume size 
is seen and can be used?
I am using RHEL4-U1 with lvm2-2.00.15-0.8

Thanks,
_____
Jim Schisler
--=_alternative 007667C58825702E_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Is it possible to dynamically resize
a physical volume with the 2.6 kernel?</font>
<br><font size=2 face="sans-serif">I am using DVE(dynamic volume expansion)
on a storage product to increase the size of a volume which I am using
in LVM and can see the volume size increase in /sys/block devices and other
utilities(fdisk) after doing a rescan of the device but cannot see the
new size in pvdisplay on that device. &nbsp;</font>
<br><font size=2 face="sans-serif">Is there a way to rescan the physical
volume so that the new volume size is seen and can be used?</font>
<br><font size=2 face="sans-serif">I am using RHEL4-U1 with lvm2-2.00.15-0.8</font>
<br>
<br><font size=2 face="sans-serif">Thanks,</font>
<br><font size=2 face="sans-serif">_____<br>
Jim Schisler</font>
--=_alternative 007667C58825702E_=--
