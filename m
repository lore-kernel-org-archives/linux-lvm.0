Date: Fri, 7 Sep 2001 12:40:59 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with vgreduce
Message-ID: <20010907124059.A31313@sistina.com>
References: <4.0.1.20010906215610.008ab610@mhkserv.mhk.lu.se>
Mime-Version: 1.0
In-Reply-To: <4.0.1.20010906215610.008ab610@mhkserv.mhk.lu.se>; from hast@mhk.lu.se on Thu, Sep 06, 2001 at 10:45:23PM +0200
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

On Thu, Sep 06, 2001 at 10:45:23PM +0200, Marcus Hast wrote:
> Hi all,
> 
> After creating a LV I attempted to extend it with one old drive. This went
> rather well. Unfortunately as I attempted to grow the FS (XFS) it detected
> a bunch of read/write errors and was unable to complete. (If anyone has any
> hints about this I'd be grateful as well.)
> 
> The problem is that I then tried to remove the PV from the VG by the usual
> steps. (Mentioned in older posts.)  However as I try to use vgremove it
> gives me the following error:
> 
> 	vgreduce -- ERROR: can't reduce volume group "lvm1" by used physical
> volume "/dev/hde1"
> 
> If I try to use pvmove to rectify this I instead get this error message:
> 
> 	pvmove -- no logical volumes on empty source physical volume "/dev/hde1"
> 
> If I run lvdisplay I see that under the "Distribution of logical volume..."
> /dev/hde1 is present with 1 in the "PE on PV" collumn. However there is no
> LE written to it according to the "Logical extents" table which follows.
> And according to vgdisplay the PV (/dev/hde1) is unused.
> 
> I do have one other clean disk of the same size, unused, in the same VG.
> However my attempt to replace the error prone one with this clean disk have
> failed. (pvmove quits in the same way.)
> 
> So it's a rather annoying situation. Does anyone have an idea of what to
> try?

Yep, I think so.

Your messy metadata contents seem to be caused by the io errors you metioned.

You should still have a valid metadata backup in /etc/lvmconf/ which contains
your configuration *before* you added hde1.
Please find it using

"for f in /etc/lvmconf/*conf; do vgcfgrestore -ll -f /etc/lvmconf/$f;done"

and restore it to all PVs which where in the VG before hde1 was added.

"vgscan;vgchange -ay" should give you a valid configuration back afterwards.

Please rememer to take backups of your data!

Regards,
Heinz    -- The LVM Guy --



> There isn't anything relevant on the disk to be removed, but the other
> disks in the LV has, so I'd rather not risk corrupting them. (Or at least
> minimize the risk.)
> 
> Thanks,
> 
> 
> Marcus Hast, Lund, Sweden, Earth.
> Living long and prosperous.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
