From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] moving single LVM disk from one system to another
Message-ID: <20020819141653.A25189@sistina.com>
References: <20020817070901.GA5022@linux.interlinx.bc.ca> <20020819102427.A24314@sistina.com> <20020819090226.GA13367@linux.interlinx.bc.ca> <20020819100456.GB13367@linux.interlinx.bc.ca> <20020819122400.GB2237@pc.ilinx>
Mime-Version: 1.0
In-Reply-To: <20020819122400.GB2237@pc.ilinx>; from lvm@interlinx.bc.ca on Mon, Aug 19, 2002 at 08:24:00AM -0400
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
Date: Mon Aug 19 07:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 19, 2002 at 08:24:00AM -0400, lvm@interlinx.bc.ca wrote:
> It's embarassing but I will come clean...
> 
> On Mon, Aug 19, 2002 at 06:04:57AM -0400, lvm@interlinx.bc.ca wrote:
> > 
> > there are no device nodes under
> > /dev/ide/host0/bus[01]/target0/.  Strange.
> 
> Not so strange once I looked more closely.  To try to soften the
> embarassment, let me explain.  I am moving a disk from one motherboard
> to another.  The board the disk was created on had two pairs (primary
> and secondary times two) of IDE ports.  Regular, ol' IDE on ports
> on hda-hdd and ATA100 on ports hde-hdh.
> 
> Since the disk in question is an ATA 100 disk, I put it on hde to take
> advantage of the faster bus speed.  Not wanting to waste "good" ATA
> 100 ports on silly devices like CD-RW drives I put mine on hda.  And
> of course since it's a writer, added "hda=ide-scsi" to the kernel
> command line.  I think you know where this is going.
> 
> In moving the disk to the new motherboard, it only has a single pair
> of IDE ports (primary and secondary), all ATA100, hda-hdd.  So,
> naturally, I put the disk on hda, which was being masked by the
> hda=ide-scsi kernel parameter.  Thus the empty /dev/ide/.../lun0/
> directory.
> 
> Sorry to bother y'all with such a silly mistake.  :-)

Well, the wonderful world of PC style peripherals :(

> 
> b.
> 
> -- 
> Brian J. Murrell



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
