From: "Jan H. van Gils" <JanVG@Knoware.NL>
Message-ID: <001a01c2fb93$bdef8330$240b892c@pe1mhp.ampr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Unable to create a physical volume on a whole disk
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
Date: Sat Apr  5 10:52:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

	Hi,

Thanks for reading this message.

The following is the case, I would like to create a pv on a whole disk
but pvcreate gives me the message that there is a "partition table" on
the
disk.

I removed the partition table with "dd if=/dev/zero of=/dev/hdb bs=512
count=1"
The fdisk command shows me that there is no partion table but pvcreate
tells me
different.

Here is some info :

Disk Info
gw:/dev# dmesg | grep hdb
    ide0: BM-DMA at 0xe000-0xe007, BIOS settings: hda:DMA, hdb:DMA
hdb: ST310212A, ATA DISK drive
hdb: 20005650 sectors (10243 MB) w/512KiB Cache, CHS=19846/16/63,
UDMA(33)

Fdisk Info :

gw:/dev# fdisk -l /dev/hdb

Disk /dev/hdb: 10.2 GB, 10242892800 bytes
16 heads, 63 sectors/track, 19846 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes
Disk /dev/hdb doesn't contain a valid partition table

Pvcreate Info :

gw:/dev# pvcreate --version
pvcreate: Logical Volume Manager 1.0.4
Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)

gw:/dev# pvcreate /dev/hdb

pvcreate -- device "/dev/hdb" has a partition table

Has anybody an idea on howto solve this problem.
I already rebooted the system to be sure the partition table is active.

Greetz Jan

----
With regards Jan H. van Gils
Internet web-page http://www.vgnet.nl/
Internet e-mail address JanVG@Knoware.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
