Date: Wed, 23 Feb 2000 06:36:20 +0100 (CET)
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: [patch] block device stacking support, raid-2.3.47-B6
In-Reply-To: <Pine.LNX.4.21.0002231040410.18094-200000@devserv.devel.redhat.com>
Message-ID: <Pine.LNX.4.21.0002230629380.522-100000@alpha.random>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>
Cc: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>, Linus Torvalds <torvalds@transmeta.com>, linux-kernel@vger.rutgers.edu, linux-lvm@msede.com, linux-raid@vger.rutgers.edu

On Wed, 23 Feb 2000, Ingo Molnar wrote:

>- renaming ->make_request_fn() to ->logical_volume_fn is both misleading
>  and unnecessery.

Note that with my proposal it was make_request_fn to be misleading because
all the code run within the callback had anything to do with the
make_request code.

>i've added the good bits (i hope i found all of them) from Andrea's patch
>as well: the end_io() fix in md.c, the ->make_request() change returning
>IO errors, and avoiding an unnecessery get_queue() in the fast path.

Ok.

> - device resolves recursion internally and returns 0 (future RAID0),
>          returns 1 if recursion cannot be resolved internally.

I don't think it worth to handle such case if it costs something for the
other cases. I'll check and test the code on the LVM side soon.

Andrea
