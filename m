Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB2Edrr07936
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 09:39:53 -0500
Received: from ECCMCBH.cmc.int.ec.gc.ca (ecdor130.cmc.ec.gc.ca
	[199.212.17.130])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB2EdV8w017744
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 09:39:35 -0500
Subject: RE: [linux-lvm] LVM and Kickstart
MIME-Version: 1.0
Date: Thu, 2 Dec 2004 09:39:12 -0500
content-class: urn:content-classes:message
Message-ID: <80EE00A6A780C445BE9CA19F163CEA35059C64@cisxb.cmc.int.ec.gc.ca>
From: "Shea,Dan [CIS]" <Dan.Shea@ec.gc.ca>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is what we use.  Our 4 hard drives are in a raid 5 configuration, so only /dev/sda is seen.  Also it was decided to have /boot and / not under lvm.
Dan.

#Partition clearing information
clearpart --all --initlabel 
part /boot --fstype ext3 --size=100
part / --fstype ext3 --size=8000
part swap --size=4000
part pv.20 --size=100 --grow
volgroup npmu_vg01 pv.20
logvol /npmu_feed --fstype ext3 --name=lv_npmu_feed --vgname=npmu_vg01 --size=4000
## Change the process mount point to the HOSTNAME_process
logvol /einstein_process --fstype ext3 --name=lv_process --vgname=npmu_vg01 --size=5000
logvol /home --fstype ext3 --name=lv_home --vgname=npmu_vg01 --size=10000
logvol /usr --fstype ext3 --name=lv_usr --vgname=npmu_vg01 --size=10000
logvol /var --fstype ext3 --name=lv_var --vgname=npmu_vg01 --size=5000
logvol /tmp --fstype ext3 --name=lv_tmp --vgname=npmu_vg01 --size=1000
logvol /npmu_ops --fstype ext3 --name=lv_npmu_ops --vgname=npmu_vg01 --size=5000
logvol /npmu_storage --fstype ext3 --name=lv_npmu_storage --vgname=npmu_vg01 --size=40000
-----Original Message-----
From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]On Behalf Of Jim Owenby
Sent: Wednesday, December 01, 2004 8:36 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM and Kickstart


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


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
