From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] quick pvresize question
Message-Id: <20020419151617.B25208@sistina.com>
References: <20020417222416.GA29978@arohk.troll.no>
    <Pine.LNX.4.44.0204172318010.3143-100000@pzat.meep.org>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0204172318010.3143-100000@pzat.meep.org>;
    from oolon@ankh.org on Wed, Apr 17, 2002 at 11:23:43PM +0000
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
Date: Fri Apr 19 08:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 17, 2002 at 11:23:43PM +0000, James Hawtin wrote:
> On Thu, 18 Apr 2002, Trond Are Haugland wrote:
> 
> > Hello people at Sistina!
> >
> > Is it possible/safe to resize a physical volume to use
> > free space _before_ the start block of the pv?
> >
> > Thank you so much for creating LVM for Linux,
> > it absolutely ROCKS :-)
> > --
> > Trond Are Haugland <trondare@trolltech.com>
> > Trolltech AS
> >
> 
> No, its not, pv cannot be expanded or reduced in size, A dirty hack would
> be to create another PV on the disk, just make sure you speficy pvs when
> you do striping so you don't strip the same drive ;-)

You actually can pvresize.

If you have two partitions you can concatinate (fdisk) and
the first holds a PV, pvresize it to take the additional space.

Or you want to take advantage of the extended space in a RAID subsystems
volume (could be MD or a HW subsystem).

> 
> Its fine for concatinated volumes. If you have a spare disk and a little
> time, create a new pv on your space disk use pvmove to mvoe from your old
> disk to the temp. vgreduce out the old disks pv, repartion the disk then
> create a new pv on it. vgexpand to the (old/new disk) then pvmove your
> data back then vgreduce out your temp disk.
> 
> I have done this a few times :-) make sure you use latest version of lvm
> there are some problems with pvmove before that.
> 
> James
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
