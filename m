Return-Path: <totake66@home.com>
Message-ID: <3B005823.33AEE05D@home.com>
Date: Mon, 14 May 2001 17:11:47 -0500
From: Tom Otake <totake66@home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm deadlock with 2.4.x kernel?
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
To: linux-lvm@sistina.com

I'm not sure if this has been brought up yet.  Over the weekend, my
Linux hung up on me twice.  Considering that this never happened before
and only two things have recently changed (LVM and ReiserFS) , I did
some reading and came across the bug report for LVM on sistina's website
about LVM deadlocking Linux.

I'm running kernle 2.4.3 with LVM compiled into the kernel.  LVM is
0.9.1_beta7, reiser is 3.x.0j.  All essential fs (/, /usr, /var, /tmp)
are still using ext2 and linux partitions, non essential fs (/home
amongst others) are all on  reiserfs with LVM, excluding /usr/local,
which is still on ext2 and Linux partition.

The first occurance:
Running vmware (not on lvm/reiser) while browsing the web using netscape
and running seti@home.  The system hung on me when I tried to access a
web page that appeared to be task intensive, wether servlets,
javascript, flash, or something else, I don't know.

The second occurance:
I was copying a large amount of data from a CDROM to my home dir (on
lvm).  While the copy was in progress, I created a new LV.  This
worked.  The system hung when I ran mkreiserfs on the new LV.

All hdisks and CD are SCSI, no IDE at all.

As I said, I'm not sure if the system hang was caused by the deadlock,
since the system was dead.  If this is related to the deadlock issue,
are there any possible workarounds, besides being mindful of the system
load?

Thanks

--
_______________
Intolerance is the last defense of the insecure.

-- Tom Otake
-- totake66@home.com
-- #550
