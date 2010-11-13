Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oADN3P0J013661
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 18:03:26 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oADN3BZM014827
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 18:03:12 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0815F1058DEA
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 00:03:10 +0100 (CET)
Date: Sun, 14 Nov 2010 00:03:10 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20101113230310.GH14546@barkeeper1-xen.linbit>
References: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>
Subject: Re: [linux-lvm] Need help with a particular use-case for pvmove.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Sat, Nov 13, 2010 at 04:45:36PM -0500, Stirling Westrup wrote:
> I have a 4-slot storage array with all slots filled and each of the
> four drives having a single LVM2 partition. These pv's are all
> collected together into a single volume group called 'Storage' and
> containing a single logical volume called 'Data'. This setup has been
> working fine until now, but I've almost run out of storage on the
> array. Plus, one of the drives is showing signs of imminent failure,
> and I'd like to replace it without data loss.
> 
> I got a new 2T drive to replace the near-failure 1T drive and thought
> that I could just unplug one of the good 1T drives, plug in the new 2T
> drive and do a 'pvmove' from the failing drive to the new drive. I
> don't have any way to plug all 5 drives in at once, as my server is
> PATA and my only SATA slots are in the array.
> 
> However pvmove tells me that I cannot do this with a missing drive. I
> can't figure out why this should be. Logically I shouldn't need access
> to the volume groups or logical volumes if I'm not starting the
> drive-mapper or mounting the filesystem built in the logical volume.
> I'm only using LVM because I thought it would give me the ability to
> swap out drives in just the way I am now trying.
> 
> All I want to do is move physical extents from one physical volume to
> another. Both of those volumes are present and accessible. Why should
> uninvolved missing volumes be an issue, and is there any way around
> it?  pmmove suggests running "vgreduce --removemissing" but the
> documentation for vgreduce seems to say that I'd need to 1) use
> --force and 2) it would likely result in data loss.
> 
> Is there anything I can do, short of borrowing another storage array
> somewhere, just so I can have an extra slot to do this move? My other
> option is to put the new drive into a USB case, but the server only
> supports USB1, so moving a terrabyte will take over a week.
> 
> Any help would be appreciated, thanks.

If you do it offline anyways:

Shut down.
Unplug one of the good old drives, plug in the new drive.
If you want to be extra sure against typos,
unplug all but the bad-old drive ;-)

Boot into maintenance mode, use a live-cd if you have to.

Don't activate the VG.  It won't activate with one pv missing anyways,
unless you really want it to.

Then dd_rescue copy the disk image from bad-old to new, including
everything (partition table, if any, LVM signature, the full image).

Remove bad-old drive, have all other old and the new plugged,
reboot normally.

Done.

Estimated downtime, assuming a sustained linear write speed of 80 MiB/s:
1 TiB / (80 MiB/s), well under 4 hours.

1011

If you want to do it "live", using pvmove, you have to have all old
drives plugged in, _and_ the new drive. Even via USB1, if that is your
only option.  Add the new drive as pv to the VG, then pvmove.  As it is
live, you don't have any further downtime yet, but of course you will
have performance impact.

As long as you don't get a drive or USB or other failure during the
process you should be fine, so it should not matter if it takes a week.
You probably could plug in some external sata card as well,
or use nbd or iscsi and thus have the pvmove stream it via network.

You will then have to reduce the bad-old drive from the VG, and
shutdown/unplug old/replug new, which of course involves downtime again.

You should consider using some sort of RAID in the future.

hth,

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
