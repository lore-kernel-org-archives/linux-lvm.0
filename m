Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2GN0Vj03146
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 18:00:31 -0500
Received: from ip66-106-138-51.z138-106-66.customer.algx.net
	(ip66-106-138-51.z138-106-66.customer.algx.net [66.106.138.51])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2GN0Q4b004000
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 18:00:27 -0500
Received: from [192.168.1.126] (rich [192.168.1.126])
	by ip66-106-138-51.z138-106-66.customer.algx.net (Postfix) with ESMTP
	id 2AD1611804
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 15:00:25 -0800 (PST)
From: Rich Turner <rich@storix.com>
Message-Id: <1079478024.2432.9.camel@rich>
Mime-Version: 1.0
Date: Tue, 16 Mar 2004 15:00:24 -0800
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] root on lvm
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

i am trying to mount / on a logical volume with reiserfs. my initrd
appears to be loading all of the appropriate modules (lvm-mod, dm-mod,
reiserfs) but i get the following error when the initrd exits and tries
to mount /.

device-mapper: unknown block ioctl 0x5310
sh-2021: reiserfs_read_super: can not find reiserfs on device mapper
(254,1)

is this related to reiserfs or lvm? or my initrd?
using:
lvm-2.00.07
reiserfs-3.6.9-37
suse-9.0
kernel-2.4.21-144-athlon
