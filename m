Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4GAww026370
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 06:58:58 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4GAwv2W029424
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 06:58:57 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id 84349B0B1
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 06:58:51 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25678-05 for <linux-lvm@redhat.com>;
	Sun, 16 May 2004 06:58:51 -0400 (EDT)
Received: from localhost (tleilax.poochiereds.net [192.168.1.3])
	by salusa.poochiereds.net (Postfix) with ESMTP id 57C62A69E
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 06:58:51 -0400 (EDT)
Subject: Re: [linux-lvm] /boot on lvm?
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <40A72846.5050801@mlug.missouri.edu>
References: <40A72846.5050801@mlug.missouri.edu>
Content-Transfer-Encoding: 7bit
Message-Id: <1084705130.3126.2.camel@localhost>
Mime-Version: 1.0
Date: Sun, 16 May 2004 06:58:50 -0400
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

On Sun, 2004-05-16 at 01:37 -0700, Michael wrote:

> Is it okay to put everything, including /boot and other critical Linux 
> files on an LVM drive? How about swap space?

I run everything on LVM except for /boot, primarily because I use GRUB
as a bootloader and it doesn't understand LVM volumes. As long as your
bootloader understands LVM volumes there should be no problem with it.
-- 
Jeff Layton <jtlayton@poochiereds.net>
