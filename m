From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] More information on my LV with bad read performance..
Message-ID: <20011026101055.A32377@sistina.com>
References: <Pine.LNX.4.33.0110260000350.23688-100000@ping.us.dell.com> <20011026010656.H23590@turbolinux.com>
Mime-Version: 1.0
In-Reply-To: <20011026010656.H23590@turbolinux.com>; from adilger@turbolabs.com on Fri, Oct 26, 2001 at 01:06:56AM -0600
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
Date: Fri Oct 26 03:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 26, 2001 at 01:06:56AM -0600, Andreas Dilger wrote:
> On Oct 26, 2001  00:03 -0500, Robert Macaulay wrote:
> > I realized I didn't include a lvdisplay -v of my volume. Here it is.
> > The disks are spread out over 4 scsi busses. 
> > 
> > --- Logical volume ---
> > LV Name                /dev/vgOracle/foo
> > VG Name                vgOracle
> > LV Write Access        read/write
> > LV Status              available
> > LV #                   52
> > # open                 0
> > LV Size                9.04 GB
> > Current LE             2314
> > Allocated LE           2314
> > Stripes                26
> > Stripe size (KByte)    64
> > Allocation             next free
> > Read ahead sectors     120
> > Block device           58:51
> 
> Well, there was a patch in 2.4.13 to the LVM code to change the readahead
> code.

Andreas,
to what patch are your reffering to.
Still see the per major read_ahead code in 2.4.13 which is partially
usefull in the best case.

Heinz

> First off, it makes the default readahead 1024 sectors (512kB)
> which may be the maximum SCSI request size (don't know the details
> exactly).  It also sets a global read_ahead array, so this may impact
> it also.  See above, you have a "read ahead" that is smaller than a
> single stripe, so it isn't really doing you much good.
> 
> However, it is also possible that striping across 26 disks is kind of
> pointless, especially for Oracle.  You are far better off to do some
> intelligent allocation of the disks depending on known usage patterns
> (e.g. put tables and their indexes on separate disks, put rollback
> files on separate disks, put heavily used tables on their own disks,
> put temporary tablespaces on their own disks).
> 
> With LVM, you can easily monitor which PVs/PEs are busiest, and even out
> the I/O load by moving LVs/PEs with pvmove (although you CANNOT do this
> while the database is active).
> 
> Make sure you keep backups of your LVM metadata (both vgcfgbackup, and
> also save the text output of "pvdata -avP" and "lvdisplay -v").
> 
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> 
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
