Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i53EwB025173
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 10:58:11 -0400
Received: from monkey.sneakemail.com (clean.sneakemail.com [38.136.15.35])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i53Ew4Xn028764
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 10:58:05 -0400
Date: Thu, 3 Jun 2004 16:57:53 +0200
Subject: Re: [linux-lvm] dd of a used part of a logical volume?
Message-ID: <27202-34029@sneakemail.com>
References: <20040528064553.GA1007%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040528064553.GA1007%alexy.khrabrov@setup.org>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Alexy Khrabrov wrote 40 lines:

[undeleting files w/ReiserFS]

> Now I'd like to play with the dd copying of the whole reiserfs (I'm
> avoiding the word partition since it covers the whole logical volume
> which spans the whole RAID device).

To any file system a logical volume is a partition.  

It just happens that the underlying system may be split over
several hard disks and do not even have to be continous --- just
as LVM sees a single hard drive, but in reality it's several hard
drives joined by a RAID system.

> I simply do not have space to copy
> the whole RAID, but the size of the used space on this reiserfs volume was
> under about 9 GB.  I wonder how can I copy just about that -- I assume it
> fills the logical volume contiguously,

And each time a file grows, you have to jump to the end of the
currently used space, just for that?  That's one of the things
that makes FAT a simple, slow file system.  ReiserFS --- and
most other intelligent file systems --- spread their data over
the whole disk, so even if files grow, the number of jumps the
hard disk head has to make to read a file completely stays low.

> Are there LVM methods to shrink it/copy just the used blocks in
> conjunction with reiserfs, such as resize_reiserfs?

How about asking if your RAID can't do that?  How *can* LVM know
if one chunk of it's space allocated to ReiserFS has been used
by ReiserFS or not?  And what if your precious files were on a
chunk that's *now* unused?

And even if LVM left out the blocks, wouldn't ReiserFS say "Go
block X (roughly 140 GB from the start) and read this block"
and wouldn't it be just too bad if you only had 9 GB, so this
search would fall wide outside the data range you have?

Do you really want LVM to know all intricacies of all file systems,
just to be able to do the job of a completely different tool,
badly?

-Wolfgang
