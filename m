Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0P3oA113014
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 22:50:10 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.207])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0P3o4ZV031268
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 22:50:04 -0500
Received: by xproxy.gmail.com with SMTP id r21so16614wxc
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 19:50:04 -0800 (PST)
Message-ID: <9ab217670601241950m711f3e0dn@mail.gmail.com>
Date: Tue, 24 Jan 2006 19:50:04 -0800
From: "Devon H. O'Dell" <devon.odell@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] 8TB logical volumes with LVM2
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello folks,

I'm trying to configure a system with 2 12 port 3ware 9550SX SATA RAID
cards to join the two physical volumes exported by the cards into a
single logical volume. There are 24x400GB drives, so the total is just
above 8TB.

After running the following commands:

pvcreate --metadatasize 1024 /dev/sdb1
pvcreate --metadatasize 1024 /dev/sdc1
vgcreate -s 128M vg0 /dev/sdb1 /dev/sdc1
lvcreate -n lv0 -L8T vg0

The lvcreate command gobbles up CPU and memory as would be expected,
however, I get the following error message:

device-mapper device too small for target: /dev/sdb1
device mapper ioctl cmd 9 failed: Invalid argument.
could not load device vg0-lv0
failed to activate new LV

Am I doing something incorrectly? I've tried with both Fedora Core 3
and Fedora Core 4. Any pointers on how I should continue with this
would be greatly appreciated.

Kind regards,

Devon H. O'Dell
