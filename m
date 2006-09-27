Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8R5WwMj030173
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 01:32:58 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8R5WubA024726
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 01:32:57 -0400
Received: from a64.davidb.org ([66.93.32.226])
	by mail.davidb.org with esmtpa (Exim 4.60 #1 (Debian))
	id 1GSS2N-0000kP-B3
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 22:32:51 -0700
Message-ID: <451A0D03.9000204@davidb.org>
Date: Tue, 26 Sep 2006 22:32:51 -0700
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help, lvm2 snapshot and XFS ,	using xfs_freeze to
	do this, but then lvcreate hang.
References: <625ccb870609262203m400d149ax47ef5396dd96236@mail.gmail.com>
In-Reply-To: <625ccb870609262203m400d149ax47ef5396dd96236@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

bowen zheng wrote:

> Help, lvm2 snapshot and XFS , using xfs_freeze to do this, but then
> lvcreate hang.

The lvcreate does the xfs_freeze for you, so if you run xfs_freeze, then
the lcreate will hang.  Running it with '-u' should allow the lvcreate to
hang.

> I use lvm2 and xfs both.  If I do not use xfs_freeze before, I can use
> lvcreate snapshot the lv. And it work fine for some static files or
> lv, but not for running system such as / (root) which will generate a
> log of I/O error.

What kind of errors are you getting.  I've done this on active filesystems
for backup purposes, and not had any problems.

Dave
