Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0ULX9117436
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:33:09 -0500
Received: from ti41.telemetry-investments.com (209-166-240-202.cust.walrus.com
	[209.166.240.202])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0ULWwD4014693
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:32:59 -0500
Date: Mon, 30 Jan 2006 16:32:46 -0500
From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Subject: Re: [linux-lvm] while file system?
Message-ID: <20060130213246.GA4223@ti64.telemetry-investments.com>
References: <E1F3esb-0001Wr-7x@highlab.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1F3esb-0001Wr-7x@highlab.com>
Reply-To: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>,
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jan 30, 2006 at 12:40:01PM -0700, Sebastian Kuzminsky wrote:
> Looks like Ext3 supports online grow, but only up to +16 GB, which
> makes it useless on modern disks, much less arrays of modern disks....
> Looks like offline grow & shrink are unlimited, which is good.  Lots of
> old (unmaintained?) tools and kernel patches here, but lots of recent
> activity too.  What's the current status?

Andreas Dilger's out-of-tree implementation of ext2/ext3 online resize
allowed one to run ext2prepare in order to prepare the filesystem for much
larger resizes. [The code can be found here: ext2resize.sf.net.]
The ext2prepare(8) man page says:

   The ext2prepare command modifies an unmounted ext2 filesystem
   on device so that ext2online(8) program can later resize the
   mounted  filesystem to  be  at least as large as size although the
   actual maximum size will be some  larger  multiple  of  various
   filesystem  parameters.   While ext2prepare  must  be  run  on
   an unmounted filesystem, device does not have to currently be
   as large  as  size.   This  allows  one  to  later increase  the
   size of device and do the resize while the filesystem is mounted.

On the way toward kernel inclusion, a number of things changed, and some
changes were made to e2fsprogs for compatibility.

The e2fsprogs-1.38 mke2fs(8) man page on Fedora Core 4, under the OPTIONS section,
says:

  resize=max-online-resize
      Reserve enough space so that the block group descriptor table can
      grow to support a filesystem that has max-online-resize blocks.

You can easily test it with a huge sparse file, i.e.,

  dd if=/dev/zero of=/tmp/image.bin bs=4K seek=500000000 count=1  # ~2TB
  mkdir /tmp/mnt
  losetup /dev/loop0 /tmp/image.bin
  mke2fs -b 4096 -j -E resize=2147483648 /dev/loop0 134217728 # 512GB, resize 8TB.
  mount /dev/loop0 /tmp/mnt
  df /tmp/mnt
  ext2online /tmp/mnt
  df /tmp/mnt

Make sure that you have 20GB or so of space on partition where you
create the image.bin.

Regards,

	Bill Rugolsky
