From: Jenny Zhang <jenny@osdl.org>
Message-Id: <1075492648.10162.22.camel@ibm-a.pdx.osdl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Couldn't find device with uuid error
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
Date: Fri Jan 30 14:54:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I am new to LVM2, it is quite possible that I missed some steps.

I created an lv using the command:
dd if=/dev/zero of=/dev/sde bs=1k count=1
blockdev --rereadpt /dev/sde
pvcreate -v /dev/sde
... repeat for 27 disks

vgcreate v_db /dev/sde/ /dev/sdf /dev/sde ... 27 disks
lvcreate -i27 -I512 -L 100G -n lv_dbt3 v_db

The first time everything is fine.

To test another linux kernel, I re-imaged the whole system and
rebooted.  But when I try to create lv, it complains 
Couldn't find device with uuid ...

pvdata -p /dev/sde
--- NEW Physical volume ---
PV Name               /dev/sde
VG Name
PV Size               0 [0 secs]
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               none

lvmdiskscan shows:
 /dev/sde   [       16.95 GB] LVM physical volume

Do I have to remove the lv and vg before I re-image the system?
What can I do now?

TIA,
Jenny
