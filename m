Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0DCGjaH014610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2017 07:16:45 -0500
Received: from zimbra13.linbit.com (zimbra13.linbit.com [212.69.166.240])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80C238F226
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2017 12:16:43 +0000 (UTC)
Date: Fri, 13 Jan 2017 13:16:40 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20170113121640.GC9172@soda.linbit>
References: <07fb8e78-2050-a2ba-3e71-c21e989d57f3@knebb.de>
	<20170110094258.GB4322@soda.linbit>
	<f8301ede-61ac-2dda-8710-4273eaf20796@knebb.de>
	<20170112170053.GE4650@soda.linbit>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170112170053.GE4650@soda.linbit>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [DRBD-user] LVM on top of DRBD [actually: mkfs.ext4
 then mount results in detach on RHEL 7 on VMWare]
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
To: LVM general discussion and development <linux-lvm@redhat.com>, drbd-user@lists.linbit.com

On Thu, Jan 12, 2017 at 06:00:53PM +0100, Lars Ellenberg wrote:
> On Wed, Jan 11, 2017 at 06:23:08PM +0100, knebb@knebb.de wrote:
> > Hi Lars and all,
> > 
> > 
> > >> I have to cross-post to LVM as well to DRBD mailing list as I have no
> > >> clue where the issue is- if it's not a bug...
> > >>
> > >> I can not get working LVM  on top of drbd- I am getting I/O erros
> > >> followed by "diskless" state.
> > > For some reason, (some? not only?) VMWare virtual disks tend to pretend
> > > to support "write same", even if they fail such requests later.
> > >
> > > DRBD treats such failed WRITE-SAME the same way as any other backend
> > > error, and by default detaches.
> > Ok, it is beyond my knowledge, but I understand what the "write-same"
> > command does. But if the underlying physical disk offers the command and
> > reports an error when used this should apply to mkfs.ext4 on the device/
> > partition as well, shouldn't it?
> 
> In this case, it happens on first mount.
> Also, it is not an "EIO", but an "EOPNOTSUP".
> 
> What really happens is that the file system code calls
> blkdev_issue_zeroout(),
> which will try discard, if discard is available and discard zeroes data,
> or, if discard (with discard zeroes data) is not available or returns
> failure, tries write-same with ZERO_PAGE,
> or, if write-same is not available or returns failure,
> tries __blkdev_issue_zeroout() (which uses "normal" writes).
> 
> At least in "current upstream", probably very similar in your
> almost-3.10.something kernel.
> 
> DRBD sits in between, sees the failure return of write-same,
> and handles it by detaching.
> 
> > drbd detacheds when an error is
> > reported- but why does Linux not report an error without drbd? And why
> > does this only happen when using LVM in-between? Should be the same when
> > LVM is not used....
> 
> Yes. And it is, as far as I can tell.
> 
> > > Older kernels (RHEL 6) and also older drbd (8.3) are not affected, because they
> > > don't know about write-same.
> > My primary host is running CentOS7 while the secondary ist older
> > (CentOS6). I will try to create the ext4 on the secondary and then
> > switch to primary.
> > 
> > > Or tell the system that the backend does not support write-same:
> > > Check setting:
> > > 	grep ^ /sys/block/*/device/scsi_disk/*/max_write_same_blocks
> > > disable:
> > > 	echo 0 | tee /sys/block/*/device/scsi_disk/*/max_write_same_blocks
> > >
> > A "find /sys -name "*same*"" does not report any files named
> 
> double check that, please.
> all my centos7 / RHEL 7 (and other distributions with sufficiently new
> kernel) have that.
> 
> there are both the read-only /sys/block/*/queue/write_same_max_bytes
> and the write-able /sys/devices/*/*/*/host*/target*/*/scsi_disk/*/max_write_same_blocks
> 
> > "max_write_same_blocks". On none of the both nodes. So I dcan not
> > disable nor verify if it's enabled. I assume no as it does not exist. So
> > this might not be the reason.
> 
> show us lsblk -t and lsblk -D from the box that detaches.
> (the "7" one)
> 
> It may also be that a discard failed, in which case it could be
> devicemapper pretending discard was supported, and the backend failing
> that discard request. Or some combination there.
> 
> Your original logs show
> > Jan  7 10:58:44 backuppc kernel: EXT4-fs (dm-2): mounted filesystem with ordered data mode. Opts: (null)
> > Jan  7 10:58:48 backuppc kernel: block drbd1: local WRITE IO error sector 5296+3960 on sdc
> 
> The "+..." part is the length (number of sectors) of the request.
> We don't allow "normal" requests of that size, so this is either a
> discard or write-same.
> 
> > Jan  7 10:58:48 backuppc kernel: block drbd1: disk( UpToDate -> Failed )
> 
> > Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local nor remote data, sector 29096+3968
> 
> > Jan  7 10:58:48 backuppc kernel: dm-2: WRITE SAME failed. Manually zeroing.
> 
> And here we see that at least some WRITE SAME was issued, and returned failure.
> and device mapper, which in your case sits above DRBD,
> and consumes that error, has its own fallback code for failed write-same.

Correcting myself, the presence of the warning message misled me.

The 3.10 kernel still has that warning message directly in
blkdev_issue_zeroout(), so that's not the device mapper fallback,
but simply the mechanism I described above, with additional "log that I
took the fallback because of failure".

Which means DISCARDS have not even been tried,
or we'd have a message about that as well.

> Which can no longer be services, because DRBD already detached.
> 
> So yes,
> I'm pretty sure that I did not pull my "best guess" out of thin air only
> 
>   ;-)

-- 
: Lars Ellenberg
: LINBIT | Keeping the Digital World Running
: DRBD -- Heartbeat -- Corosync -- Pacemaker

DRBD� and LINBIT� are registered trademarks of LINBIT
__
please don't Cc me, but send to list -- I'm subscribed
