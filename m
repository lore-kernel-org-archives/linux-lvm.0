Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i38MnIj05799
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 18:49:18 -0400
Received: from imf24aec.mail.bellsouth.net (imf24aec.mail.bellsouth.net
	[205.152.59.72])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i38MnGMC020206
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 18:49:16 -0400
Received: from david.internal.NorcrossGroup.com ([68.213.19.251])
	by imf24aec.mail.bellsouth.net
	(InterMail vM.5.01.06.08 201-253-122-130-108-20031117) with ESMTP id
	<20040408224911.PHPG26287.imf24aec.mail.bellsouth.net@david.internal.NorcrossGroup.com>
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 18:49:11 -0400
Subject: Re: [linux-lvm] snapshots and reiserfs
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20040408181835.GA11818@earth.solarsys.private>
References: <20040408181835.GA11818@earth.solarsys.private>
Message-Id: <1081464495.25994.6.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Date: Thu, 08 Apr 2004 18:48:15 -0400
Content-Transfer-Encoding: 7bit
Reply-To: freemyer-ml@NorcrossGroup.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Thu, 2004-04-08 at 14:18, Mark M. Hoffman wrote:
> Hello:
> 
> Sometimes, but not always, I am unable to mount a snapshot.
> When it fails, I see the following lines in my logs...
> 
> kernel: reiserfs: checking transaction log (device 3a:06) ...
> kernel: clm-2076: device is readonly, unable to replay log
> kernel: Replay Failure, unable to mount
> kernel: reiserfs_read_super: unable to initialize journal space
> 
> I am using RedHat 9 with the following stock packages:
> 
> kernel-smp-2.4.20-30.9
> lvm-1.0.3-12
> reiserfs-utils-3.6.4-5
> 
> I have not tried the combination of snapshots & reiserfs with
> earlier RedHat packages so I don't know if this is a regression.
> 
> After some STFW, I thought I might need a "VFS lock" patch.
> However, it looks like this was already included by RedHat...
> in kernel-smp-2.4.20-30.9.src.rpm there is already this patch:
> linux-2.4.18-lvm-VFSlock.patch.
> 
> Is there anything else I can try or look at?
> 
> Also, is it necessary that the filesystem be quiescent in order to
> create a snapshot?  I could temporarily remount readonly to create
> the snapshot, but I would like not to have to do that.
> 
> Thanks and regards,

XFS used to have this problem about a year ago.

For xfs the issue was that xfs mount attempted a journal replay even
when the mount was read-only.  XFS now skips journal replay on read-only
mounts.

You should ask on a reiserfs list if they skip journal replay on
read-only mounts or not.

Greg
-- 
Greg Freemyer
