Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6R3ALuT022860
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 23:10:21 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6R3A65H016493
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 23:10:07 -0400
Received: from localhost.housecafe.de ([127.0.0.1] helo=localhost)
	by bogon.housecafe.de with esmtp (Exim 4.69)
	(envelope-from <lists@nerdbynature.de>) id 1MVGbB-0002aF-SJ
	for linux-lvm@redhat.com; Mon, 27 Jul 2009 05:10:01 +0200
Date: Sun, 26 Jul 2009 20:10:01 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [linux-lvm] lvm2 confused about double UUID
In-Reply-To: <alpine.DEB.2.01.0907261808300.6426@bogon.housecafe.de>
Message-ID: <alpine.DEB.2.01.0907262003020.6426@bogon.housecafe.de>
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
	<4A6CF9C0.6020902@cox.net>
	<alpine.DEB.2.01.0907261808300.6426@bogon.housecafe.de>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 26 Jul 2009 at 18:22, Christian Kujau wrote:
> Sure, if it turns out to be a (Ubuntu-)specific kernel/lvm2 issue, I'll do 
> so.

I've compiled the LVM2 tools from a current CVS checkout and I begin to 
think that the filter= parsing is possibly involved here. I changed the 
filter slightly to be more specific, and tried again:

  filter = [ "a|^/dev/sda.*$|", "a|^/dev/sdb.*$|", "r/.*/" ]

1) with LVM-2.02.26
  PV         VG   Fmt  Attr PSize   PFree   DevSize PV
  /dev/sda2  vg01 lvm2 a-   111.67G   6.56G 111.67G
  /dev/sdb1  vg02 lvm2 a-   931.46G 137.46G 931.46G

2) with LVM-2.02.50, using the same lvm.conf (according to strace)

  Found duplicate PV 1O2Tkq9Jy8VfuZuzFh1f6viVBDhcK6Vq: using /dev/sdc1 not /dev/sdb1
  PV         VG   Fmt  Attr PSize   PFree   DevSize PV
  /dev/sda2  vg01 lvm2 a-   111.67G   6.56G 111.67G
  /dev/sdc1  vg02 lvm2 a-   931.46G 181.46G 931.46G

So, can anybody comment if the filer above makes any sense at all?

Thanks in advance,
Christian.
-- 
BOFH excuse #281:

The co-locator cannot verify the frame-relay gateway to the ISDN server.
