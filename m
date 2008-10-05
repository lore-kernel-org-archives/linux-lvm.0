Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m95KqYrl010914
	for <linux-lvm@redhat.com>; Sun, 5 Oct 2008 16:52:34 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m95KqMB0023111
	for <linux-lvm@redhat.com>; Sun, 5 Oct 2008 16:52:22 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 0B45420008E
	for <linux-lvm@redhat.com>; Sun,  5 Oct 2008 22:52:22 +0200 (CEST)
Date: Sun, 5 Oct 2008 22:52:21 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <613158041.20081005225221@marki-online.net>
Subject: Re: FW: [linux-lvm] Help with LVM reconstruction
In-Reply-To: <BAY111-W54A5BF416B569C8DC0E99FDA3E0@phx.gbl>
References: <mailman.0.1223142047.24795.linux-lvm@redhat.com>
	<BAY111-W46B2F1F16550BBDF7B6293DA3E0@phx.gbl>
	<310119351.20081005215811@marki-online.net>
	<BAY111-W54A5BF416B569C8DC0E99FDA3E0@phx.gbl>
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

Sunday, October 5, 2008, 22:47:50, Robin Thompson wrote:

> Hi,
>  
> Problem is that I don't  - the card will only refer to it in 2gb -
> but it could be actually 2tb as in 2 x 1024 x 1024 x 1024 x1024 bytes.
>  
> I can extract this: 
> physical_volumes {
> pv0 {
> id = "QADZl1-asMf-PyLf-EIw1-qLkv-ZbFI-2goQUD"
> device = "/dev/sdb1"
> status = ["ALLOCATABLE"]
> pe_start = 384
> pe_count = 524286

That should be enough information... But it looks like 4 TB...

PE size is 8 MB and you have 524286 PEs (Physical Extents). That's
3.99 TB (actually it's 4 TB without 16 MB - two PEs, maybe the PV
header is located there - I don't remember the exact LVM structure
on disk).

-- 
  bYE, Marki
