Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2MKvLj25470
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 15:57:21 -0500
Received: from ms-smtp-01.rdc-kc.rr.com (ms-smtp-01.rdc-kc.rr.com
	[24.94.166.115])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2MKvKWA004475
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 15:57:20 -0500
Date: Mon, 22 Mar 2004 14:57:17 -0600
Message-Id: <200403222057.i2MKvHc05444@ecstasy1.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <1079984217.4449.6.camel@albert.localnet> (message from Craig
	Ringer on Tue, 23 Mar 2004 03:36:57 +0800)
Subject: Re: [linux-lvm] lvm or lvm2?
References: <20040322192910.GA10671@oddprocess.org>
	<1079984217.4449.6.camel@albert.localnet>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

>On Tue, 2004-03-23 at 03:29, Matthew Daubenspeck wrote:

>> Do you think using LVM is a reliable method of sharing home directories?
>> I have been reading the lists, and I notice that in a lot of cases, if
>> one drive dies, you usually lose a lot of information.

Craig Ringer wrote:

>That's why you should really only use it on top of redundant storage
>like RAID 1 or RAID 5, or in situations where you can afford the risk of
>data loss (scratch volumes, hot archives, etc). 

I agree that RAID 5 is a great idea for important data and is the
appropriate layer under LVM for the redundancy that large numbers of
home directories demand.

>I guess that by its self, LVM could be seen as having many of the same
>issues as RAID-0 in terms of data safety - but you're more likely to be
>able to do partial recovery with LVM.

This probably assumes multiple disks in a single volume group.  

The following would be appropriate to a single person workstation:

Although it reduces the flexibility of LVM, creating a volume group per
disk has the advantage that a disk becoming bad loses only the logical
volumes that were on that disk.

I find that this works great for Sun workstations which have two
internal SCA drives.  A single SCA drive can be swapped between
machines easily since each drive "is" its own volume group.
Of course I allocate only a single large partition to a volume group.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
