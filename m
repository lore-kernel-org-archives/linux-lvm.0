From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove errors
Message-ID: <20030425165706.A17496@sistina.com>
References: <20030425113525.C16006@sistina.com> <GNEAKGKKMNLLGBACDNBJAEDFCGAA.carey@itfreedom.com>
Mime-Version: 1.0
In-Reply-To: <GNEAKGKKMNLLGBACDNBJAEDFCGAA.carey@itfreedom.com>; from carey@itfreedom.com on Fri, Apr 25, 2003 at 08:14:50AM -0500
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
Date: Fri Apr 25 10:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Apr 25, 2003 at 08:14:50AM -0500, Carey Jung wrote:
> >
> > Carey,
> >
> > which LVM/kernel versions are you using ?
> > The error tells that the change for the mapping in the LVM driver fails.
> 
> The latest RH rpm and smp kernel:
> 
> # rpm -qa|grep lvm
> lvm-1.0.3-4
> # cat /proc/version
> Linux version 2.4.18-27.7.xsmp (bhcompile@stripples.devel.redhat.com) (gcc
> version 2.96 20000731 (Red Hat Linux 7.3 2.96-112)) #1 SMP Fri Mar 14
> 05:52:30 EST 2003
> 
> >
> > The mapping on disk (lvdisplay -Dv ...) doesn't get changed in that case.
> > Must be a flaw in the ioctl error return handling, because it obviously
> > got changed in the kernel as "lvdisplay -v " shows.
> 
> That's Greek to me,

:)

The kernel hold the mapping table used at runtime and there's one on the disks
to set it up. The one on disk is unlikely to have changed with the error
you reported.

> but something was seriously messed up with the PE
> allocation or something, because I ended up trashing the LV after I sent
> this message.  I could read the entire partition just fine, so I thought I'd
> copy it to another LV and then delete the original LV.  So I created another
> LV -- in the same VG as the original -- and started a big rsync copy from
> source to destination LV.  Halfway through it, rsync started complaining
> that it couldn't find files that were on the source filesystem when it
> started.  When I snooped in the original LV, a bunch of directories had
> disappeared!  Bear in mind that I was just reading from this filesystem.

Well, _if_ the mapping was bogus that will likely cause overwrites.
No way to redo from start then :(

> 
> My guess is that the PE allocation/mapping to LVs was messed up, so that
> some PEs allocated to the new LV were actually mapped to the original LV, so
> as I started writing to the new one, the system was overwriting files, etc
> in the old LV.  Several directories seemed to have been effectively 'mv'-ed
> to the new LV.
> 
> I then created yet another LV in a separate VG, rsync'ed both of the 1st two
> LVs to it, recovered what was missing from a backup, and then lvremove'd the
> first two.  I'm also in the process of copying all the other LVs in that VG
> to another VG, just because I'm not sure I can trust its integrity.
> 
> By the way, is their some kind of tool one can run to do something analogous
> to 'fsck' for VGs?  Something that will walk through LVs and PEs and make
> sure the VG is internally consistent?

vgck(8)

> 
> Thanks,
> Carey
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
