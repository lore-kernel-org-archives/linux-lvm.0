Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A6433C5@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Mounting LVM volume with set UID and GID? (REPOST
	 )
Date: Fri, 13 Jul 2001 09:49:18 -0500
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

As a matter of fact, anything that is XFS can't mount with those options. I
will investigate over on that list. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Gonyou, Austin [mailto:austin@coremetrics.com]
> Sent: Friday, July 13, 2001 9:37 AM
> To: 'linux-lvm@sistina.com'
> Subject: RE: [linux-lvm] Mounting LVM volume with set UID and GID?
> (REPOST )
> 
> 
> On other filesystems Yes. I will re-verify though just for a 
> sanity check. 
> 
> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com 
> 
> > -----Original Message-----
> > From: Joe Thornber [mailto:thornber@btconnect.com]
> > Sent: Friday, July 13, 2001 3:42 AM
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] Mounting LVM volume with set UID and GID?
> > (REPOST )
> > 
> > 
> > On Thu, Jul 12, 2001 at 02:20:37PM -0500, Gonyou, Austin wrote:
> > > To clarify this, When I try mounting with the options 
> > uid=xxx,gid=xxx,rw
> > > I cannot mount the volume. I get a mount error. Nothing out 
> > of the ordinary,
> > > just that it can't "read supberblock", but if I mount it 
> > without those
> > > options, it's just fine. 
> > 
> > Does uid=xxx, gid=xx work without LVM ?
> > 
> > - Joe
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
