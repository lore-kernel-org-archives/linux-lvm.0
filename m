Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Fri, 19 Jan 2001 18:17:35 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Patch for Kernel 2.2.16
Message-ID: <20010119181735.B14771@srv.sistina.com>
References: <615A249B783CD41192F400D0B747AC8601A001EB@hesse.bbn.hp.com> <20010119101757.K23203@sistina.com> <20010119104932.L23203@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010119104932.L23203@sistina.com>; from lewis@sistina.com on Fri, Jan 19, 2001 at 10:49:32AM -0600
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

On Fri, Jan 19, 2001 at 10:49:32AM -0600, AJ Lewis wrote:
> On Fri, Jan 19, 2001 at 10:17:57AM -0600, AJ Lewis wrote:
> > On Fri, Jan 19, 2001 at 04:19:54PM +0100, ZECHA,HOLGER (HP-Germany,ex1) wrote:
> > > is there a lvm patch for kernel 2.2.16 available ?
> > 
> > By following the instructions in the PATCHES/README file for 0.9.1 Beta2, I
> > was able to generate a patch that appears to work for 2.2.16.  I copied the
> > fragments-2.2.18 file to fragments-2.2.16 and ran 'make' in the PATCHES
> > directory.  This created a file called lvm-0.9.1_beta2-2.2.16.patch.
> > 
> > I grabbed the 2.2.16 rawio patch from the 0.8.1 release of LVM.  (You can
> > get this from the LVM ftp site at
> > ftp://ftp.sistina.com/LVM/0.8.1/PATCHES/linux-2.2.16-rawio.patch)  I applied
> > this rawio patch and the generated lvm patch to the clean 2.2.16 kernel,
> > configured, and built the kernel.  After installing the kernel and rebooting
> > the machine, I was able to see the volume group i had created with a 2.2.18
> > kernel and LVM 0.9.1 Beta2.  I mounted a logical volume from the volume
> > group, and was able to use it.  
> > 
> > That is the extent of the testing I have done, so if you are worried about
> > your data, don't do this!  Or at least backup your data before trying it.
> > Good luck.
> > 
> 
> After testing a bit more, I have found a bug in the snapshot creation.
> Under load, you can get a 
> 'kernel panic: brw_kiovec: iobuf not locked for I/O'

I think Andrea Arcangeli's patch set the previously introduced

iobuf->locked = 1; 

to 0 again.
Change it to 1 and test.
This should fix it.

> 
> Joe, is this the same as the problem you discussed in the 
> "[linux-lvm] Kernel panic while snapshotting."
> thread?
> 
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-379-3951
> 1313 5th St SE, Suite 111              Fax:    612-379-3952
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
> 
> -----Begin Obligatory Humorous Quote----------------------------------------
> Linux: Because rebooting is for adding new hardware.
> -----End Obligatory Humorous Quote------------------------------------------



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
