Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9GNQuXT028739
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 19:26:56 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9GNQnMF020475
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 19:26:50 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ihvo9-0005vN-TW
	for linux-lvm@redhat.com; Tue, 16 Oct 2007 23:26:41 +0000
Received: from brian.lafayette.switchmanagement.com ([198.144.213.21])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 23:26:41 +0000
Received: from bstrand by brian.lafayette.switchmanagement.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 23:26:41 +0000
From: Brian Strand <bstrand@switchmanagement.com>
Date: Tue, 16 Oct 2007 23:26:33 +0000
Message-ID: <ff3hb9$7rt$1@ger.gmane.org>
References: <471351AD.4070406@ianburnett.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <471351AD.4070406@ianburnett.com>
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: LVM on an external USB device - why not?
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
To: linux-lvm@redhat.com

Ian Burnett wrote:
> My current system configuration is a 250GB internal IDE HDD, managed
> using LVM2 under Fedora Core 6. What I would like to do is to put this
> disk into an external USB enclosure to reduce heat generation inside the
> PC. Another reason is to allow the addition of extra disks very easily
> (current case only has room for 1x 3.5" HDD).
> 
> Once the USB drive is connected, I will be performing the initial boot
> stages off a small (2GB) solid-state CF disk, so I don't necessarily
> need the full "boot from USB" capabilities.
> 
> I can't see any problems in doing so myself. I realise that if
> additional usb-storage devices are added, then the raw device may change
> from /dev/sda to /dev/sdb, but with LVM using PV UUIDs to locate
> devices, won't that be irrelevant?
> 
> Are there any caveats to doing this? I haven't seen anything
> particularly relevant on the archives of this mailing list, and I've
> Googled around the subject. I did discover a couple of boot-from-USB
> walkthroughs scattered around the web which unhelpfully said "don't do
> it" without giving any particular reasons. That was from some old posts
> (c. 2005), without any citations, and didn't mention LVM2 so could have
> been based on LVM1.
> 
> All advice welcomed.
> 
> Ian.
> 

(Apologies in advance if this shows up on the list twice.)

While not often usually from USB, I've used LVM2 on USB devices with no
problems (in fact I rarely use them without LVM due to the improved
manageability, as you hinted at).  I'd recommend having all the
necessary USB goo (er, kernel modules) in your initrd regardless of
whether you are actually booting off of the USB device, as LVM doesn't
like to activate a vg with missing pvs.

Best regards,
Brian
