Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBDKW07j029737
	for <linux-lvm@redhat.com>; Sat, 13 Dec 2008 15:32:00 -0500
Received: from mail-relay.seakr.com (mx2.seakr.com [64.207.50.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBDKV3FI025345
	for <linux-lvm@redhat.com>; Sat, 13 Dec 2008 15:31:03 -0500
Received: from mx-inside.seakr.com (mx-inside.seakr.com [192.168.100.31])
	by mail-relay.seakr.com (8.12.10/8.12.10) with ESMTP id mBDKMTip020630
	for <linux-lvm@redhat.com>; Sat, 13 Dec 2008 13:22:29 -0700
Received: from collaborate.seakr.com (collaborate.seakr.com [192.168.100.28])
	by mx-inside.seakr.com (Postfix) with ESMTP id BC6A54481F
	for <linux-lvm@redhat.com>; Sat, 13 Dec 2008 13:31:02 -0700 (MST)
Message-Id: <4943B9150200009900031D9D@collaborate.seakr.com>
Date: Sat, 13 Dec 2008 13:31:01 -0700
From: "Nick Couchman" <Nick.Couchman@seakr.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problem with "missing" volume group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I posted this a couple of weeks ago with no response, so hear goes,
again...I have a system set up with Multipath and LVM.  One of my RAID
devices is a 2.7TB device that has multiple FC paths to the host.  I set
up multipath to see the device, output of "multipath -l" looks like
this:

RAID2VOl1 (3600d023000634a090000012dff2d3e00) dm-18 IFT,A16F-R1A2
[size=2.7T][features=1 queue_if_no_path][hwhandler=0]
\_ round-robin 0 [prio=0][active]
 \_ 0:0:0:2 sdh 8:112 [active][undef]
 \_ 1:0:0:2 sdi 8:128 [active][undef]

I'm using Openfiler with this device, which requires that I set up a
partition on it.  So I did - partition table looks like this:

[root@openfiler etc]# fdisk -l /dev/dm-18 
You must set cylinders.
You can do this from the extra functions menu.

Disk /dev/dm-18: 0 MB, 0 bytes
255 heads, 63 sectors/track, 0 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

      Device Boot      Start         End      Blocks   Id  System
/dev/dm-18p1               1      267350  2147483647+  ee  EFI GPT
Partition 1 has different physical/logical beginnings (non-Linux?):
     phys=(0, 0, 1) logical=(0, 0, 2)
Partition 1 has different physical/logical endings:
     phys=(1023, 254, 63) logical=(267349, 89, 4)

Of course, /dev/dm-18p1 doesn't really exist, so I'm not exactly how I
accomplished this in the first place, but perhaps I partitioned the
device (sdh or sdi) before setting it up under multipath.  In any case,
it worked, I was able to create a volume group, raid50, and create a
couple of volumes on it.  Well, I removed another volume from the
system, from a different volume group, and now the raid50 volume group
has disappeared.  lvs, vgs, and pvs do not show it all, nor does pvs
show /dev/dm18 (or sdh or sdi, which are the devices back the dm-18
multipath device) as a valid device.  pvscan does not rediscover them,
either.  Furthermore, the volumes from this volume group, valor and
xenvdi, are still visible in /dev/mapper (as raid50-valor and
raid50-xenvdi) and are still linked in /dev/raid50.  I can still access
the volumes, write to them, share them via iSCSI, etc.  dmsetup also
still shows them as well as the multipath device.  However, I cannot use
any of the lvm tools to display information about the volumes, remove
them, resize them, etc.  For example, if I try to
"lvremove /dev/raid50/valor" I get the following message:

Volume group "raid50" not found

So, how should I proceed??  I've already migrated the data off those
volumes onto other volumes (that LVM can actually see!!), so I'm not
concerned so much anymore about losing those devices/volumes or even the
volume group as I am getting the system "reset" so that I can correctly
set up the RAID as a multipath device, set up a volume group, etc.  I'm
afraid to shut down multipathd since the two LVM volumes on that device
are still active, but is that okay?  Or should I use dmsetup to remove
the those two volumes, then shut down multipathd?  I know a system
reboot would be good at this point, but this storage system is backing a
bunch of my production servers and I can't take it down right now, so
any hints on commands that I can execute to deactivate these volumes,
correct the device configuration, and either reactivate the volumes or
just recreate them altogether, without disturbing the other volumes on
the system would be great.

Thanks - Nick





This e-mail may contain confidential and privileged material for the sole use of the intended recipient.  If this email is not intended for you, or you are not responsible for the delivery of this message to the intended recipient, please note that this message may contain SEAKR Engineering (SEAKR) Privileged/Proprietary Information.  In such a case, you are strictly prohibited from downloading, photocopying, distributing or otherwise using this message, its contents or attachments in any way.  If you have received this message in error, please notify us immediately by replying to this e-mail and delete the message from your mailbox.  Information contained in this message that does not relate to the business of SEAKR is neither endorsed by nor attributable to SEAKR.
