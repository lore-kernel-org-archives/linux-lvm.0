Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4GFqX012588
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 11:52:33 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4GFqRx7008412
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 11:52:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id 038EC9F5B
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 11:52:22 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16209-10 for <linux-lvm@redhat.com>;
	Sun, 16 May 2004 11:52:21 -0400 (EDT)
Received: from localhost (tleilax.poochiereds.net [192.168.1.3])
	by salusa.poochiereds.net (Postfix) with ESMTP id 0608B1580
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 11:52:20 -0400 (EDT)
Subject: Re: [linux-lvm] /boot on lvm?
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <40A77537.20107@mlug.missouri.edu>
References: <40A72846.5050801@mlug.missouri.edu>
	<1084705130.3126.2.camel@localhost> <40A77537.20107@mlug.missouri.edu>
Content-Transfer-Encoding: 7bit
Message-Id: <1084722695.3126.17.camel@localhost>
Mime-Version: 1.0
Date: Sun, 16 May 2004 11:52:17 -0400
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2004-05-16 at 07:05 -0700, Michael wrote:
> I use Lilo. Does Lilo understand LVM volumes?

I think there are some versions that do and some patches, but it's
probably safest to assume that it doesn't. You might also want to
consider making the switch to GRUB -- it's more forgiving of mistakes
than LILO is.

<shameless plug>

If you're just getting started, you might want to have a look at the
article I recently wrote for SysAdmin Mag on Linux root disk mirroring.
It covers using MD and LVM to set up mirrored rootdisks. 

It was in the April issue of sysadmin mag...

http://samag.com/articles/2004/0404/

</shameless plug>

The article covers LVM1, but doing this with LVM2 is pretty similar. If
you're doing this with LVM2, you'll probably also need the
lvm2create_initrd script so you can create an initrd image:

http://poochiereds.net/svn/lvm2

It's not complete yet (which is why it's not in the official tarball),
but works fairly well with most configurations.

-- 
Jeff Layton <jtlayton@poochiereds.net>
