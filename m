Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FKjvdT020272
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 16:45:57 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FKjlir014594
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 16:45:49 -0400
Message-ID: <44E2327A.7020907@davidb.org>
Date: Tue, 15 Aug 2006 13:45:46 -0700
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove of lvs while filesystems mounted not
	supported?!?
References: <20060815203856.13265.qmail@web31801.mail.mud.yahoo.com>
In-Reply-To: <20060815203856.13265.qmail@web31801.mail.mud.yahoo.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ed@quillen.net, LVM general discussion and development <linux-lvm@redhat.com>

Edward Quillen wrote:
> Redhat support is telling me (see quote below) that pvmove is not supported when there are mounted
> filesystems on top of the lvs that are being moved. Can this be true? Everyother lvm that I have
> worked with allows this. I am currently experiencing device mapper hangs when I run pvmove while
> there are filesystems mounted even if there is no processes using the filesystems. 
> Is this supposed to work? If so, has anyone had similar issues? Any help would be appreciated? 

Requiring an unmount of the filesystem would kind of defeat the purpose 
of pvmove.  In that case, just create a new volume and dd the data across.

pvmove creates a mirror for each segment it is moving.  That way updates 
will be written to both segments while the mirror is active.

I've done it numerous times, including moving very active filesystems 
off of a flaky drive so that I could replace it.

Dave Brown
