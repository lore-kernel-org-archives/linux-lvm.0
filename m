Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9V2e7GH011622
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 22:40:07 -0400
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9V2dtsP012232
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 22:39:56 -0400
Received: from mira.localnet ([96.252.93.182]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSC00MH3Y2ETZ90@vms173015.mailsrvcs.net> for
	linux-lvm@redhat.com; Fri, 30 Oct 2009 21:39:51 -0500 (CDT)
Message-id: <4AEBA376.7000600@mattgillen.net>
Date: Fri, 30 Oct 2009 22:39:50 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-version: 1.0
Subject: Re: [linux-lvm] missing device that isn't missing
References: <4AEA57F6.1040909@mattgillen.net>
In-reply-to: <4AEA57F6.1040909@mattgillen.net>
Content-transfer-encoding: 7bit
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

On 10/29/2009 11:05 PM, Matthew Gillen wrote:
> I've got a strange problem: fresh install of Fedora 11 x86_64, with three
> disks (wiped them all for the install).  sda has 2 partitions (/boot is
> one), sdb and sdc each have one partition.
> 
> After booting, the root filesystem works, but the lvm system is complaining
> that it can't find the device that is supposed to be /dev/sda2.
> ....
> If anyone has a crazy / dangerous suggestion, I'll try it (I've nothing to
> lose, except re-install time, and it looks like I'll be paying that price
> anyway).  But you'll have to post before about 9am eastern ;-)

Manually setting up the partitions (instead of letting the installer do it)
and re-installing did in fact make the problem go away.

Matt
