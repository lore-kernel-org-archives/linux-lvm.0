Message-Id: <4.3.2.7.2.20020817000006.02708b78@mail.bussink.ch>
From: Erik Bussink <mailinglist@bussink.ch>
In-Reply-To: <20020816150554.11E08F90D@tater>
Mime-Version: 1.0
Subject: [linux-lvm] LVM on top of a 3ware 7500-12 RAID5 set.
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
Date: Fri Aug 16 17:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well Paul,

You seems to want to add a lot of building blocks... I myself am planning
a structure with a single tower case (could be racked in 4U) with a
3ware Escalade 7500-12 which is capable of making a 12 Disk RAID5
volume. I'll probably do a 10x drives, 1x parity and 1x hotspare using
160Gb or 200Gb disk. (The OS is on a mirrored SCSI disk).

But when I start I'll probably only get 5 disk, and add disks to the system
as my need grow. This is where the LVM will help me expand the
LVs.

I decided not to use ReiserFS, but I'm still pondering between Ext3 or
SGI's XFS. As the data on the Logical Volume will be large media
files.

On a side note, the 3ware Escalade supports spin-up controls for
disk supporting it (only IBM drives have it). So you can slowly start
a system without blowing the power supply.

Erik
