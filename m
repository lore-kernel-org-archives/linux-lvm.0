From: "Carey Jung" <carey@itfreedom.com>
Subject: RE: [linux-lvm] pvmove errors
Message-ID: <GNEAKGKKMNLLGBACDNBJAEDFCGAA.carey@itfreedom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-reply-to: <20030425113525.C16006@sistina.com>
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
Date: Fri Apr 25 08:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>
> Carey,
>
> which LVM/kernel versions are you using ?
> The error tells that the change for the mapping in the LVM driver fails.

The latest RH rpm and smp kernel:

# rpm -qa|grep lvm
lvm-1.0.3-4
# cat /proc/version
Linux version 2.4.18-27.7.xsmp (bhcompile@stripples.devel.redhat.com) (gcc
version 2.96 20000731 (Red Hat Linux 7.3 2.96-112)) #1 SMP Fri Mar 14
05:52:30 EST 2003

>
> The mapping on disk (lvdisplay -Dv ...) doesn't get changed in that case.
> Must be a flaw in the ioctl error return handling, because it obviously
> got changed in the kernel as "lvdisplay -v " shows.

That's Greek to me, but something was seriously messed up with the PE
allocation or something, because I ended up trashing the LV after I sent
this message.  I could read the entire partition just fine, so I thought I'd
copy it to another LV and then delete the original LV.  So I created another
LV -- in the same VG as the original -- and started a big rsync copy from
source to destination LV.  Halfway through it, rsync started complaining
that it couldn't find files that were on the source filesystem when it
started.  When I snooped in the original LV, a bunch of directories had
disappeared!  Bear in mind that I was just reading from this filesystem.

My guess is that the PE allocation/mapping to LVs was messed up, so that
some PEs allocated to the new LV were actually mapped to the original LV, so
as I started writing to the new one, the system was overwriting files, etc
in the old LV.  Several directories seemed to have been effectively 'mv'-ed
to the new LV.

I then created yet another LV in a separate VG, rsync'ed both of the 1st two
LVs to it, recovered what was missing from a backup, and then lvremove'd the
first two.  I'm also in the process of copying all the other LVs in that VG
to another VG, just because I'm not sure I can trust its integrity.

By the way, is their some kind of tool one can run to do something analogous
to 'fsck' for VGs?  Something that will walk through LVs and PEs and make
sure the VG is internally consistent?

Thanks,
Carey
