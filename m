Message-ID: <006b01c13448$755ea0b0$0df1d981@piefke>
From: "Alexander Bruns" <a.bruns@sauerland.de>
Date: Mon, 3 Sep 2001 09:17:14 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Foreign HD with LVM-Partition, how to read Data?
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

I hot a HardDrive from a crashed System. The System-Harddrive is 
not recoverable, but the Harddrive with the LVM-Partition on it, 
is still "alive".

There was only one Partition in the VolumeGroup, so all the Data 
in the Logical Volume is on this single Partition.

Is there a way in to get the data read out of the Partition? It 
was formated with reiserfs on a RedHat Linux 7.1.

I activated the Hardware in my System and have now the same Running:

- RedHat 7.1 with all updates.
- self-compiled Kernel 2.4.6 with patched lvm 0.9.1_beta7

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


So is there a way to get the data read out of this partition?

Greetings from Alex
