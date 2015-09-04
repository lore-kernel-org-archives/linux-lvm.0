From: Joe Julian <me@joejulian.name>
Message-ID: <55E9E072.8080209@joejulian.name>
Date: Fri, 4 Sep 2015 11:18:26 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] udev rules do not create partition entries when an lvm
 lv is partitioned
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
To: linux-lvm@redhat.com, dm-devel@redhat.com

Yes, I'm aware of all the arguments against even doing this, but I have 
my reasons for doing it this way.

When you create a partition on an lv:

   sgdisk /dev/vg1/lv1 -n 0:0:0

there is no udev rule to create the partition entry, '/dev/vg1/lv1p1' 
(for instance). For my immediate use case, this causes ceph-disk to fail 
as it cannot find the partition as it's expecting to find the device 
name with a new "1" at the end. Any suggestions on how I could make this 
happen?
