From: "James Kelty" <jamesk@ashlandagency.com>
Message-ID: <JLEILPHBKFODIOEDIAKMGEKLCHAA.jamesk@ashlandagency.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and 2.4.13
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Oct 30 13:30:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ok,

I created a new kernel using the latest patch from lvm 1.0.1-rc4.  I
compiled it into the kernel, and it loads pretty well.

I have a new 100GB drive that I carved into 4 slices w/ 8e as the type, did
the pvcreate w/o any problems,
created the vg00 volume group. But! When I try to create the logical volume,
I get a Seg Fault and core dump.

What's the deal?


--- Volume group ---
VG Name               vg00
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               73.24 GB
PE Size               4.00 MB
Total PE              18750
Alloc PE / Size       0 / 0
Free  PE / Size       18750 / 73.24 GB
VG UUID               5d6C0e-zgYC-jWju-6Vx1-mzlo-AY0n-kAlDPd

root@warbaby: ~ >> lvcreate -L73.24G vg00
lvcreate -- rounding up size to physical extent boundary "73.24 GB"
Segmentation fault (core dumped)
root@warbaby: ~ >> lvcreate -L73.00G vg00
Segmentation fault (core dumped)
root@warbaby: ~ >>





-James

--
James Kelty
Sr. Unix Systems Administrator
The Ashland Agency
541.488.0801
jamesk@ashlandagency.com
