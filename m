Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC1DB30F7
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2017 01:26:40 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97F087F368
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2017 01:26:39 +0000 (UTC)
Received: from melissa.gathman.org ([IPv6:2001:470:8:809::1dc5])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v0Q0ojf0022756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2017 19:50:47 -0500
References: <1485351995.3931.4.camel@intelliad.de>
	<20170125143825.GC15251@redhat.com>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <12d93460-9082-e8cc-a426-697def9fb6f7@gathman.org>
Date: Wed, 25 Jan 2017 19:50:45 -0500
MIME-Version: 1.0
In-Reply-To: <20170125143825.GC15251@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM snapshot: in memory COW table
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 01/25/2017 09:38 AM, Mike Snitzer wrote:
> On Wed, Jan 25 2017 at  8:46am -0500,
> Francois Blondel <fblondel@intelliad.de> wrote:
>
>> Hi all,
>>
>> We currently use LVM snapshot as a solution to backups block devices.
>> The snapshot is not active for a long time, only for the time during
>> which we need to upload the backup to the backup server.
>>
>> As I could read, for example here: http://www.nikhef.nl/~dennisvd/lvmcrap.html
>> snapshots multiply the IO needs of the origin Logical Volume.
>> We would like to avoid that.
> The old dm-snapshot target has "transient" snapshot store already.
> See drivers/md/dm-snap-transient.c
>
> Use of transient isn't going to change the fact that you'll still need N
> snapshot stores; and that any write will trigger an N-way copy-out
> penality when N snapshots of the origin exist.  All you'd be doing with
> transient is getting implicit improved performance of memory speeds.
The transient snapshots seem to only store metadata in memory.  I think
what OP is proposing is to allocate, say, 2G of ram for the snapshot,
instead of allocating a 2G snapshot LV on disk.  The snapshot would
simply disappear if the system crashes or reboots. 

You could kludge this up now by adding a ramdisk PV to the volume group,
somehow avoid allocating normal LVs on the ramdisk PV, and force the
selected snapshot to be allocated on the ramdisk PV.   Adding the
ramdisk to the VG immediately before allocating the snapshot on it (and
using up all the extents) would prevent normal LVs from getting
allocated on it.

The drawback to the above kludge is that on crash or reboot, the ramdisk
PV will be gone - requiring an extra step to remove it from the VG and
undo the snapshot remapping.

A special "use me for snapshots only" flag for PVs would be one way to
start implementing it.
