From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with snapshots on sparc64
Message-ID: <20030602170507.B6678@sistina.com>
References: <20030529001029.GB16622@wh9155.stw.uni-rostock.de> <20030602113939.D5039@sistina.com> <20030602131232.GB9679@wh9155.stw.uni-rostock.de>
Mime-Version: 1.0
In-Reply-To: <20030602131232.GB9679@wh9155.stw.uni-rostock.de>; from daniel.bayer@stud.uni-rostock.de on Mon, Jun 02, 2003 at 03:12:32PM +0200
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
Date: Mon Jun  2 10:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jun 02, 2003 at 03:12:32PM +0200, Daniel Bayer wrote:
> Hallo
> 
> On Mon, Jun 02, 2003 at 11:39:39AM +0200, Heinz J . Mauelshagen wrote:
> > which LVM version (kernel and tools)
> 
> kernel: 1.0.5+(22/07/2002)
> tools:  1.0.4-4
> 
> > and do you have HIGHMEM configured
> > (IOW: more than 960M memory) ?
> 
> Its a 64Bit architecture. There is no need for things like HIGHMEM.
> But yes, the system has 2GB RAM.

Oh, overlooked that in your email :(

> 
> > There's flaws with Linux 2.4.20 highmem which show with snapshots :(
> 
> But this problem:
> > > Another related problem is, that "cat /proc/lvm/global" in the most
> > > cases doesn't output the usual data but some random memory. Its really
> > > odd. But if I try often enough I sometimes also get the right output
> > > (and no, I didn't calculated the probability). The other files in
> > > /proc/lvm work fine.
> 
> appears also if there are no snapshots at all. (This time I only had
> to try 2 times to get the version-string.)
> 
> Tomorrow I will have some time to update the kernel and the tools to
> the current versions.

Yes, my recommendation anyway.

> 
> 
> Daniel
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
