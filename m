Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9O06rwb010320
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 20:06:53 -0400
Received: from buadh-brath.com (host163.right-net.com [207.126.127.163] (may
	be forged))
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9O06hGb007064
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 20:06:43 -0400
Date: Fri, 23 Oct 2009 17:06:42 -0700
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
Message-ID: <20091024000642.GA30974@bdmcc-us.com>
References: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 23, 2009 at 01:41:23PM -0700, Lou Arnold wrote:
> Ryan, Thanks for your suggestion. I know it works, but I had hoped to have a
> solution that didn't stop the whole system while I fixed it.
> 
> To Drew:
> I think you were quite right when you spoke about planning the file system.
> I've come to realize that my question is somewhat naive. One simply doesn't
> do what I wanted to exactly because there is no easy way to dismantle it. It
> would be better to partition off some part of the OS drive and add that to a
> new volume group (or a new logical volume group) and mount that under
> "/mnt", and then add whatever partitions on new drives to that logical
> volume. That logical volume could be dismounted and worked on, whereas
> whatever is under root cannot be worked on easily.


Lou,

I'm surprised that you haven't yet been told that one of the first rules of LVM is "don't use it for root!"  Actually, I don't really hold with that, but it is MUCH more important to plan what you are doing when you do have an LVM root partition.  As you have found, you can not manipulate an LVM partition while it is mounted. ( I know, there are ways for certain types of filesystems, but in general, the rule holds. )  That is especially true when the partition that you want to manipulate is root ( / ).

My general practice is to set up the following list of Logical Volumes ( the minimum which serves for most general purpose machines ): root, swap, home, usr, var.  I generally allocate somewhere around 1G for the root partition.  The others are sized appropriately for the environment.  That usually leaves me a lot of free space on modern drives for "data" space.

The recommendation that you should find a LiveCD at this point is probably one that you should respect.  Playing with mounted filesystems, particularly root, can rapidly lead you down a very nasty path.


Brian
