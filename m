Message-ID: <1034830214.3dae418604fe5@mail.dornquast.com>
From: Nathan Dornquast <Nathan@Aberon.Net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM on ATA-Raid Working - but Poorly
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
Date: Wed Oct 16 23:57:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

First, Thx to Heinz for not only writing great code, but taking the time to 
document and respond to inquires.

I have read the white paper and many, many mailings on this list, but I haven't 
seen anything addressing my problem.

Problem:
After creating LVM Vol Group (VG1) and single Log. Vol (lvol1) on ataraid 
mirrored drives (/dev/ataraid/d0p3) only one drives seems to get used.

I have repeated this process several times - 

1. Set up pvcreate - pvcreate /dev/ataraid/d0p1 - success

2. Run pvscan:  Reports
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ataraid/d0p3" is in no VG  [109.32 GB]
pvscan -- inactive PV "/dev/hdc3"         is in no VG  [109.32 GB]
pvscan -- inactive PV "/dev/hda3"         is in no VG  [109.32 GB]
pvscan -- total: 2 [327.96 GB] / in use: 0 [0] / in no VG: 2 [327.96 GB]

3. Run vgcreate -s 64 VG1 /dev/ataraid/d0p3 - success

4. Run pvscan: Reports
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE PV "/dev/ataraid/d0p3" is in no VG  [109.32 GB]
pvscan -- inactive PV "/dev/hdc3"         is in no VG  [109.32 GB]
pvscan -- inactive PV "/dev/hda3"         is in no VG  [109.32 GB]
pvscan -- total: 3 [327.96 GB] / in use: 3 [327.96 GB] / in no VG: 0 [0] 

5. Create Logical Volume goes ok.. Format with ReiserFS - reports 109 GBs or so 
on mounting.  Life is good, right?  Until I reboot.

6. Reboot

7. Run pvscan: Reports
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ataraid/d0p3" is in no VG  [109.32 GB]
pvscan -- inactive PV "/dev/hdc3"         is in no VG  [109.32 GB]
pvscan -- ACTIVE PV "/dev/hda3"         is in no VG  [109.32 GB]
pvscan -- total: 3 [327.96 GB] / in use: 3 [327.96 GB] / in no VG: 0 [0] 

Hda3 becomes the active.. member?..    Drive activity seems to only occur on 
the first drive (which is what made me dig into this in the first place. I 
can't seem to make /dev/ataraid/d0p3 become active.  I've tried unsucessfully 
tor remove with pvchange -x y option for hda3 and hdc3, also tried vgremove.  
Doesn't seem to work.

If I make it a simple ReiserFS partition /dev/ataraid/d0p3 and mount it 
normally, both drives are active -- sharing writes and striping reads.

ATARaid support is in the kernel (no drives installed) and otherwise seems to 
work very well - booting off it and running well on several machines.

Some Specifics:
Debian 3.0, Kernel 2.4.19, Promise built in ata raid, LVM 1.0.4, 2x WD 120 GB 
drives.



..........
Nathan Dornquast
Aberon Technologies, Inc.
2205 California St NE - Suite 003
Minneapolis, MN 55418
w.612.789.9446
c.612.386.6519
..........
