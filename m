Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A64352A@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
Date: Thu, 26 Jul 2001 14:28:53 -0500
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This would make some sense since I just blew my fs away and recreated them.
Then they mounted fine. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Joe Thornber [mailto:thornber@btconnect.com]
> Sent: Thursday, July 26, 2001 7:43 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
> 
> 
> On Thu, Jul 26, 2001 at 08:16:33AM -0400, Dave Alden wrote:
> > Hi,
> > 
> >   Are you aware that the XFS folks modified LVM to work 
> with XFS (something
> > about a new ioctl or such)?  They state that if you install 
> the latest
> > patches, you'll back out the XFS-specific changes which can 
> cause you to
> > lose your XFS filesystem.  For more info, see the thread 
> with a subject
> > of "When LVM-0.9.1beta7 will be merged to XFS cvs tree?" from:
> > 
> > http://oss.sgi.com/projects/xfs/mail_archive/0107/threads.html#00127
> > 
> > My understanding is that this applies to any LVM patches 
> (including the beta8
> > patches).
> 
> No I wasn't aware of this, though Patrick may be since he uses XFS.
> 
> from http://oss.sgi.com/projects/xfs/mail_archive/0107/msg00132.html:
> 
> > All block devices in a XFS kernel need a special patch to 
> add an ioctl
> > to set the logical block size. The original poster probably 
> didn't add
> > that ioctl to his new hacked in LVM; which will cause all kinds of 
> > problems with xfs user tools and also probably file system 
> corruption.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
