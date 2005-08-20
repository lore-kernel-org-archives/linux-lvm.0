Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7K7MJV26302
	for <linux-lvm@redhat.com>; Sat, 20 Aug 2005 03:22:19 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.200])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7K7MGtN004170
	for <linux-lvm@redhat.com>; Sat, 20 Aug 2005 03:22:16 -0400
Received: by wproxy.gmail.com with SMTP id i12so929078wra
	for <linux-lvm@redhat.com>; Sat, 20 Aug 2005 00:22:11 -0700 (PDT)
Message-ID: <fa61edfd0508200022235af787@mail.gmail.com>
Date: Sat, 20 Aug 2005 17:22:11 +1000
From: Chris Jensen <cjensen@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Saving files from full failing volume
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

Hi,
I've just had a disk die, and when I replace it I'm thinking of
setting up LVM, however I'm wondering how the same scenario would pan
out under LVM:

The disk was 160GB and completely full. On thursday the disk reported
a smart error, so I started transferring data off the disk, but seeing
as how I didn't have another 160GB handy, I had to simply copy
directory by directory to vairous bits of scattered space that I was
able to find, starting with the most important data. (the disk then
completely died after getting about half the data off :-( )

If this disk had been setup with LVM, the filesystem on it would've
spanned that disk and an 80G disk (also close to full). Under LVM
would it have been possible to determine which files were being stored
on the 160G so I could use filesystem tools to move them off before
shrinking the volume and moving it entirely to the 80G disk?

(I've read up about LVM and understand I can replace failed
blocks/disks with /dev/zero, so the shrinking and moving part doesn't
worry me to much, it's just the identifying of where files live that
I'm curious about.)

Thanks for any responses
Chris
