Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102090005.f1905bc08799@webber.adilger.net>
Subject: Re: [linux-lvm] questions
In-Reply-To: <20010209003003.B29707@vestdata.no> from =?UNKNOWN-8BIT?Q?Ragnar_Kj=F8rstad?=
 at "Feb 9, 2001 00:30:03 am"
Date: Thu, 8 Feb 2001 17:05:36 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ragnar Kj_rstad writes:
> On Thu, Feb 08, 2001 at 03:44:33PM -0700, Andreas Dilger wrote:
> > Yes, even LVM has the 2TB limit at this point.  This is because LVM
> > presents itself to the rest of the kernel as a block device (just like
> > any other), so the kernel 2TB limit for block devices still holds.
> 
> For the volume, but not for the diskgroup, right?

Yes, the 2TB limit is for a single LV.  You can have up to 255 LVs in
total I think, so 512TB total usable space with LVM, assuming your
configuration works in this way.  Probably the 255 LV limit will be
a problem before the 512TB limit is...

> > Heinz talked about allowing LVM to have PAGE_SIZE (4k) blocks (unlike
> > the rest of the kernel, which uses 512 byte blocks) so it may be possible
> > to go up to 16TB with LVM without a huge amount of kernel redesign.
> 
> This sounds really interesting.  What exactly would be needed to do that?

Change all of the code paths in the kernel that assume block size is 512
bytes...

> I believe there have been issues with lvm block sizes and XFS (maybe
> other filesystems too). Would changing it to 4k create new issues?

Yes, probably.

> Would it be possible to increese it even futher? if the filesystem used
> more than 4k blocksize?

Probably not.  There will likely be lots of problems for block size >
PAGE_SIZE.  Of course on ia64 and alpha PAGE_SIZE = 8kB, so you can go
to 32TB I think, assuming the rest of the issues are fixed.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
