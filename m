Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r18KIoa0011396
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2013 15:18:50 -0500
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18KInuF023831
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2013 15:18:49 -0500
Received: by mail-ve0-f173.google.com with SMTP id oz10so3701612veb.4
	for <linux-lvm@redhat.com>; Fri, 08 Feb 2013 12:18:49 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 8 Feb 2013 12:18:48 -0800
Message-ID: <CAGvHCLnuhJXDKSRV5Sp5UkwoR9pGnb_9+Jhb1=eQN-=JP_N0eQ@mail.gmail.com>
From: Harold Pimentel <haroldpimentel@gmail.com>
Subject: [linux-lvm] Removing a (potentially unused?) PV from a VG
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

So, I have the following setup:

- Ubuntu 12,04
- 1 6TB physical volume (the one with data) [ext4]
- 1 13TB PV (no data... I think?) [ext4]

Here is the story...

- I created an ext4 on the 13TB PV, added the 13TB to the VG to make a
13TB volume group.
- Everything went fine and then I ran:

Code:

resize2fs /dev/volgroup/volume


And to my surprise.. I couldn't resize past 16TB ! (crap! should have
checked this first!).

So, nothing happened.. Now what I want to do is remove the 13TB PV
from the VG and do something else with it... but I get the following
error:


Code:

sudo vgreduce -t home_volume_group /dev/sdc1
  Test mode: Metadata will NOT be updated.
  Physical volume "/dev/sdc1" still in use

I don't remember the message, but I was going to try to use pvmove to
move stuff off of /dev/sdc1 and it failed stating something like "No
available extents"... which I don't even expect to have anything
written to that disk since nothing was written after the install.

How can I safely remove this PV from the VG?


Thanks a bunch!

Harold
