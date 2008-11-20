Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAK6Rw7j017029
	for <linux-lvm@redhat.com>; Thu, 20 Nov 2008 01:27:58 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.232])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAK6RlxB019621
	for <linux-lvm@redhat.com>; Thu, 20 Nov 2008 01:27:48 -0500
Received: by rv-out-0506.google.com with SMTP id f6so329541rvb.51
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 22:27:47 -0800 (PST)
Message-ID: <b072968d0811192227saf5d30eod86dcddbe64e8d@mail.gmail.com>
Date: Thu, 20 Nov 2008 06:27:47 +0000
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] PVResize
In-Reply-To: <4923DC07020000990003134C@collaborate.seakr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4923C4DE0200008A000062B9@collaborate.seakr.com>
	<4923DC07020000990003134C@collaborate.seakr.com>
	<4923DC07020000990003134C@collaborate.seakr.com>
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

2008/11/19 Nick Couchman <Nick.Couchman@seakr.com>:
> Yes, you'll need to resize the partition, first.  The only way I've come up
> with to do this is to use fdisk to delete the partition and then recreate it
> at the exact same start location with the expanded end location (I always
> make sure I have backups of the contents before I do this - still makes me
> nervous even though I've done it a few dozen times).  Save the new layout,
> then use pvresize to make LVM see the expanded size.

And in the future don't bother putting a partition table on the
device, its not really needed and just makes resizing the device
harder.

--Dave
