Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22KTRK16557
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 15:29:27 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j22KTP18017492
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 15:29:26 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1D6aKf-0006pn-Dd
	for linux-lvm@redhat.com; Wed, 02 Mar 2005 21:20:33 +0100
Received: from 67-36-236-252.ded.ameritech.net ([67.36.236.252])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 02 Mar 2005 21:20:33 +0100
Received: from jnews by 67-36-236-252.ded.ameritech.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 02 Mar 2005 21:20:33 +0100
From: Matthias Julius <jnews@julius-net.net>
Date: Wed, 02 Mar 2005 13:25:29 -0500
Message-ID: <umztl7vmu.fsf@julius-net.net>
References: <002101c51c41$f6bcfdc0$32dcdc0a@vanish>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Having duplicate PV problems,
 think there's a bug in LVM2 md component detection
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

"Ron Watkins" <linux-lvm@malor.com> writes:

> I'm sorry if this is a FAQ or if I'm being stupid.  I saw some
> mentions to this problem on the old mailing list, but it didn't seem
> to quite cover what I'm seeing, and I don't see an archive for this
> list yet.  (and what on earth happened to the old list, anyway?)
>
> My problem is this:  I'm setting up a software RAID5 across 5 IDE
> drives. I'm running Debian Unstable, using kernel 2.6.8-2-k7.   I HAVE
> set md_component_detection to 1 in lvm.conf, and I wiped the drives
> after changing this setting.

I just had the same problem.  As a workaround I set up a filter in
lvm.conf in devices{} like:

filter = [ "a|^/dev/md.*|", "r/.*/" ]

And that works fine.

Matthias
