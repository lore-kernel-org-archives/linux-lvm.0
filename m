From: gerhard.fuernkranz@mchp.siemens.de
Message-ID: <3981D251.540BDB28@mchp.siemens.de>
Date: Fri, 28 Jul 2000 20:34:57 +0200
MIME-Version: 1.0
Subject: Re: [linux-lvm] Alternate Pathing?
References: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCD0E@storeage_nt>
		<20000724135818.A26581@mail.sistina.com>
		<20000724222446.A22101@jadzia.josv.com> <yq1lmyr6sm8.fsf@tyra.mkp.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Martin K. Petersen" <mkp@linuxcare.com>
Cc: Jos Visser <josv@osp.nl>, Heinz Mauelshagen <mauelshagen@sistina.com>, Sergey Vichik <SVichik@store-age.com>, linux-lvm@msede.com

"Martin K. Petersen" wrote:

> Jos> Alternate pathing depends on the driver being able to decide that
> Jos> a device probed via a particular controller is exactly the same
> Jos> device as one that it has already seen through a controller that
> Jos> has been probed earlier. I think it will be hard to decide on a
> Jos> unique identifier that works for all types of block devices
> Jos> (serial number?)
> 
> Fortunately, (at least in the FC-AL case) most vendors are smart
> enough to assign UUIDs to their devices.  SCSI inquiries also help.
> Finally, ext2 and XFS also have UUIDs in their superblocks.  Hence we
> have several ways to get hints about the physical setup.

Using the UUIDs in the superblocks can cause confusion, if you e.g. have two
physical copies of a disk. You'll look at the the superblock and think there
are two paths, but in reality you have two different disks with the same
contents in the superblock.

SCSI and Fibre-Channel devices usually can be uniquely identified by the SCSI
serial number of the device, which can be retrieved with SCSI inquiry.
Unfortunately some devices report different serial numbers for the same
target/lun if you access the lun via a different SCSI/FC port. Some devices
encode the accessing SCSI/FC port number into a few bits of the serial number
so that only a truncated serial number could be used for identification and
again some others (e.g. EMC Symmetrix) can be configured whether they shall
report common serial numbers or not.

> It is my intention to feature a pluggable driver scheme depending on
> the physical device in the other end.

I agree. Despite the problems I mentioned above I still think that for a
majority of devices SCSI serial numbers will be sufficient for unique
identification.

For devices supporting only active/passive mode (see below), a special device
dependent driver is required anyway to perform the path failover in a device
dependent way. Thus such a driver could also do the device dependent LUN
identification if it should be required.

> Also, some devices require to
> be poked to initiate failover/failback.

Correct. Actually with multipathing we have to distinguish 2
strategies depending on the capability of the device:

1. Active - Active:
   Here the device can be accessed via the multiple access paths
   simultaneously. The multiple paths can also used to load
   balance the I/O requests to increase the overall throughput.

   But you have to be very careful. Not each dynamic
   multipath load balancing strategy will automatically increase
   the performance. Some strategies may even make the performance
   worse. Especially round robin strategies implemented in a layer
   that resides on the top of e.g. two disk drivers may be affected.
   Assume that such an MP driver distributes the requests which come
   down to the underlying two disk drivers: one request to the left
   and one to the right ... Although both underlying drivers implement
   an elevator strategy and keep a sorted list of request, the requests
   arriving at the disk (from both drivers simultaneously) are no
   longer sorted and may lead to unnecessary disk head movements,
   which are avoided if all requests are fed through a single disk
   driver only. In the worst case the 1st driver's elevator is going
   up while the 2nd driver's elevator goes down at the same time.
   Of course devices with a large write-back cache will suffer less
   than e.g. simple disks with a small cache or a write-through only
   cache. Furthermore everything will depend heavily on the
   application's disk access pattern.

2. Active - Passive:
   The device can be accessed via multiple paths, but not at the
   same time. Normally you access the device via path1 and
   path2 is idle, and only if path1 fails, then you switch
   the device to the 2nd path and do all futher I/O via path2.
   This switchover is usually done with some (usually proprietary)
   SCSI commands sent to the device.
   Here load balancing can only be achieved in a static way, but
   not dynamically. E.g. you use path1 as default path for Lun 1
   and use path2 as default path for another Lun 2. But whether this
   is possible or not will depend on the device.

My impression is, that (1) is rather supported by more expensive enterprise
storage subsystems, while the cheaper raid subsystems often only support method
(2) if they do support multipathing at all. But there is no general rule for
that. Method (1) is usually also usable for simple, (non-RAID) JBODs ("just a
bunch of disks", e.g. Fibre Channel disks), if you have a storage subsystem,
that provides you redundant, multipathed access to these disks.

> Worst case (i.e. with incredibly stupid hardware) people will have to
> specify the paths manually.

Yes.


Gerhard
