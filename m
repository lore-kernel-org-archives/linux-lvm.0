Message-Id: <200109161956.PAA11662@erez.physics.lsa.umich.edu>
From: David Chin <dwchin@umich.edu>
In-reply-to: <200109161731.NAA11318@erez.physics.lsa.umich.edu> 
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <200109160207.WAA10835@erez.physics.lsa.umich.edu> <20010916025223.1CA035E041@oscar.casa.dyndns.org> <200109161731.NAA11318@erez.physics.lsa.umich.edu>
Mime-Version: 1.0
Date: Sun, 16 Sep 2001 15:56:15 -0400
Subject: [linux-lvm] Re: lvcreate dumping core with 2.4.10-pre9 (was pvcreate ...)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I just tried recompiled my kernel, and got the SCSI module loaded OK, so I have 
my tape drive.

With this new kernel, I again tried what I did in my first message.  No dice: 
lvcreate dumps core.  Then, I deleted partitions on the disk and used ext2 
primary partition instead of reiserfs.  Again, lvcreate dumps core.

I've given up on LVM for now since the machine I'm playing with is in dire need.

--Dave
