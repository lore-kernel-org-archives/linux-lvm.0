Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 10:43:03 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM Snapshots & journal recovery
Message-ID: <20010528104303.C26710@sistina.com>
References: <20010523090805.A540@66bassett.freeserve.co.uk> <Pine.LNX.4.33.0105230843210.3381-100000@lustre.us.mvd>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0105230843210.3381-100000@lustre.us.mvd>; from braam@mountainviewdata.com on Wed, May 23, 2001 at 08:48:42AM -0600
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

On Wed, May 23, 2001 at 08:48:42AM -0600, Peter J. Braam wrote:
> 
> Joe,
> 
> Thanks for explaining this.
> 
> That's still not good enough, but better: you must also wait for the
> redirection table to be stable on disk before you can overwrite the origin
> device.
> 
> So journal recovery can indeed work if LVM snapshots wait twice:
> 
>  - first for the copied disk to become stable on disk
>  - then for the redirection to become stable on disk
> 
> at that point one can safely over-write the origin.
> 
> First, looking at the code, I don't think that this is happening at all.

Well, it does.

> Second, to have these two extra waits seems really quite a bad penalty to
> me.

Sure it is if you just argue from that standpoint.

OTOH it is a clean approach to have the snapshot data and metadata consistent
*before* any update to the original data takes place at all.

The design of the LVM so far was going after insuring eactly that in order
to ensure data integrity for *any* user of such LVM blockdevices and not just
journaling filesystems.

But BTW: asynchronous snapshot writes are already on our post 1.0
         schedule anyway (likely choosable) :-)

Regards,
Heinz    -- The LVM Guy --

> 
> - Peter -
> 
> 
> On Wed, 23 May 2001, Joe Thornber wrote:
> 
> > On Tue, May 22, 2001 at 03:32:19PM -0600, Peter J. Braam wrote:
> > <snip>
> > >
> > > But during recovery, LVM cannot possibly know if the whole process of
> > > copying out the data from the current to the snapshot area completed
> > > during the previous run. Yes, LVM updates the redirection table first and
> > > then copies, but, still, you don't know _where exactly_ the writes stopped
> > > happening and in particular you don't know if the block was copied already
> > > or not.
> > >
> >
> > The snapshot metadata (redirection table) is written *after* the copy.
> > Data will not hit the origin device until after the copy on write has
> > completed successfully.
> >
> > - Joe
> >
> 
> -- 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
