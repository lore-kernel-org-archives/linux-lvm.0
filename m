Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1IFnI107217
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2006 10:49:18 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1IFnH9r013225
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2006 10:49:17 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id D7F13CCA4
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2006 15:49:16 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 10015-15 for <linux-lvm@redhat.com>;
	Sat, 18 Feb 2006 15:49:15 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 8C300CC87
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2006 15:49:15 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] Booting into LVM - RESOLVED
Date: Sat, 18 Feb 2006 09:49:14 -0600
References: <20060218141658.650BF12EC9@bluewhale.planbit.co.uk>
In-Reply-To: <20060218141658.650BF12EC9@bluewhale.planbit.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602180949.14319.krakrjak@volumehost.net>
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

On Saturday 18 February 2006 08:17, Roger Lucas wrote:
> http://poochiereds.net/svn/lvm2/lvm2create_initrd
>
> The above link is to an "initrd" creation script that worked perfectly on
> my Debian box.  This resolves the whole "no devfs" problem.
Glad that worked out for you!  For Gentoo users you can use genkernel, it can 
make initramfs images that contain udev, lvm2, dmraid, evms, etc.  It's a 
nice tool and works for most things.  Now if it just had mdadm support......
-- 
Zac Slade
