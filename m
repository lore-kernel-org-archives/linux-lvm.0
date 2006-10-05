Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k95HMTvC032434
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 13:22:29 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k95HMMTi016915
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 13:22:23 -0400
Received: from a64.davidb.org ([66.93.32.226])
	by mail.davidb.org with esmtpa (Exim 4.62 #1 (Debian))
	id 1GVWvN-000380-U0
	for <linux-lvm@redhat.com>; Thu, 05 Oct 2006 10:22:21 -0700
Message-ID: <45253F4D.4010904@davidb.org>
Date: Thu, 05 Oct 2006 10:22:21 -0700
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Avoiding disk changes
References: <45250726.5070300@idealcorp.com>
In-Reply-To: <45250726.5070300@idealcorp.com>
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

John Ward wrote:

>> Try to use hdparm to set your hard-drive in read-only mode.

> Interesting suggestion, certainly shouldn't hurt.  But AFAIK the device
> mapper runs in the kernel and it's going to do it's "own thing" before I
> get a chance to hdparm it.

The device mapper runs in the kernel, but it has no knowledge of the lvm
structures.  This is all done at user level.

I've forgotten in the thread whether or not this is a removable device.  If
it is, you can plug it in after startup, hdparm if that makes you more
comfortable, and then rescan for physical volumes.  If it is a more
permanently attached volume, you might have to modify the OS's startup
scripts to achieve this.

Perhaps you should use a CD-bootable rescue system (I recommend RIP Linux).
At least RIP boots up, and you have to start LVM manually, which would give
you a chance run hdparm and make it read only.

Dave Brown
