Received: from localhost (vpn1-6-151.ams2.redhat.com [10.36.6.151])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1AAWpQb017847
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2016 05:32:51 -0500
Date: Wed, 10 Feb 2016 10:32:49 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20160210103248.GA3761@rh-vpn>
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
	<CAAYit8T1Wh+zQT_fsEk88D=1hv2A=kLVGWQAcdccjzx5xPuh5g@mail.gmail.com>
	<20160208085601.GA1498@rh-vpn>
	<CAAYit8RBpYh-99ZkBU6UF5KA2eot19LbvzivVUnDOeaFSJ621g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAYit8RBpYh-99ZkBU6UF5KA2eot19LbvzivVUnDOeaFSJ621g@mail.gmail.com>
Subject: Re: [linux-lvm] Repair thin pool
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 09, 2016 at 02:03:39AM +0800, M.H. Tsai wrote:
> 2016-02-08 16:56 GMT+08:00 Joe Thornber <thornber@redhat.com>:
> > On Fri, Feb 05, 2016 at 07:44:46PM +0800, M.H. Tsai wrote:
> >> I also wrote some extension to thin-provisioning-tools (not yet
> >> published. the code still need some refinement...), maybe it could
> >> help.
> >
> > I'd definitely like to see what you changed please.
> >
> > - Joe
> 
> I wrote some tools to do "semi-auto" repair, called thin_ll_dump and
> thin_ll_restore (low-level dump & restore), that can find orphan nodes
> and reconstruct the metadata using orphan nodes. It could cope the cases
> that the top-level data mapping tree or some higher-level nodes were
> broken, to complement the repairing feature of thin_repair.
> 
> Although that users are required to have knowledge about dm-thin metadata
> before using these tools (you need to specify which orphan node to use), I
> think that these tools are useful for system administrators. Most thin-pool
> corruption cases I experienced (caused by power lost, broken disks, RAID
> corruption, etc.) cannot be handled by the current thin-provisioning-tools
> --  thin_repair is fully automatic, but it just skips broken nodes.
> However, those missing mappings could be found in orphan nodes.
> 
> Also, I wrote another tool called thin_scan, to show the entire metadata
> layout and scan broken nodes. (which is an enhanced version of
> thin_show_block in branch low_level_examine_metadata -- I didn't notice
> that before... maybe the name thin_show_block sounds more clear?)
> 
> What do you think about these features? Are they worth to be merged to the
> upstream?

Yep, I definitely want these for upstream.  Send me what you've got,
whatever state it's in; I'll happily spend a couple of weeks tidying
this.

- Joe
