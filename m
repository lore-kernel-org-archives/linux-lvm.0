Return-Path: <root@srv.sistina.com>
Date: Tue, 22 May 2001 12:33:26 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: LVM writeable snapshot patch for use with XFS
Message-ID: <20010522123326.C15681@sistina.com>
References: <Steph@connex.com> <200105220105.f4M15Oj06924@jen.americas.sgi.com>
Mime-Version: 1.0
In-Reply-To: <200105220105.f4M15Oj06924@jen.americas.sgi.com>; from lord@sgi.com on Mon, May 21, 2001 at 08:05:24PM -0500
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

Steve,

thanks for updating on this.

As I mentioned when you offered the code it will show up in post 1.0 Linux LVM.

Can we get in touch to sort it out of XFS once it is in post LVM 1.0?

Regards,
Heinz    -- The LVM Guy --


On Mon, May 21, 2001 at 08:05:24PM -0500, Steve Lord wrote:
> 
> I should add that all the code I posted as a patch last week for freezing
> XFS for snapshotting is now incorporated into the XFS development tree.
> 
> One reason for Dale doing this is that an XFS filesystem contains a uuid
> (in several places) which is checked by mount and compared against the
> uuid of all mounted xfs filesystems on a machine. Duplicate uuids are
> not allowed - this is for preventing two mounts of the same filesystem
> via alternate hardware paths. The only way to fix this on linux is to
> use an admin command to change the uuid of the snapshot.
> 
> Steve
> 
> > Here is a replacement for the writeable snapshot patch I posted earlier to
> > these lists.  Its intended use is for changing the UUID on an XFS snapshot
> > so the snapshot can be mounted at the same time as the original.  This patch
> > is for beta 7 (the one I posted last week was beta 3) and doesn't have a bug
> > the earlier patch did.
> > 
> > A patch for lvchange follows the lvm.c patch, as snapshots are still created
> > read-only and must be changed to writable through lvchange.  This patch is
> > against an older version, but still cleanly applies to beta7 for me.
> > 
> > Dale J. Stephenson
> > Software Engineer
> > Connex, A Western Digital Company
> > steph@connex.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
