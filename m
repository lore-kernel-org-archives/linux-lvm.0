Message-Id: <200202271145.MAA11838@mailgate.sara.nl>
From: Remco Post <r.post@sara.nl>
Subject: Re: [linux-lvm] Cluster LVM
In-Reply-To: Your message of
    "Wed, 27 Feb 2002 06:37:23 EST."
    <3C7CC4F3.9DA76FC9@lmco.com>
MIME-Version: 1.0
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
Date: Wed Feb 27 05:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

clusters all have one major problem to solve: split brain. Make sure that the 
node manipulating the LV/VG does indeed have the right to do so, and doesn't 
screw up everything for everybody. Maybe introduce a (LV/VG) master concept 
into the VG, so as long as that is set, no other node in the cluster will 
manipulate anything in the vg. (just some random rant, ignore if I'm talking 
nonsense ;)


> Gitansh,
> 
>    God bless you! I've been asking for this for a long time, but
> the Sistina people who sponsor LVM are moving to a closed
> commercial solution.
>    I can't answer your questions because I don't really do too
> much low level programming, but I would love to be kept in
> the loop on your progress.
> 
> Thanks very much and Good Luck!
> 
> Jeff Layton
> 
> Lockheed-Martin
> 
> 
> Gitansh Chadha wrote:
> 
> > hi....well i am an undergraduate student from Pune ,India and we implementing a cluster LVM as our final year
> > project.we are manipulating   vg_status in vg_t structure to determine the status the of a volume group.basically
> > playing with the bits in it.so we can have a shared and exclusive locked volume group.we also have a administrator
> > which communicates with all nodes in the cluster and basically to maintain the consistency of the LVMTAB.any
> > suggestions? gitansh
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 

-- 
Met vriendelijke groeten,

Remco Post

SARA - Stichting Academisch Rekencentrum Amsterdam
High Performance Computing  Tel. +31 20 592 8008    Fax. +31 20 668 3167

"I really didn't foresee the Internet. But then, neither did the computer
industry. Not that that tells us very much of course - the computer industry
didn't even foresee that the century was going to end." -- Douglas Adams
