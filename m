Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106191727.f5JHRB87013198@webber.adilger.int>
Subject: Re: [linux-lvm] LVM problems
In-Reply-To: <200106191212.f5JCC3j06725@mailgate4.cinetic.de>
 "from Tobias Hahn at Jun 19, 2001 02:12:03 pm"
Date: Tue, 19 Jun 2001 11:27:11 -0600 (MDT)
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
Cc: linux-LVM-Bug@sistina.com, linux-LVM@sistina.com

Tobias Hahn writes:
> I have serious trouble trying to get LVM to work again since I upgraded
> my lvm-tools to 0.9beta6. I cannot access my vg (and needless to say,
> almost all of my system is on that vg :-( ). The problem is that the
> kernel complains about an unsupported ioctl. I looked up this problem in
> lvm-related mailinglists and figured out that this is a version mismatch
> between kernel lvm and user lvm.

But this message is only a warning, and not a real source of problems.
If you are having problems, it is from something else.  If you were using
the beta2 tools or earlier, there is a chance your VGDA is slightly broken
(UUID problems).  Please search the mailing list about this for instructions
on how to fix.

> At that point I was using kernel
> 2.4.3. According to the mailing list, the problem should be fixed in
> kernel 2.4.4. However, kernel 2.4.5 (downloaded from ftp.kernel.org) still
> contains 0.9beta2.

There are some LVM fixes in the -ac kernel patch, but none in the Linus
tree yet (sigh).

> So I downloaded the lvm-source from ftp.sistina.com
> (both beta6 and beta7) and tried to patch kernel 2.4.5 following the
> instructions in PATCHES/README. The patched kernel, however, does not
> link any longer.

> drivers/md/mddev.o(.text+0x7e01): undefined reference to `get_hardblocksize'
> drivers/md/mddev.o(.text+0x7e3d): undefined reference to `get_hardblocksize'

I could have sworn this problem was fixed already, but maybe only in CVS?
Time for a new patch release I guess.  As someone else already mentioned,
simply change get_hardblocksize to get_hardsect_size() in lvm.c.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
