Return-Path: <root@srv.sistina.com>
Date: Fri, 22 Jun 2001 16:25:01 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010622162501.A4720@sistina.com>
References: <134718885.992837796416.JavaMail.root@boots> <20010618123318.A31606@tiger.bigcats.invalid> <20010621094645.A300@gambit> <20010622025926.B3938@tiger.bigcats.invalid> <20010622104921.C365@gambit>
Mime-Version: 1.0
In-Reply-To: <20010622104921.C365@gambit>; from thornber@btconnect.com on Fri, Jun 22, 2001 at 10:49:21AM +0100
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

On Fri, Jun 22, 2001 at 10:49:21AM +0100, Joe Thornber wrote:
> On Fri, Jun 22, 2001 at 02:59:26AM +0200, Wolfgang Weisselberg wrote:
> > man pvmove:
> > [...]
> >        You  can  move  physical  extents in use but make sure you
> >        have an current backup in case of  a  system  crash  while
> >        moving!!!
> > 
> > Now, this does *not* look like *crashproof*, does it?
> > This is from the CVS, btw, dated 2001-06-10.
> 
> Heinz,
> 
> Do we update the metadata after each individual extent is moved ?  Or
> at the end of the whole pvmove ?

1st case.

Metadata is updated after every single moved extent.
The only reason why the man page says the above is the non atomic nature
of the metadata updates (2 block devices need to be updated; source and
destination) in case of the version 1 metadata layout.

With v2 (transaction oriented updates) we should be fine and can remove
the above warning.

> 
> I'd assumed we were doing the former, in which case this comment from
> the man page is unduly pesimistic.

Yes, it is somehow pesimistic but disks can break, power can be
interupted or a million other things can happen which let the source device
metadata update make it but *not* the destination device update.

We could eventually recover from that situation by updating the destination
before the source and checking double entries for the same logical extent
on the source and destination device at VG activation time in order to remove
one of the two entries.

Heinz

> 
> - Joe
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
