From: "Richard Collins" <mail310068@pop.net>
Message-ID: <OAEMILNFFAJGLAMIAJELOEDFCAAA.mail310068@pop.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RedHat 9 lvcreate snapshot failure.
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
Date: Mon Jan  5 07:32:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


Running Redhat 9 and trying to create a snapshot for a safer backup of a
logical volume, I get the following error.  Surfing the net didn't turn up
anything.  Any help would be greatly appreciated.

Thanks,

Richard


lvcreate -L20M --snapshot --name mysnap /dev/vg00/homes
lvcreate -- rounding size up to physical extent boundary
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/vg00/mysnap"
lvcreate -- ERROR "Invalid argument" creating VGDA for "/dev/vg00/mysnap" in
kernel

----
lvdisplay /dev/vg00/homes
--- Logical volume ---
LV Name                /dev/vg00/homes
VG Name                vg00
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                64 GB
Current LE             4
Allocated LE           4
Allocation             next free
Read ahead sectors     1024
Block device           58:1
