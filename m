From: galt <galt@fiberpimp.net>
Message-ID: <20020923102557.B74653-100000@true.fiberpimp.net>
MIME-Version: 1.0
Subject: [linux-lvm] raid1+lvm
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
Date: Mon Sep 23 09:41:42 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

perhaps I'm missing something.

Luca,
So it is or is not possible to boot a root filesystem thats inside an lvm
without a separate /boot that is either raid1 or normal? From what you
said I'd like to interpret it as you need a initrd inside the root lv...is
that the case?  If so, could I see the root= and boot= lines from your
lilo.conf? (Assuming you have this configuration)

William Blunn,
my reasoning behind wanting root in lvm is not to expand it.  I want the
raid1 for data integrity, and I would like to avoid having more than one
raid1 set on the same disks...I figure theres more overhead and there
would be more io contention than necessary (assuming that what I'm asking
for is possible). So, in a perfect world, I would have my two disks
mirrored with raid1 and then my root,swap, and whatever else I want as lv's
inside that raid1. I mean, yes it is possible to have a bunch of raid1's
on the same disks, and yes the io contention probably isnt an issue, but
what I'm trying to do seems like the most elegant solution to me at this time.

galt
