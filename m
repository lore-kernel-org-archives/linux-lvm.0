Return-Path: <rick@nervous.net>
Mime-Version: 1.0
Message-Id: <v04210106b7972d170ad3@[192.168.0.3]>
Date: Wed, 8 Aug 2001 14:27:28 -0400
From: rick ochoa <rick@nervous.net>
Subject: [linux-lvm] LVM + Reiserfs + 2.4.x
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi there. I have an LVM with ReiserFS on a (SMP) RedHat Linux 7.1 
machine, compiled with kernel 2.4.7 from kernel.org. I get an error 
trying to mount the volume that seems like I've run out of 'slip 
sectors' 
(http://www.cs.helsinki.fi/linux/linux-kernel/Year-2000/2000-30/0289.h 
tml) as the disk got full. I also the the symptomatic "weird hard 
disk sound" (also in thread: 
http://www.cs.helsinki.fi/linux/linux-kernel/Year-2000/2000-30/0297.ht 
ml). I do a lot of music and video work and my disks tend to fill up 
kind of quickly.

I am wondering if it is at all possible to recover the data on these 
disks -- some way to reclaim a bit of space so that I may back the 
data up and start it over again? It is over 200G of data, so backing 
up has been problematic. I'd just recently gotten a tape drive 
(Ecrix), but it seems a tiny bit too late.

The error might not be happening at the LVM level, but at the 
reiserfs level. I am using reiser reiserfs-utils-3.x.0f-1, not 
updated to the 3.x.0j version...

I'm open to any suggestions. Here are the specs:

vp6/1G dual processor p3s/1G RAM; Red Hat Linux 7.1 w/current ximain 
red-carpet updates.

[root@neuron /root]# uname -a
Linux neuron.nervous.net 2.4.7 #2 SMP Wed Aug 8 02:05:48 EDT 2001 i686 unknown

[root@neuron /root]# lspci
00:00.0 Host bridge: VIA Technologies, Inc. VT82C691 [Apollo PRO] (rev c4)
00:01.0 PCI bridge: VIA Technologies, Inc. VT82C598/694x [Apollo 
MVP3/Pro133x AGP]
00:07.0 ISA bridge: VIA Technologies, Inc. VT82C686 [Apollo Super 
South] (rev 40)
00:07.1 IDE interface: VIA Technologies, Inc. Bus Master IDE (rev 06)
00:07.2 USB Controller: VIA Technologies, Inc. UHCI USB (rev 16)
00:07.3 USB Controller: VIA Technologies, Inc. UHCI USB (rev 16)
00:07.4 Bridge: VIA Technologies, Inc. VT82C686 [Apollo Super ACPI] (rev 40)
00:0a.0 SCSI storage controller: Adaptec AHA-7850 (rev 03)
00:0b.0 Multimedia audio controller: Creative Labs SB Live! EMU10000 (rev 06)
00:0b.1 Input device controller: Creative Labs SB Live! (rev 06)
00:0c.0 Ethernet controller: 3Com Corporation 3c905C-TX [Fast 
Etherlink] (rev 30)
00:0d.0 Ethernet controller: 3Com Corporation 3c905 100BaseTX [Boomerang]
00:0e.0 Unknown mass storage controller: Triones Technologies, Inc. 
HPT366 (rev 03)
01:00.0 VGA compatible controller: Matrox Graphics, Inc. MGA G400 AGP (rev 82)

lvm_0.9.1_beta2

[root@neuron /root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hde1" of VG "neuron" [71.59 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdf1" of VG "neuron" [71.59 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdg1" of VG "neuron" [71.59 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdh1" of VG "neuron" [71.59 GB / 31.36 GB free]
pvscan -- total: 4 [286.36 GB] / in use: 4 [286.36 GB] / in no VG: 0 [0]

[root@neuron /root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "neuron"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

[root@neuron /root]# lvscan
lvscan -- ACTIVE           "/dev/neuron/logical" [255 GB]
lvscan -- 1 logical volumes with 255 GB total in 1 volume group
lvscan -- 1 active logical volumes

[root@neuron /root]# mount -t reiserfs /dev/neuron/logical /mnt/tmp

Aug  8 02:16:38 neuron kernel: reiserfs: checking transaction log 
(device 3a:00) ...
Segmentation fault
[root@neuron /root]#
[root@neuron /root]# Aug  8 02:16:44 neuron kernel: hde: dma_intr: 
status=0x51 { DriveReady SeekComplete Error }
Aug  8 02:16:44 neuron kernel: hde: dma_intr: error=0x40 { 
UncorrectableError }, LBAsect=14903, sector=14840
Aug  8 02:16:44 neuron kernel: end_request: I/O error, dev 21:01 
(hde), sector 14840
Aug  8 02:16:44 neuron kernel: Unable to handle kernel NULL pointer 
dereference at virtual address 00000034
Aug  8 02:16:44 neuron kernel:  printing eip:
Aug  8 02:16:44 neuron kernel: fa8c905f
Aug  8 02:16:44 neuron kernel: *pde = 00000000
Aug  8 02:16:44 neuron kernel: Oops: 0000
Aug  8 02:16:44 neuron kernel: CPU:    0
Aug  8 02:16:44 neuron kernel: EIP:    0010:[<fa8c905f>]
Aug  8 02:16:44 neuron kernel: EFLAGS: 00010282
Aug  8 02:16:44 neuron kernel: eax: 00000000   ebx: 00000000   ecx: 
d454be04   edx: c251c6c0
Aug  8 02:16:44 neuron kernel: esi: d454be08   edi: d3d23600   ebp: 
d3d23600   esp: d454bd98
Aug  8 02:16:44 neuron kernel: ds: 0018   es: 0018   ss: 0018
Aug  8 02:16:44 neuron kernel: Process mount (pid: 7523, stackpage=d454b000)
Aug  8 02:16:44 neuron kernel: Stack: c251c70c c251c70c c251c420 
d454be08 d3d23600 00000000 d454be08 d3d23600
Aug  8 02:16:44 neuron kernel:        00000669 fa8c9a72 d3d23600 
00000000 d454be04 d454be08 00003a00 00000669
Aug  8 02:16:44 neuron kernel:        00001000 d454be08 d454be04 
00000001 00000001 e48e7000 00000019 00001843
Aug  8 02:16:44 neuron kernel: Call Trace: [<c0139bc3>] [<c0139dc0>] 
[<c012b209>] [<c013a777>] [<c0112130>] [<c0106fbc>] [<c013aa66>]
Aug  8 02:16:44 neuron kernel:        [<c013a91c>] [<c013ab24>] [<c0106ecb>]
Aug  8 02:16:44 neuron kernel:
Aug  8 02:16:44 neuron kernel: Code: 8b 40 34 89 04 24 8b 58 04 85 db 
0f 84 80 01 00 00 fc 89 c6
-- rick ochoa : rick@nervous.net : http://neuron.nervous.net/
