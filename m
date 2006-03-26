Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2Q8kKYA029617
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 03:46:20 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2Q8kHaZ023371
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 03:46:18 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 1937B1144B
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 08:46:17 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 05607-10-2 for <linux-lvm@redhat.com>;
	Sun, 26 Mar 2006 08:46:15 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id A88301144F
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 08:46:15 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] online resize
Date: Sun, 26 Mar 2006 02:46:13 -0600
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
In-Reply-To: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603260246.13779.krakrjak@volumehost.net>
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

On Thursday 16 March 2006 07:08, Roger Lucas wrote:
> We use Reiser3 here and it can grow a volume whilst it is mounted, but you
> have to unmount the volume before you can shrink it.
>
> The man pages for resize_reiserfs indicate that it should be used on
> unmounted volumes...
reiser3, resizable online in two ways (growing only)
        1)resize_reiserfs /path/to/dev 
        2)mount -o remount,resize /path/to/dev
To shrink reiser3 filesystem it must be unmounted.

XFS, MUST be mounted to resize use xfs_grow /mount/point
JFS, resizable online with a mount -o remount,resize /path/to/dev
ext2/3, resizable offline reliably.  Online resize is a *very* experimental 
experiment.  Have good backups.

For a good reference if one is ever needed to give to a friend, relative or 
foe try http://www.tldp.org/HOWTO/LVM-HOWTO/extendlv.html

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
