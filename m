Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9SK75jt023698
	for <linux-lvm@redhat.com>; Sun, 28 Oct 2007 16:07:05 -0400
Received: from server.klug.on.ca (server.klug.on.ca [205.189.48.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9SK6xOm003318
	for <linux-lvm@redhat.com>; Sun, 28 Oct 2007 16:06:59 -0400
Received: from linux.interlinx.bc.ca (d38-139-100.home1.cgocable.net
	[72.38.139.100])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.klug.on.ca (Postfix) with ESMTP id 7D4C22803
	for <linux-lvm@redhat.com>; Sun, 28 Oct 2007 16:06:58 -0400 (EDT)
Received: from [10.75.22.1] (pc.ilinx [10.75.22.1])
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 9539E872E
	for <linux-lvm@redhat.com>; Sun, 28 Oct 2007 16:06:54 -0400 (EDT)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Sun, 28 Oct 2007 16:06:54 -0400
Message-Id: <1193602014.24601.27.camel@pc.ilinx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvresize not working?
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

I'm trying to shrink a PV and it just does not seem to want to work.

My disk has to partitions, hda1 and hda2.  hda1 is a regular primary
partition and so is hda2.  hda1 has an ext3 filesystem and hda2 is an
LVM PV.

After booting from a livecd, I used pvdisplay /dev/hda2 to observe that
it was 4886 extents long and each extent is 4M.  Through trial and error
I discovered I could reduce it to 4761 extents.  So I went ahead and did
that.

I then shrank the partition (through a delete and add operation for
partition #2) by 10 cylinders where each cylinder is 8225280 bytes long.
I observed through /proc/partitions before and after the fdisk operation
that the partition table change was effective to the kernel.

Considering I reduced the PV by 524,288,000 bytes, reducing the
partition by 82,252,800 should be quite safe.  Or so I thought.

After reducing the partition and observing the reduction
through /proc/partitions, a vgscan was giving me errors:

lseek: 20497235968 failed: Invalid ... (EINVAL)

Now for the life of me I cannot figure out why vgscan would be trying to
seek to 20,497,235,968 considering that is beyond the end of even 4886
4M extents (20,493,369,344).  But even still, why would it be trying to
seek what is obviously beyond the end of the partition considering I
told it that the PV is now smaller?

Any thoughts?

b.
