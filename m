Return-Path: <root@srv.sistina.com>
Date: Tue, 22 May 2001 15:41:18 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: LVM writeable snapshot patch for use with XFS
Message-ID: <20010522154118.A16638@sistina.com>
References: <Mauelshagen@sistina.com> <200105221248.f4MCm3c07854@jen.americas.sgi.com>
Mime-Version: 1.0
In-Reply-To: <200105221248.f4MCm3c07854@jen.americas.sgi.com>; from lord@sgi.com on Tue, May 22, 2001 at 07:48:03AM -0500
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

On Tue, May 22, 2001 at 07:48:03AM -0500, Steve Lord wrote:
> > 
> > Steve,
> > 
> > thanks for updating on this.
> > 
> > As I mentioned when you offered the code it will show up in post 1.0 Linux LV
> > M.
> > 
> > Can we get in touch to sort it out of XFS once it is in post LVM 1.0?
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> >
> 
> Hi Heinz, 
> 
> Hmm, there may be a little confusion here. The code I was refering to was
> the code to pause and flush xfs to disk for snapshotting. This has no
> dependencies on lvm, and is in the xfs tree now. The code for making 
> snapshots writeable from Dale Stephenson at Connex is very lvm specific,
> we could provide that as a patch to our tree until you are ready to take
> it. Is this the code you are refering to?

Yes,
that's the one I was refering too.
In case I got your message wrong, don't worry about the issue any longer.
It is queued for LVM > 1.0 anyway.

> There is also the code you
> already provide as a patch to make the write_super_lockfs and unlockfs
> calls - is that remaining in patch form in 1.0?

Yes, unless it is integrated in vanilla then.

> 
> Steve
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
