Return-Path: <root@srv.sistina.com>
Date: Mon, 30 Apr 2001 15:58:27 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Message-ID: <20010430155827.B19810@sistina.com>
Mime-Version: 1.0
Subject: [linux-lvm] Re: [lvm-devel] 1.2 directory heirarchy
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

On Fri, Apr 27, 2001 at 04:34:43PM -0600, Andreas Dilger wrote:
> Heinz writes:
> > On Thu, Apr 26, 2001 at 01:15:23PM +0100, Joe Thornber wrote:
> > > Common code will be used for the metadata io in the kernel and
> > > userland tools.  I can't think of any other common code.
> > 
> > That's the one I was talking about.
> > 
> > But actually we need to make use of other parts of the library as well like
> > 
> >  - code which sets up structure hierarchies before/after VGDA io
> > 
> >  - consistency checking code
> 
> If I could vent on an LVM pet peeve here...  When we re-organize the structure
> of the LVM code, can we ensure that data is verified exactly _once_?

Sure, this is a resonable recommendation at first glance ;-)

> Any
> data coming from the disk should be checked,

Yep.


> and any data coming from the
> user should be checked.

Ok.

> In between, we should assume that it is correct
> otherwise madness will quickly follow.

It depends on your definition of madness :-)

> 
> This will also ensure we have good interface abstraction (i.e. routines that
> read data from disk (with checks), user-interface routines (with checks), and
> intermediate routines (without checks)).

For everybodies information:
the reason why Andreas recommends things like this is IMO, that LVM already
has plenty of check functions which are called in multiple layers of
the sofatware (like in the tools and in the library itself).

For eg. the tool layer which has the need to check the name of a PV
handed in on the command line, calls pv_check_name() in order to display an
error message in case of a crappy name and exits.

If that PV name is passed into a library routine it will be checked again
using pv_check_name() because the function takes care that it gets called
with reasonable parameters.

IMO this doesn't imply bad interface abstraction at all.
It just addresses different needs of different levels in the LVM software
*but* has the tradeof of calling the same check functions multiple times.

This might be seen as an overhead but we should pay it because the
LVM library is in principle designed to be used by different CLIs or GUIs.
In this regard the checks need to stay in place in order to recognize bad
actual arguments and to return an error code then.


> 
> Cheers, Andreas
> -- 
> Andreas Dilger                               TurboLabs filesystem development
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> _______________________________________________
> lvm-devel mailing list
> lvm-devel@sistina.com
> http://lists.sistina.com/mailman/listinfo/lvm-devel

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
