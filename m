Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DLEgi02296
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 16:14:42 -0500
Received: from ecstasy.winternet.com (CPE-65-25-248-192.mn.rr.com [65.25.248.192])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DLEgb12096
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 16:14:42 -0500
Message-Id: <200402132123.i1DLNfS26985@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040213143846.GB10943@redhat.com> (message from Heinz
	Mauelshagen on Fri, 13 Feb 2004 15:38:46 +0100)
Subject: Re: [linux-lvm] LVM Problems :)
References: <402CD9E4.8070402@demonlord.de> <20040213143846.GB10943@redhat.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 16:14:01 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Heinz Mauelshagen wrote:

>the size of your filesystem and logical volume differs already.
>That's why e2fsadm fails.
>Did you eventually run resize2fs in order to shrink the filesystem ?

>Your logical volume size is 1091456MB (32MB/PE * 34108 PE) but your
>filesystem size is 963584GB (941GB * 1024MB/GB; check with
>"tune2fs -l" and look for the block count and block size to calculate
>this correctly).

>In case the result shows, that your filesystem is already smaller than the LV,
>lvreduce the logical volume appropriately.

>Use the block count * block size result and round it up to the next PE!

To avoid an error in calculating the correct number of logical extents,
and possibly doing an lvreduce(8) to a size smaller than the filesystem:

Use resize_ext2(8) without a size argument.  This will resize the ext2
or ext3 filesystem to be the same size as the logical volume containing
it.  After doing this, e2fsadm(8) can be used to resize the filesystem
and logical volume "simultaneously" to any desired size (that can
contain the filesystem's data).

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
