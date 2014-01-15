Received: from red.mvo.lan (ovpn-116-39.ams2.redhat.com [10.36.116.39])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0F8JX2k004263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 15 Jan 2014 03:19:35 -0500
From: Marius Vollmer <marius.vollmer@redhat.com>
Date: Wed, 15 Jan 2014 10:19:33 +0200
Message-ID: <87zjmxzmga.fsf@red.mvo.lan>
MIME-Version: 1.0
Subject: [linux-lvm] Identifying useable block devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

when looking at the udev properties of a device mapper node, how can I
decide whether this is a block device that the user can use for creating
filesystems on, etc?

For example, when creating a thinly provisioned logical volume with these
steps

 # vgcreate TEST /dev/loop1
 # lvcreate TEST --thinpool pool -L 80
 # lvcreate -T TEST/pool -n thin -V 100

I end up with a lot of devices:

 # ls /dev/mapper/TEST-*
 /dev/mapper/TEST-pool        /dev/mapper/TEST-pool_tmeta  /dev/mapper/TEST-thin
 /dev/mapper/TEST-pool_tdata  /dev/mapper/TEST-pool-tpool

How can a program tell that only /dev/mapper/TEST-thin can really be
used as a block device, and the rest should be ignored?

Is there a way to do this by looking at "udevadm info", for example?

(What seems to work is skipping all nodes that have
DM_UDEV_IGNORE_DISK_RULES_FLAG set to true.  Is this maybe even
documented somewhere?)

Thanks!
