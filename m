Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105152249.f4FMnP3D022006@webber.adilger.int>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
In-Reply-To: <3B01AF42.C171FE86@home.com> "from Tom Otake at May 15, 2001 05:35:46
 pm"
Date: Tue, 15 May 2001 16:49:25 -0600 (MDT)
MIME-Version: 1.0
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

Tom Otake writes:
> Yes, I've been able to recreate the second hang scenario, though I have to
> admit it wasn't exactly the same.  I started the copy of the data, created a
> new LV, which worked.  I ran mkreiserfs on the new LV, it worked.  I removed
> the new LV, also worked, then ran pvscan.  That's when the system hung.  All
> the while, the copy from CD to disk was going on.

It may be that this is related to the ext3 problem that is ongoing.
Basically, if pvscan or vgscan (PV_FLUSH ioctl calling invalidate_buffers)
is run it causes buffers to go into an invalid state for the journal
code, and this breaks the journaling.  On ext3, there are assertions in
the code which detect the invalid state and case an oops (stack trace),
but this may not be the case with reiserfs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
