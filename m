Return-Path: <michael@auctionwatch.com>
Message-ID: <5179B27750A9D411B968009027E06E27012D7290@exback.corp.auctionwatch.com>
From: "Michael S. Fischer" <michael@auctionwatch.com>
Date: Tue, 5 Jun 2001 12:47:37 -0700 
MIME-Version: 1.0
Subject: [linux-lvm] Data loss - vg gone
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello,

We presently have 10 systems, each of which is configured according to the
specs at the bottom (vgdisplay -v output included).  One of the systems had
a common mode failure in which the RAID controller was not present to the
system on reboot; when we discovered this, we rebooted the system.  The RAID
controller and its virtual disk came back but the volume did not.  

vgscan found no volumes (and vgdisplay reports none), but according to
pvscan the physical volume signature is still there.  If I try to recreate
the volume I get the error message that the physical volume already belongs
to the volume group.

Is there any way I can recover the volume?  Any help would be sincerely
appreciated.

Thanks,

--Michael

Hardware:

- 2 x PIII processor
- 1GB RAM
- IDE boot disk
- 4 x 75GB IBM IDE drives, attached to a 3Ware Escalade 6410 RAID controller
in RAID 10 (stripe of mirrors) mode

LVM:

--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               143.17 GB
PE Size               4 MB
Total PE              36652
Alloc PE / Size       30720 / 120 GB
Free  PE / Size       5932 / 23.17 GB
VG UUID               CQIxou-PFxE-pJbv-bslk-tkjy-BARP-c2toQB

--- Logical volume ---
LV Name                /dev/vg0/lv0
VG Name                vg0
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                120 GB
Current LE             30720
Allocated LE           30720
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/scsi/host2/bus0/target0/lun0/part1 (1)
PV Status             available / allocatable
Total PE / Free PE    36652 / 5932

--
Michael S. Fischer / michael at auctionwatch.com /
http://www.auctionwatch.com
Systems Engineer, AuctionWatch.com Inc. / Phone: +1 650 808 5842  
