Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2HHvRj09109
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 12:57:27 -0500
Received: from exch-calgary.int.pason.com (hemlock.pason.com [208.38.1.1])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2HHvQ4b016006
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 12:57:26 -0500
Date: Wed, 17 Mar 2004 10:57:25 -0700
From: "Donald Murray P.Eng." <donald.murray@pason.com>
Subject: Re: [linux-lvm] EXT3 snapshot not quiesced by LVM2?
Message-Id: <20040317105725.15a71d21.donald.murray@pason.com>
In-Reply-To: <20040315182356.35f5ca40.donald.murray@pason.com>
References: <20040315182356.35f5ca40.donald.murray@pason.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Does anyone have any theories why our LVM2 snapshots have orphaned inodes?


On Mon, 15 Mar 2004 18:23:56 -0700
"Donald Murray P.Eng." <donald.murray@pason.com> wrote:

> Problem:
> LVM2 snapshots of an EXT3 partition do not appear to be taken
> from a quiesced lv. In /var/log/messages, we see messages about
> an orphaned inode.
> 
> Details:
> We're using LVM2 on a RedHat 7.2 box with a 2.4.22 kernel from kernel.org.
> The kernel has been patched with the following patches:
>     linux-2.4.22-VFS-lock.patch
>     linux-2.4.22-devmapper-ioctl.patch
> 
> Once per hour, we use an LVM snapshot to backup a MySQL database. The
> procedure is:
> 1. mysql server: flush tables with read lock; hold this lock until step 5
> 2. sync
> 3. lvcreate --extents N --snapshot --name dbsnapshotlv /dev/datavg/datalv
> 4. mount -o ro /dev/datavg/dbsnapshotlv /mnt/snapshot
> 5. mysql server: unlock tables
> 6. create backup of /mnt/snapshot
> 7. umount /mnt/snapshot && lvremove /dev/datavg/dbsnapshotlv
> 
> This appears to be working, but there is a message in /var/log/messages
> which is a little disturbing. Whenever we create a snapshot and mount
> the resulting lv, we see the following:
> 
> Mar 15 05:00:05 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
> Mar 15 05:00:05 PC kernel: EXT3-fs: write access will be enabled during recovery.
> Mar 15 05:00:05 PC kernel: kjournald starting.  Commit interval 5 seconds
> Mar 15 05:00:05 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
> Mar 15 05:00:05 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
> Mar 15 05:00:05 PC kernel: EXT3-fs: recovery complete.
> Mar 15 05:00:05 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
> ...
> Mar 15 06:00:05 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
> Mar 15 06:00:05 PC kernel: EXT3-fs: write access will be enabled during recovery.
> Mar 15 06:00:07 PC kernel: kjournald starting.  Commit interval 5 seconds
> Mar 15 06:00:07 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
> Mar 15 06:00:07 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
> Mar 15 06:00:07 PC kernel: EXT3-fs: recovery complete.
> Mar 15 06:00:07 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
> ...
> Mar 16 01:00:06 PC kernel: EXT3-fs: INFO: recovery required on readonly filesystem.
> Mar 16 01:00:06 PC kernel: EXT3-fs: write access will be enabled during recovery.
> Mar 16 01:00:08 PC kernel: kjournald starting.  Commit interval 5 seconds
> Mar 16 01:00:08 PC kernel: EXT3-fs: device-mapper(254,4): orphan cleanup on readonly fs
> Mar 16 01:00:08 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
> Mar 16 01:00:08 PC kernel: EXT3-fs: recovery complete.
> Mar 16 01:00:08 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
> 
> 
> When we mount the snapshot read-write, we instead see the following:
> 
> Mar 16 01:09:17 PC kernel: kjournald starting.  Commit interval 5 seconds
> Mar 16 01:09:17 PC kernel: EXT3 FS 2.4-0.9.19, 19 August 2002 on device-mapper(254,4), internal journal
> Mar 16 01:09:17 PC kernel: EXT3-fs: device-mapper(254,4): 1 orphan inode deleted
> Mar 16 01:09:17 PC kernel: EXT3-fs: recovery complete.
> Mar 16 01:09:17 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
> 
> 
> All we expected to see in /var/log/messages was something more like:
> 
> Mar 17 01:09:03 PC kernel: kjournald starting.  Commit interval 5 seconds
> Mar 17 01:09:03 PC kernel: EXT3 FS 2.4-0.9.19, 19 August 2002 on device-mapper(254,4), internal journal
> Mar 17 01:09:03 PC kernel: EXT3-fs: mounted filesystem with ordered data mode.
> 
> 
> Why would the snapshot volume have an orphaned inode? Doesn't the VFS patch
> allow us to snapshot EXT3? Do we need to quiesce the origin lv some other
> way?
> 
> 
> 
>  ------------------------------------------ 
>  Donald Murray, P.Eng.
>  Senior Software Engineer
>  Pason Systems Corp.
>  Direct: (403) 301-3473
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473
