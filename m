From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Accessing LVM partitions from a rescue system
Message-ID: <20021125113323.A24431@sistina.com>
References: <200211242207.33235.pantaleimon@home.no> <4117008562.20021125013930@tnonline.net>
Mime-Version: 1.0
In-Reply-To: <4117008562.20021125013930@tnonline.net>; from andewid@tnonline.net on Mon, Nov 25, 2002 at 01:39:30AM +0100
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
Date: Mon Nov 25 04:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 25, 2002 at 01:39:30AM +0100, Anders Widman wrote:
> Looks  like  something  is wrong with accessing all of your disks from
> the rescue floppy.. look at the pvscan:
> 
> >From rescue environment:
>    pvscan -- total: 20 [201.08 GB}
> 
> Normal boot:
>    pvscan -- total: 21 [211.14 GB]
> 
> You  need  to  sort  out what disks/partitions that are not accessible
> from  the  rescue  disks...  You can also try ungrading LVM as 1.01 is
> quite old...

Yes, that will solve it. You are running a quote old release candidate
of LVM still.
1.0.1-rc2 failed on IDE partitions larger than 15.
BTW: 1.0.1 had support for 64 partitions on IDE in.

Please take 1.0.6 and retry.

Regards,
Heinz    -- The LVM Guy --

> 
> - Anders
> 
> > Hello
> 
> > I am trying to mount my LVM partitions manually after booting into a
> > rescue system from floppies. I am not able to do this. During a normal
> > boot from my harddisk LVM works just fine. Notice the output from
> > pvscan and lvmdiskscan below. I ran those commands first from the
> > rescue system and then from a normally booted system. In the rescue
> > system /dev/hda16 is not there. I don't know if that is related to my
> > problem, though.
> 
> > Here are the details of what I am doing:
> 
> > Setup:
> 
> > boot partition      /dev/hda2 type Linux with Ext2
<SNIP>
> > lvmdiskscan -- 28 partitions
> > lvmdiskscan -- 20 LVM physical volume partitions
> 
> 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
