Return-Path: <thornber@btconnect.com>
Date: Thu, 26 Jul 2001 13:43:10 +0100
Subject: Re: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
Message-ID: <20010726134310.B723@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643517@AUSMAIL> <20010726081633.A11299@math.ohio-state.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010726081633.A11299@math.ohio-state.edu>; from alden@math.ohio-state.edu on Thu, Jul 26, 2001 at 08:16:33AM -0400
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, Jul 26, 2001 at 08:16:33AM -0400, Dave Alden wrote:
> Hi,
> 
>   Are you aware that the XFS folks modified LVM to work with XFS (something
> about a new ioctl or such)?  They state that if you install the latest
> patches, you'll back out the XFS-specific changes which can cause you to
> lose your XFS filesystem.  For more info, see the thread with a subject
> of "When LVM-0.9.1beta7 will be merged to XFS cvs tree?" from:
> 
> http://oss.sgi.com/projects/xfs/mail_archive/0107/threads.html#00127
> 
> My understanding is that this applies to any LVM patches (including the beta8
> patches).

No I wasn't aware of this, though Patrick may be since he uses XFS.

from http://oss.sgi.com/projects/xfs/mail_archive/0107/msg00132.html:

> All block devices in a XFS kernel need a special patch to add an ioctl
> to set the logical block size. The original poster probably didn't add
> that ioctl to his new hacked in LVM; which will cause all kinds of 
> problems with xfs user tools and also probably file system corruption.
