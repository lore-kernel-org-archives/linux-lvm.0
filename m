From: Melinda Taylor <melinda@phys.unsw.edu.au>
In-Reply-To: <BDEMIPDEGABMNEFIHCPDMEHAFCAA.bill--f.juq41dsj@tao-group.com>
References: <BDEMIPDEGABMNEFIHCPDMEHAFCAA.bill--f.juq41dsj@tao-group.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1058402110.1257.21.camel@neko>
Mime-Version: 1.0
Subject: [linux-lvm] LVM recovery
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
Date: Wed Jul 16 19:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi All,

I haven't yet recieved any advice on how to recover any of the data on
my remaining 2 of 4 disks but i think I know what to do.....think.....

I originally setup the system with the following steps:

- vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group
- pvcreate /dev/sda2 ; pvcreate /dev/sdb1; pvcreate /dev/sdc2; pvcreate
/dev/sdd2
- vgcreate vg01 /dev/sda2 /dev/sdb1 /dev/sdc2 /dev/sdd2
- check no of LE pvdata -E /dev/sdc2 (5710 LE)
 lvcreate -l 5711 -n lv03 vg01 /dev/sdc2
- Make ext3 fs on each LV
 mkfs.ext3 /dev/vg01/lv01

/dev/sda2 and /dev/sdb1 are kaput (both drives died within days of
eachother).

I believe I had 4 logical volumes.

/dev/vg01/lv01
/dev/vg01/lv02
/dev/vg01/lv03
/dev/vg01/lv04

in my volume group.

So I presume this means each LV resided on a separate drive and probably
lv01 and lv02 were the 2 on the 2 dead disk drives.

    * PVs on four SCSI devices
    * A VG called "vg01" comprised of said PVs

If I reinstall lvm on my newly installed system can I recover lv03 and
lv04?

I have had a search and see something called importvg which I think may
be what I need.

Had anyone ever had any experience recovering a volume group with
missing disks?

I have backups of my lvm config but it seems like lvmtab etc are all
binary files, are they of any use to me?

Many Thanks,

melinda
