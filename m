Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3TEP5h1003695
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:25:05 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3TEOrOb013508
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:24:54 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 17CC32000BA
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 16:24:52 +0200 (CEST)
Date: Tue, 29 Apr 2008 16:24:51 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <184354922.20080429162451@marki-online.net>
Subject: Re: [linux-lvm] LVM mirroring questions...
In-Reply-To: <Pine.LNX.4.44.0804290941010.6839-100000@bmsred.bmsi.com>
References: <4816F5B1.6010608@mortent.org>
	<Pine.LNX.4.44.0804290941010.6839-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Tuesday, April 29, 2008, 16:01:53, Stuart D. Gathman wrote:

> With LVM, many equal sized PE make this automatic. (Although the
> write intent table needs a 3rd drive.)

I was wondering why this can't use LVM internal structures for storing
it (like for example on HP-UX). Having to use 3rd disk is not very
practical (as is not the requirement to re-sync whole LV in case of
disk failure when the LV is really big). I don't remember now if HP-UX
uses the headers of VG or LV to track these changes. But is there any
reason, why this couldn't use for example first LE of LV?


-- 
  bYE, Marki
