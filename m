Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4H5E2009344
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 01:14:02 -0400
Received: from chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4H5Dsx7004906
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 01:13:54 -0400
Received: from chaos.ao.net (harik@localhost [127.0.0.1])
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) with ESMTP id i4H5DpuE002445
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 01:13:51 -0400
Received: (from harik@localhost)
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) id i4H5DoRi002444
	for linux-lvm@redhat.com; Mon, 17 May 2004 01:13:50 -0400
Date: Mon, 17 May 2004 01:13:50 -0400
From: Dan Merillat <dmerillat@sequiam.com>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040517051350.GA2216@chaos.ao.net>
References: <40A72846.5050801@mlug.missouri.edu>
	<1084705130.3126.2.camel@localhost>
	<40A77537.20107@mlug.missouri.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40A77537.20107@mlug.missouri.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 16 May 2004, Michael wrote:

> 
> >I run everything on LVM except for /boot, primarily because I use GRUB
> >as a bootloader and it doesn't understand LVM volumes. As long as your
> >bootloader understands LVM volumes there should be no problem with it.
> > 
> >
> I use Lilo. Does Lilo understand LVM volumes?

Yes, but to put / on LVM you need to use initrd.  You also probably want
to force the minor number of <VG>/root to something fixed, since the
kernel isn't mounting by name at that point.

I built an initrd with busybox, LVM, megaraid and bash.  Great for
diagnosing problems.

(Recent LILO has a bug with device-mapper.  Either downgrade or upgrade
to the latest, or follow the debian bugtracking on it)

--Dan
