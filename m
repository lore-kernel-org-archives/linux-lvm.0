Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i55FxV031202
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2004 11:59:31 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i55FxPXn011483
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2004 11:59:25 -0400
Subject: Re: [linux-lvm] Directories turned to sockets
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <OF3823B246.F4B7B594-ON00256EA9.006F70FC-00256EA9.00706378@svunta.os.is>
References: <OF3823B246.F4B7B594-ON00256EA9.006F70FC-00256EA9.00706378@svunta.os.is>
Content-Transfer-Encoding: 7bit
Message-Id: <1086451154.2412.5.camel@localhost>
Mime-Version: 1.0
Date: Sat, 05 Jun 2004 11:59:14 -0400
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm@sistina.com

On Fri, 2004-06-04 at 16:27, Kjartan Reynir Hauksson wrote:
> This afternoon I discovered that a 141 directories had turned into
> socets on one of my lvm volume, that is a folder previously listed
> with the attributes drwxrwxr-x now has srwxrwxr-x.  I don't know if
> this is an lvm problem or not but something has defanately gone wrong
> with my filesystem and I'd like to know if anyone could tell me what
> might be going on.  I'm running mandrake 10 with ext3 filesystems on
> lvm2 volumes (allthough it says it's using lvm1 metadata??).

This doesn't sound like a problem with LVM2. LVM2 just presents block
devices, and doesn't really have any concept of things at the filesystem
level. I may be incorrect, but I'd look more for something at the
filesystem level (unmount the filesystem and fsck it perhaps), or
perhaps a rogue process or cron job that has done this change on your
machine.

-- 
Jeff Layton <jtlayton@poochiereds.net>
