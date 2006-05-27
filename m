Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4R6YeBb014193
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 02:34:40 -0400
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4R6YdKe005011
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 02:34:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 9E47D1596A
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 06:34:00 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 19848-01 for <linux-lvm@redhat.com>;
	Sat, 27 May 2006 06:33:57 +0000 (UTC)
Received: from ath600.krakrjak.com (ip70-178-219-238.ks.ks.cox.net
	[70.178.219.238])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 76E9D130B7
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 06:33:57 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] Expand physical volume?
Date: Sat, 27 May 2006 01:34:34 -0500
References: <20060526212852.GD5883@pug.qqx.org>
In-Reply-To: <20060526212852.GD5883@pug.qqx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605270134.34108.krakrjak@volumehost.net>
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

On Friday 26 May 2006 16:28, Aaron Schrab wrote:
> Hi,
>
> At work we have an LVM2 setup on top of software RAID1 on a system
> running Debian's testing distribution.  Recently one of the drives
> failed, and we decided to replace both drives with larger ones.
See pvresize in recent releases.  Works very well.

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
