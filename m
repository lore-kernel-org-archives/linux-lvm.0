Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m95JwPG6025889
	for <linux-lvm@redhat.com>; Sun, 5 Oct 2008 15:58:25 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m95JwDg4029969
	for <linux-lvm@redhat.com>; Sun, 5 Oct 2008 15:58:13 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 3715320008A
	for <linux-lvm@redhat.com>; Sun,  5 Oct 2008 21:58:12 +0200 (CEST)
Date: Sun, 5 Oct 2008 21:58:11 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <310119351.20081005215811@marki-online.net>
Subject: Re: [linux-lvm] Help with LVM reconstruction
In-Reply-To: <BAY111-W46B2F1F16550BBDF7B6293DA3E0@phx.gbl>
References: <mailman.0.1223142047.24795.linux-lvm@redhat.com>
	<BAY111-W46B2F1F16550BBDF7B6293DA3E0@phx.gbl>
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

Hi Robin,

Sunday, October 5, 2008, 21:09:56, Robin Thompson wrote:

> In short the data is intact, and I have found a program called RAID
> Reconstructor that will produce an image file of the RAID 5 arrays.
> This will be hopefully 2.05tb file.
>  
> I've read that I can use losetup and vgscan to create LVM from 2
> image files. But i'm unsure of how to proceed with when i have only
> one file which is combination of both.
>  
> Anyone out there any advice or help?

I have used losetup few times when doing tests with LVM. Your problem
is that you have 2 PVs in 1 file (if I understand it correctly). If
you know the exact size in bytes of the 2tb PV, then you can use dd to
skip those 2tb and copy only the last 50gb into different file. Then
truncate the original to 2tb (or copy first 2tb).
Then you should have 2 files with your 2 PVs. But think of (or test)
any headers that could be in the begining of those files (for example
partition table and only inside partition there is PV).
But generally, it should be possible to use those files as PVs.

-- 
  bYE, Marki
