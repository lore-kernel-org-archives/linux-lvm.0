Subject: Re: [linux-lvm] problem
From: Daniel Wittenberg <daniel-wittenberg@uiowa.edu>
In-Reply-To: <20030108214555.F28021@uk.sistina.com>
References: <1042049056.1433.29.camel@tux.its.uiowa.edu>
	 <33170000.1042057292@[192.168.200.4]>
	 <1042057991.12153.0.camel@tux.its.uiowa.edu>
	 <20030108214555.F28021@uk.sistina.com>
Message-Id: <1042064687.12147.7.camel@tux.its.uiowa.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Jan  8 16:24:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I didn't see any pre-built binaries, so I started down the source path,
and looks like it needs device-mapper, ok, I started working on that,
and it looks like it wants the LVM2 patches to the kernel source...does
this sound right?  Since I only want the LVM2 tools just for this fix,
does sistina build any RPM's or binaries?  I'm just short on time right
now and going to be a pain if I have start doing kernel patches and
everything else too...

Dan

On Wed, 2003-01-08 at 15:45, Alasdair G Kergon wrote:
> On Wed, Jan 08, 2003 at 02:33:11PM -0600, Daniel Wittenberg wrote:
> > Other ideas?
> 
> Install the LVM2 utilities and perform the task with them?
> 
> "vgreduce --removemissing rootvg" will do exactly what you 
> want - but I haven't released it yet because I haven't finished 
> testing it with snapshots present etc.
> 
> For now, you run LVM2's vgcfgbackup (with -P), edit the 
> text file by hand to remove the PV and LV (easy to do), then 
> run vgcfgrestore to put the fixed metadata in the text file
> back onto disk.
> 
> Then if you don't want to upgrade to LVM2 yet, you can
> simply revert to using the LVM1 tools again, starting
> by running LVM1's vgscan.
> 
> 
> In circumstances like this, you don't need to change your
> kernel in order to use the LVM2 tools. You can just set 
> "activation = 0" in the lvm.conf file and then they'll 
> only manipulate on-disk metadata and they won't try to
> talk to device-mapper (the new kernel driver that LVM2 uses).
> 
> Alasdair
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
===========================
Daniel Wittenberg
Senior Unix Admin
University of Iowa - ITS
