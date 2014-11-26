Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAQ7srBA007678
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2014 02:54:53 -0500
Received: from heian.cn.fujitsu.com (cn.fujitsu.com [59.151.112.132] (may be
	forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAQ7slNH004315
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2014 02:54:51 -0500
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAQ7sTqZ030216
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2014 15:54:29 +0800
Message-ID: <54758746.3000701@cn.fujitsu.com>
Date: Wed, 26 Nov 2014 15:54:46 +0800
From: Qu Wenruo <quwenruo@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [BUG?] OOM executing blkdiscardon a thin lv
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

[Bug]
When I try to discard the whole thin lv using blkdiscard, an OOM occurs 
and I lost my ssh connection.
TTY login also fails to start, although kernel and network still looks 
alive but no way to login into the system.
Have to reboot.

Not sure if this is a bug in blkdiscard or lvm.

[lvs output]
   LV       VG           Attr       LSize  Pool     Origin Data% Move 
Log Cpy%Sync Convert
   disk1    test_vg      Vwi-a-tz--  1.00t thinpool 0.77
   thinpool test_vg      twi-a-tz-- 30.00g 26.28

[Reproducer]
1. Make a thin pool with 30G space.
2. Create 1T thin lv from the thin pool created in 1.
3. Do some operation to occupy some space in thin lv
4. Exec blkdiscard on the thin lv

[Related package version]
kernel-3.17.3-200.fc20.x86_64
lvm2-2.02.106-1.fc20.x86_64
util-linux-2.24.2-1.fc20.x86_64

[How to discard thin lv]
BTW, what's the proper method to discard all allocated space for a thin lv?
Lvremove and lvcreate?!

Thanks,
Qu
