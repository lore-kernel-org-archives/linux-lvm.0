Return-Path: <a.bruns@sauerland.de>
Message-ID: <00ef01c127de$1121b810$0df1d981@piefke>
From: "Alexander Bruns" <a.bruns@sauerland.de>
Date: Sat, 18 Aug 2001 14:05:26 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Data on LVM-Partition, how to read it out
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I try to get an Answer to my Problem once more. Someone Told me that i
Have the "bug 193 in bugzilla". But how do I handle the Bug? How can I
Read the data out of the partition?


I had the following things running for a short while:

- RedHat 7.1 with all updates.
- self-compiled Kernel 2.4.6 with patched lvm 0.9.1_beta7

On my first HD Igave the rest space to hda7 with fdisk and set the
partition to "8e" lvm.

The I followed the howto at sistina at:
file://sistina.com/lvm/doc/lvm_howto/Common_tasks.html


- I initalized the Partition:
  pvcreate /dev/hda7

- I added the partition to a new volume group:
  vgcreate lvm_volume_01 /dev(hda7

- then o activated the volume group:
  vgchange -a y lvm_volume_01

- The I put a logical volume on the volume group:
  lvcrate -L50G -nlvm_lv_01 lvm_volume_01

This logical Volume was then at /dev/lvm_volume_01/lvm_lv_01 and o
formated it woith reiserfs an mounted it! Evething runs fine.

I copied the old contents of hdb5 and hdc5 of the smaller HDs to this
logical volume. on hda7.

Then I added deleted the partition on hdc5, made a new one, set it to
8e an added it to the volume group as explained at:
file://sistina.com/lvm/doc/lvm_howto/Common_tasks.html

pvcreate /dev/hdc5
vgextend lvm_volume_01
lvextend -L30G /dev/lvm_volume_01/lvm_lv_01
resize_reiserfs -f /dev/lvm_volume_01/lvm_lv_01

That was all fine and i could mount the lvm_lv_01 without any
problems.

The same I then wanted to manage with the thirt HD at hdb5, but then
something went wrong??

Resize reiserfs did something but when i wanted to mount the LV it did
not work. reiserfs-checks did not found a problem but the mount-binary
told my something about a superblock......


Abter a reboot I now have the following:

[root@holodeck lvmconf]# pvdisplay /dev/hda7
pvdisplay
--- Physical volume ---
PV Name               /dev/hda7
VG Name               lvm_volume_01
PV Size               48.54 GB / NOT usable 1.06 MB [LVM: 169 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              12425
Free PE               0
Allocated PE          12425
PV UUID               cFFBJX-aqxr-P7kU-71OY-pgpX-rvtA-XxVpoc

But for /dev/hdb5 and /ev/hdc5 it does not show the same. NOTHING!!

And becouse I did not write anything to the volumegroup or logical
volume after the added two partition al my data must still be on hda7.
But how do I manage to get on it?

SHIT!

How do I get on my Data at lvm_volume_01 bzw lvm_lv_01.
lvm_lv_01 was formated with reiserfs

Greetings from Germany from Alex
