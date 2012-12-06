Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qB6MPb4B004304
	for <linux-lvm@redhat.com>; Thu, 6 Dec 2012 17:25:37 -0500
Received: from mail.apocalyptech.com (mail.apocalyptech.com [74.50.51.227])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB6MPaDR003325
	for <linux-lvm@redhat.com>; Thu, 6 Dec 2012 17:25:36 -0500
Date: Thu, 6 Dec 2012 16:25:35 -0600
From: CJ Kucera <pez@apocalyptech.com>
Message-ID: <20121206222535.GA2668@apocalyptech.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Questions about issue_discards
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello, list!

I've started to play around with SSD drives and was curious about a
couple aspects of the issue_discards configuration option.

1) The lvm.conf comments note that when enabled, it'll still only
(obviously) issue discards to storage which happens to support it.  Is
there a way of querying block devices to find out if they support the
feature?

2) Would a change to the issue_discards parameter be picked up
automatically by the running kernel?  The lvm.conf manpage mentions that
it remembers the timestamp of the file "between commands" and will apply
changes then, but it almost sounds like that'd be mostly for things like
the device scanning list, etc.

Thanks!

-CJ
