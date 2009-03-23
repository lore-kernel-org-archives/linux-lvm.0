Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2NDgZgT015649
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 09:42:35 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2NDgGGW006814
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 09:42:16 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTPA id 018D02000B2
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 14:42:14 +0100 (CET)
Date: Mon, 23 Mar 2009 14:42:14 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <632423058.20090323144214@marki-online.net>
Subject: Re: [linux-lvm] LVM2 and its Snapshot cause Windows bluescreen when
	connected simultaneously using iSCSI
In-Reply-To: <8CB7985B43694C5-1568-4CEE@webmail-me04.sysops.aol.com>
References: <8CB7985B43694C5-1568-4CEE@webmail-me04.sysops.aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hello,

Monday, March 23, 2009, 5:19:33, thomas62186218@aol.com wrote:

> I am trying to determine why this happens. I noticed that if I log in
> to the original LVM2 volume using iSCSI by itself, and logout, and then
> login to the Snapshot using iSCSI by itself, there is no problem. I 
> also notice that the LVM2 volume and its Snapshot appear identically to
> Windows (maybe not surprising)....same drive letter and volume name, 
> etc.

> Is the blue screen occurring because two devices, both with the same 
> name and same drive letter, appeared on Windows at the same time, and 
> Windows crashes as a result?

Yes, Windows is probably having troubles seeing the SAME disk twice.
Remember that when you take a snapshost of LV (which Windows sees as a
LUN/disk presented by iSCSI) it is a copy of original, so it has the
same UUID and all other identifiers - and Windows doesn't like that.

You either have to present the snapshot to different Windows machine
or use your linux/windows to change UUID (use google what exactly
needs to be changed), so that Windows will see it as a different disk.
And when it is a different disk for Windows, it may still contain the
same filesystem (with filesystem unique id).

FYI the same applies to Linux - with the exception that Linux doesn't
do anything without your approval and that it doesn't panic when it
sees duplicate PV/filesystem.


-- 
  bYE, Marki
