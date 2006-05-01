Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k41NtutA001542
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 19:55:56 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k41Ntnr5020166
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 19:55:50 -0400
Received: from davidb by mail.davidb.org with local (Exim 4.60 #1 (Debian))
	id 1FaiF3-0007jW-CW
	for <linux-lvm@redhat.com>; Mon, 01 May 2006 16:55:49 -0700
Date: Mon, 1 May 2006 16:55:49 -0700
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] recover a pv from a disk with no partition table
Message-ID: <20060501235549.GA29617@old.davidb.org>
References: <1146527256.31003.63.camel@pc.local>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1146527256.31003.63.camel@pc.local>
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

On Mon, May 01, 2006 at 07:47:36PM -0400, Brian J. Murrell wrote:
> I need to recover a PV from a disk with no partition table.  I have a
> disk which gives EIO errors trying to read from the first few blocks of,
> so, no partition table.
> 
> Is there any way with LVM2, given that I have
> the /etc/lvm/backup/<vgname> file that I can determine the offset into
> the disk where the partition starts, so that I could do:

The backup files don't list physical offsets.  You'll have to figure that
out yourself.  But, you can see the id's for the partitions, and the lvm
header is at offset 0x200 into the partition.

Dave
