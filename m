Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2QBb6Jk015845
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 06:37:06 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2QBb42x024156
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 06:37:04 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 31A5F1147F
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 11:37:04 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 06152-12 for <linux-lvm@redhat.com>;
	Sun, 26 Mar 2006 11:37:01 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id B957511477
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 11:37:01 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] online resize
Date: Sun, 26 Mar 2006 05:36:59 -0600
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
	<200603260407.27160.krakrjak@volumehost.net>
	<20060326102653.GL14018@percy.comedia.it>
In-Reply-To: <20060326102653.GL14018@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603260537.00242.krakrjak@volumehost.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sunday 26 March 2006 04:26, Luca Berra wrote:
> if you have any horror story, please share it, it will surely help other
> users out there.
Distribution: Gentoo
Data: /home
Target: Resize from 1GiB to 800MiB (plenty of free space)
Filesystem: ext3
Method: ext2resize with kernel patches and latest e2fsprogs

Unmount /home in single user mode.  Resize using ext resizing utilities and 
spend the next 12 hours recovering inodes with fsck only to find a few 
hundred megs of data in /home/lost+found (with nonsensical names) and 
swearing off ext3 for mission critical data.

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
