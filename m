Message-ID: <85063BBE668FD411944400D0B744267A888558@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Will LVM stay GPL?
Date: Sat, 8 Sep 2001 14:22:07 -0500 
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

All, 
  LVM is currently part of Linus tree. So, while you are correct on the
branching bit, it may in-fact not be necessary. GFS is NOT already in Linus
tree, so that could lend some foreshadowing. I agree with all of the points
made below though.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Ralph Jennings [mailto:ralph@oro.net]
> Sent: Thursday, September 06, 2001 8:10 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Will LVM stay GPL?
> 
> 
> On Thu, Sep 06, 2001 at 01:55:02PM +0100, Joe Thornber wrote:
> > Mike Declerck has already addressed this issue on the mailing list,
> > but I'll reiterate.  The LVM kernel driver is GPL, the LVM userland
> > tools are GPL.  We have no intention to change this, and even if we
> > wanted to we couldn't since lots of people outside Sistina have
> > contributed.
> > 
> > If it makes people feel happier I will accept patches that add their
> > names to the copyright notices (assuming they've made significant
> > contributions).
> 
> Besides, if they *do* decide to switch the licensing, all we have
> to do is go back one revision and branch a new LVM project from the
> GPL'd code.  So lets wait till that happens, then branch off an
> OpenLVM project from the latest GPL released LVM code.  But untill
> that happens who cares, they can't pull the carpet out from under
> our feet untill they change the license, and untill they decide to
> do that (if they decide to), all work is GPL'd, and they're doing a
> great job of it.
> 
> IANAL of course, but I've been told that you can't make a license
> change from GPL to anything else retroactive?!?!?
> 
>   -Ralph
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
