Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0V0ur107515
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 19:56:53 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0V0up6Z025848
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 19:56:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id CBDA663F3
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 00:56:50 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 30330-05 for <linux-lvm@redhat.com>;
	Tue, 31 Jan 2006 00:56:49 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ma.dl.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 8ADFC63E5
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 00:56:49 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] while file system?
Date: Mon, 30 Jan 2006 18:56:46 -0600
References: <E1F3esb-0001Wr-7x@highlab.com>
In-Reply-To: <E1F3esb-0001Wr-7x@highlab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200601301856.46950.krakrjak@volumehost.net>
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

On Monday 30 January 2006 13:40, Sebastian Kuzminsky wrote:
> XFS, JFS, and Reiser3 all support unlimited online grow but no shrink
> at all.

Where did you find that Reiser3 did not support shrinking?  Unfortunately 
shrinking online is not supported, but offline shrinking is definately 
supported.  Just look at resize_reiserfs(8).  The man page is wrong it does 
support online growing quite well.  The other good news about 
resize_reiserfs(8) is that the K|M|G mean the same as the K|M|G in LVM.  So 
you can say resize_reiserfs -s -1G /dev/to/resize, then lvreduce -L -1G 
vgname/lvol.  I haven't tested, but the same should be true for pvresize as 
well.

JFS does only support growing.
XFS only supports growing for now.  There was a patch submitted back in 
September to the mailing list.  It's current status is unknown to me.

Hope that helps a little,
Zac Slade
