Subject: Re: [linux-lvm] Oops when running snapshots
From: Andrew Patterson <andrew@fc.hp.com>
In-Reply-To: <20030710113223.D23240@sistina.com>
References: <1057789596.1368.28.camel@lvadplx> 
	<20030710113223.D23240@sistina.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1057858065.1368.32.camel@lvadplx>
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
Date: Thu Jul 10 12:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

On Thu, 2003-07-10 at 03:32, Heinz J . Mauelshagen wrote:
> On Wed, Jul 09, 2003 at 04:26:36PM -0600, Andrew Patterson wrote:
> > Ran a load test last night where we created snapshots two snapshots
> > every 2 hours under heavy file system load.  We got the following oops:
> > 
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 00000000
> > 802895f5
> <SNIP>
> >   11:   89 48 04                  mov    %ecx,0x4(%eax)
> > 
> > 
> > 10 warnings issued.  Results may not be reliable.
> > 
> > This was run on a 2.4.21 system using LVM 1.0.7.  The system has 2GB of
> > memory and is configured with HIGHME64G.  We are running the latest
> > 2.4.21 XFS and are using xfs_freeze to quiesce the file system.  We are
> > not using the VFS_LOCK patch.
> > 
> > Anyone have any ideas what may be causing this?
> 
> VM problems ? (we had some reports ITR)
> Do you have a chance to retest without HIGHMEM to see if it still fails ?
> 

I looked through mailing list archives about this.  Most the of himem
problems resulted in vmmalloc.c calls in the oops.  I'll try it again
without himem to see if this helps.

Thanks,

Andrew

> > 
> > Thanks,
