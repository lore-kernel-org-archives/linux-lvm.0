Subject: Re: [linux-lvm] cant mount LV via partition/filesystem labels
From: "Kirby C. Bohling" <kbohling@birddog.com>
In-Reply-To: <1036881654.10657.66.camel@hawk.birddog.com>
References: <3DCA84BB.9050404@jumpline.com>
	<1036691083.13804.59.camel@hawk.birddog.com>  <3DCD6269.6010508@mvista.com>
	 <1036881654.10657.66.camel@hawk.birddog.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1037081971.28139.58.camel@hawk.birddog.com>
Mime-Version: 1.0
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
Date: Tue Nov 12 00:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Steven Dake <sdake@mvista.com>

On Sat, 2002-11-09 at 16:40, Kirby C. Bohling wrote:
> On Sat, 2002-11-09 at 13:30, Steven Dake wrote:
> > I wouldn't mind seeing the patches.
> > 
> > Thanks
> > -steve
> > 
> 
> Steve,
> 
> 
> 	The patch that fixes the LVM so fsck to it works is this attached as
> fsck_lvm_labels.patch.
> 
> 	It's a trivial one line fix.  This applies to 1.26.  I'm guessing it
> will apply to any version of the e2fsck since then.  That was the
> earliest version that it did work on.  It applies cleanly on 1.32 which
> is the latest version on sourceforge.

Steve,

	Ted Ts'o, just replied to my patch, and said that my one line fix, was
backwards.  I did the diff in the wrong order.  I applied the patch, and
it applied cleanly 1.32, but of course I didn't test it, it applied
cleanly.  The proper fix was added in 1.29 according to Ted.  So all of
the current mount and fsck programs should work properly with LVM.  The
trival fix is easy to see if you need to fix up the old code.

	Some days I'm just a really bad programmer...

	Thanks,
		Kirby


-- 
Real Programmers view electronic multimedia files with a hex editor.
