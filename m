Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB1Da3r05024
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 08:36:03 -0500
Received: from go4.ext.ti.com (go4.ext.ti.com [192.91.75.132])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB1DZv4g001850
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 08:35:57 -0500
Received: from dlep30.itg.ti.com ([157.170.139.157])
	by go4.ext.ti.com (8.13.1/8.13.1) with ESMTP id iB1DZqRE018973
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 07:35:52 -0600 (CST)
Received: from LTA0674253 (localhost [127.0.0.1])
	by dlep30.itg.ti.com (8.12.11/8.12.11) with ESMTP id iB1DZpOl017762
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 07:35:51 -0600 (CST)
From: "Jim Owenby" <jowenby@ti.com>
Date: Wed, 1 Dec 2004 07:35:51 -0600
Message-ID: <DAE695E47B9BCC45996768956410A6A90E9187@dlee2k03.ent.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and Kickstart
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Is there any examples of using LVM on RedHat 3.x in a kickstart 
script? I am trying to creat one large LVM partion accross 3 drives to 
about 400G and I am not having any luck at it.

I have tired the following in the ks.cfg file:
# partition information
clearpart --all
 part /boot --fstype ext3 --size=100 --ondisk=sda
 part swap --size=8192 --ondisk=sda
 part / --fstype ext3 --size=8192 --ondisk=sda
 part pv.15 --size=100 --grow --ondisk=sdc
 part pv.13 --size=100 --grow --ondisk=sdb
 part pv.11 --size=100 --grow --ondisk=sda
 volgroup Volume00 pv.11 pv.13 pv.15
 logvol /tmp --fstype ext3 --name=LogVol00 --vgname=Volume00 
 --pesize=16384 --size=354500

Jim Owenby
Texas Instruments Inc
P.O. Box 660199 M/S 8714
Dallas, Tx. 75265
Design Systems,Compute Team
Unix/Linux Administrator
Ph: 214.480.4082
Cell: 214.882.3831
Email: jowenby@ti.com
