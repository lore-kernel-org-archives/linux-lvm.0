Return-Path: <gerry@dorfam.ca>
Date: Sun, 8 Jul 2001 09:40:57 -0400 (EDT)
From: <gerry@dorfam.ca>
In-Reply-To: <F2153oryKFRJrzdDW6l00000349@hotmail.com>
Message-ID: <Pine.LNX.4.33.0107080925230.1168-100000@leopard.dorfam.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Redhat 2.4.3-12 Kernel and LVM
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

As a follow up to my other messages about installing LVM I thought I'd
give a status for others...

1. the LVM version in Redhat's 2.4.3-12 kernel is 0.9.1_beta2.  While it
appeared to work using 0.9.1_beta7 tools there was an error message about
an unknown command lvm_chr_ioctl in /var/log/messages.

2. I downloaded the 0.9.1_beta7 tarball and applied the patch as described
in the docs.  It applied without complaint.  It wasn't necessary to apply
the hard block size patch.  The kernel compiled and LVM is working
properly.

3. I also downloaded the stock 2.4.6 kernel and applied the hard block
size patch to LVM and then patched/compiled the kernel.  The kernel
compiled correctly.  However, I experienced intermittent CD-ROM read
errors (mostly failures) on my SCSI CD-ROM.  When mounting the CD an error
message stated that it was unable to determine the data format.  They are
standard Redhat cd's.  I tried others and got the same message.  I have
sent off a Kernel Bug message and went back to 2.4.3-12.


I noticed that the older Redhat 2.4.2-8 kernel also is using 0.9.1_beta2
but I didn't bother trying to upgrade it.  I suspect it would upgrade
without problems too?

Gerry
-- 
"The lyf so short, the craft so long to learne."   Geoffrey Chaucer
