Return-Path: <root@srv.sistina.com>
Date: Thu, 26 Apr 2001 10:06:03 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] badblocks handling with LVM
Message-ID: <20010426100603.A9820@sistina.com>
References: <200104231008.f3NA8Gkx001134@webber.adilger.int> <01042519594802.31687@lyta>
Mime-Version: 1.0
In-Reply-To: <01042519594802.31687@lyta>; from russell@coker.com.au on Wed, Apr 25, 2001 at 07:59:48PM +0200
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

On Wed, Apr 25, 2001 at 07:59:48PM +0200, Russell Coker wrote:
> On Monday 23 April 2001 12:08, Andreas Dilger wrote:
> > Laurent writes:
> > > I have blocks marked bad on a ext2 filesystem.  The device has bad
> > > blocks. I'm wondering how bad blocks are handled with lvm.  I would like
> > > to create a phycal volume on this device and use reiserfs on it.
> > > Could you give me some informations ?
> >
> > As long as the bad blocks are not in the first ~250kB of the partition/disk
> > then LVM doesn't care about it.  However, reiserfs doesn't yet support bad
> > blocks in the filesystem (this is currently under development AFAIK), so
> > this will not help you.
> 
> The problem is that when you move LV's around and make snapshots the bad 
> blocks on the underlieing media will move.  Therefore I think that management 
> of bad blocks possibly should be done in the LVM.
> 
> Or should we just assume that LVM runs over RAID arrays of ATA/SCSI disks 
> that have sector-sparing so that bad blocks are not an issue?

That's what I recommend because disks typically "hide" bad sectors to a certain
degree using bad block relocation et al.
If the given disk capacity for this is not enough because too many bad blocks
occured already then you are in serious trouble and need to repleace
your disk (subsystem) anyway IMO.

> 
> -- 
> http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
> http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
> http://www.coker.com.au/projects.html Projects I am working on
> http://www.coker.com.au/~russell/     My home page
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
