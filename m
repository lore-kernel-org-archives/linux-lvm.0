Message-ID: <3DF4A287.2050806@ednet.ns.ca>
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PV Status: NOT available
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
Date: Mon Dec  9 08:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM Mailing List <linux-lvm@mlists.sistina.com>

Kernel 2.4.20 with LVM 1.0.6


I can mount /dev/imap_vg/imap_lv without any problems but I can 
understand why the PV status is NOT available.




pvdisplay /dev/sda6

--- Physical volume ---
PV Name               /dev/sda6
VG Name               imap_vg
PV Size               261.11 GB [547591527 secs] / NOT usable 16.25 MB 
[LVM: 189 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              16710
Free PE               0
Allocated PE          16710
PV UUID               O7WnwM-5ASt-AsiV-8BlZ-h6KP-NjFl-cdY33C





vgdisplay

--- Volume group ---
VG Name               imap_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               1
MAX LV Size           1023.97 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               261.09 GB
PE Size               16 MB
Total PE              16710
Alloc PE / Size       16710 / 261.09 GB
Free  PE / Size       0 / 0
VG UUID               ON35SA-1UEm-YjpU-FzQu-vw4V-CC0y-YG6qfw







lvdisplay /dev/imap_vg/imap_lv

--- Logical volume ---
LV Name                /dev/imap_vg/imap_lv
VG Name                imap_vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                261.09 GB
Current LE             16710
Allocated LE           16710
Allocation             next free
Read ahead sectors     1024
Block device           58:0
