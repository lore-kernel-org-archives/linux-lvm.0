From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM reimplementationre
    ady for beta testing
Message-Id: <20020201102439.B15135@sistina.com>
References: <OFBCE93B66.F7B9C14E-ON85256B52.006B8AB3@raleigh.ibm.com>
    <3C59A3A4.71A869A8@bellsouth.net>
MIME-Version: 1.0
In-Reply-To: <3C59A3A4.71A869A8@bellsouth.net>; from
    laytonjb@bellsouth.net on Thu, Jan 31, 2002 at 03:05:56PM -0500
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
Date: Fri Feb  1 03:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 31, 2002 at 03:05:56PM -0500, Jeff Layton wrote:
> (snip)
> 
> >
> > >LVM2 may not seem that exciting initially, since the first release is
> > >just concentrating on reproducing LVM1 functionality.  But a lot of
> > >the reason for this rewrite is to enable us to add in the new features
> > >that we want (such as a transaction based disk format).  It's on this
> > >new feature list that we'll be mainly competing with EVMS.
> >
> > Why compete, come on over and help us :-)
> 
> You guy man!
> 
> I've worked with Kevin a few months ago on using EVMS
> to recover a filesystem ontop of LVM when a disk went
> south and we had no backups

It is quite intersting how many people don't take backups even though
almost everybody claims to know that backups are crucial and some of them
know that they are still, even though they might have RAID in place.

Well I guess it, but you didn't mention if you had success to recover.

Was it quorum (we are implementing it with LVM2 BTW) which helped and have
you been lucky that at least a part of your LVs where sitting on other than the
gone disk? Otherwise you probably had your VG back but no usable data.

> (I know, but I was told by the
> people in charge that backups were not needed - that's why
> I left).

Probably a good choice to leave if they don't understand such basics
and you couldn't convince them.


> I really like EVMS and can't wait for it to be in 2.5 and
> then 2.6 (just keep up the patches for 2.4 please :)

EVMS hallelujah on linux-lvm? ;-)

> 
> Jeff Layton
> 
> 
> >
> >
> > Steve
> >
> > EVMS Development - http://www.sf.net/projects/evms
> > Linux Technology Center - IBM Corporation
> > (512) 838-9763  EMAIL: SLPratt@US.IBM.COM
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
