Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4NJkJO05273
	for <linux-lvm@redhat.com>; Mon, 23 May 2005 15:46:19 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4NJkIoA004515
	for <linux-lvm@redhat.com>; Mon, 23 May 2005 15:46:18 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id 2B4753E8F1
	for <linux-lvm@redhat.com>; Mon, 23 May 2005 14:59:10 -0400 (EDT)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13813-09 for <linux-lvm@redhat.com>;
	Mon, 23 May 2005 14:59:07 -0400 (EDT)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id 380143E8F0
	for <linux-lvm@redhat.com>; Mon, 23 May 2005 14:59:07 -0400 (EDT)
Message-ID: <4292256B.7060509@m-cam.com>
Date: Mon, 23 May 2005 14:48:11 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate issues
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

We have a SAN that exports 4 LUNs. These appear as SCSI devices on the 
server (/dev/sd[c-f]). When I try to create physical volumes on these 
devices, I get the following error:

#>pvcreate /dev/sdc
   Physical volume "/dev/sdc" successfully created

#>pvcreate /dev/sdd
   Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sdc 
not /dev/sdd
   Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sde 
not /dev/sdd
   Found duplicate PV ZlhU50ejJ1VkoULTcU5ODsl2BP26IjQW: using /dev/sdf 
not /dev/sdd
   Physical volume "/dev/sdd" successfully created

This happens after pvcreate is run the second time, does not matter in 
which order. It looks like when pvcreate sets the device id, it somehow 
sets it for all the devices.

Debian/Sarge

pvcreate --version
   LVM version:     2.01.04 (2005-02-09)
   Library version: 1.01.00-ioctl (2005-01-17)
   Driver version:  4.4.0


Thanks for any ideas.


-- 
Arshavir Grigorian
Systems Administrator/Engineer
