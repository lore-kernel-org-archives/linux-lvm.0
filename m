Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7UBtdHY017007
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 07:55:39 -0400
Received: from mx12.bbn.com (mx12.bbn.com [128.33.0.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7UBtap2028084
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 07:55:36 -0400
Received: from mgillen2.dsl.bbn.com ([128.89.72.74])
	by mx12.bbn.com with esmtp (Exim 4.60)
	(envelope-from <me@mattgillen.net>) id 1GIOfJ-0003G3-3q
	for linux-lvm@redhat.com; Wed, 30 Aug 2006 07:55:29 -0400
Message-ID: <44F57CB0.2060400@mattgillen.net>
Date: Wed, 30 Aug 2006 07:55:28 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Safeguarding LMV data?
References: <80d985600608300116q2453135fua378dbf1138daa2d@mail.gmail.com>
In-Reply-To: <80d985600608300116q2453135fua378dbf1138daa2d@mail.gmail.com>
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

Craig Hagerman wrote:
> If I understand things correctly, if one of those drives fails I will
> lose all the data spread across both drives. Is this correct?

Essentially.

> When I
> set this up (over a year ago) I guess I kind of assumed that if one
> drive failed I could shrink the LV and still have access to the data
> on the good drive.

I've heard of people that have been able to save data in that situation, but
it's sort of black magic, and you never know what exactly you'll be able to
recover.  From the filesystem's perspective, it's like half your blocks went
bad.  Filesystems really aren't built to handle those situations gracefully.

> I think I have read that the best way to safeguard my data would be to
> set up the hard drives as RAID 5 (which would require an additional
> drive - minimum 3, right). I didn't consider this when I first set up
> the LVM.

Why not RAID 1?  RAID 5 requires 3 disks of the same size (with the RAID
device having the capacity of 2 disks).  RAID 1 (mirror) requires two disks of
the same size (with the RAID device having the capacity of one disk).

> I am wondering if there is anything I can do now to mitigate the
> chance of one drive failing and losing all data? I have thought about
> buying another drive (say a 400GB), moving the data on there, setting
> up LVM with RAID 5 and then moving the data back .... except that the
> new drive would be intended to be used in that RAID 5 configuration. I
> don't think I have a good enough understanding of either RAID 5 or LVM
> and would really appreciate some advice for what I can do.

Read the RAID howto first, and figure out what you want to do at the RAID
level, taking into consideration how many drives you want to buy, the level of
redundancy you need, etc:
http://tldp.org/HOWTO/html_single/Software-RAID-HOWTO/

Once you have the specifics of a particular setup, ask again what to do at the
LVM layer (include at least how big your existing LV is, and how big your new
drive(s) are).

Matt
