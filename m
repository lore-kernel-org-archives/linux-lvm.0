Return-Path: <gobo@gimle.nu>
Message-ID: <20010206233006.2854.qmail@fraggle.cs.uit.no>
From: gobo@gimle.nu
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot. 
In-Reply-To: Your message of "Tue, 06 Feb 2001 14:39:02 CST."
             <20010206143902.C5041@sistina.com> 
Mime-Version: 1.0
Date: Wed, 07 Feb 2001 00:30:06 +0100
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

> On Tue, Feb 06, 2001 at 06:09:15PM -0200, Rik van Riel wrote:
> > On Tue, 6 Feb 2001, AJ Lewis wrote:
> > > The problem with your bug report on Bugzilla is that it is
> > > confusing.  You added to a bug that complained about vgscan
> > > seg-faulting.  That bug is obviously fixed.=20
> > It still segfaults ... ;)
> 
> Oh, sorry.  That was not obvious from your vgscan -d dump.  Frank didn't say
> anything about a segfault either.

No, I don't get segfaults. Although it is vg_read_with_pv_and_lv() that 
fails. After I tried using vgcfgrestore it doesn't find any VGs at all.

> > It's still vg_read_with_pv_and_le() that's spitting out
> > errors and causing vgscan to segfault. The error I am
> > seeing here hasn't changed in the last month...
> 
> Hmm...This appears to be different from the bug posted with the subject
> "0.9.1 vgscan doesn't detect upgraded vg's" today.  Can you confirm this?

Well. In my case the VG in question was extended a little while back. 
Possibly between the last reboot and this one. But it was originally 
built with the 0.9.0 tools and stock 2.4.0 kernel.

BTW: Should the LVM be switched of somehow before reboot of the computer?

FrankRL
-- 
                                  I don't suffer from insanity.
                                    I enjoy every minute of it.
gobo@gimle.nu
