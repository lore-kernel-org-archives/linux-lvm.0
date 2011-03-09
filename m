Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p296fKPO007134
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2011 01:41:20 -0500
Received: from m13-100.163.com (m13-100.163.com [220.181.13.100])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p296f8ml008252
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2011 01:41:08 -0500
Date: Wed, 9 Mar 2011 14:41:05 +0800 (CST)
From: yue <ooolinux@163.com>
Message-ID: <1de306e.5323.12e9958eddf.Coremail.ooolinux@163.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_56672_14463102.1299652865502"
Subject: [linux-lvm] dmsetup do not know sda*
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
To: linux-lvm <linux-lvm@redhat.com>

------=_Part_56672_14463102.1299652865502
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

1.dmsetup ls
vg_spare-lv_spare       (253, 0)
 
why no sda*  device map???
2 i install multipath,and configure
but multipath -ll   show nothing
---dmesg---
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
device-mapper: table: 253:1: multipath: error getting device
device-mapper: ioctl: error adding target to table
--------
what i should do?
 
thanks
------=_Part_56672_14463102.1299652865502
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<DIV>1.dmsetup ls </DIV>
<DIV>vg_spare-lv_spare&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (253, 0)</DIV>
<DIV>&nbsp;</DIV>
<DIV>why no sda*&nbsp; device map???</DIV>
<DIV>2 i install multipath,and configure</DIV>
<DIV>but multipath -ll&nbsp;&nbsp; show nothing</DIV>
<DIV>---dmesg---</DIV>
<DIV>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>device-mapper: table: 253:1: multipath: error getting device<BR>device-mapper: ioctl: error adding target to table<BR>--------</DIV>
<DIV>what i should do?</DIV>
<DIV>&nbsp;</DIV>
<DIV>thanks</DIV><br><br><span title="neteasefooter"><span id="netease_mail_footer"></span></span>
------=_Part_56672_14463102.1299652865502--
