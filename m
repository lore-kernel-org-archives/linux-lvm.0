Date: Tue, 9 Oct 2001 20:30:31 +0100
Subject: Re: [linux-lvm] rc4 can't take snaphots of 0.9.1_beta7 lvs
Message-ID: <20011009203031.B1034@btconnect.com>
References: <387040000.1002641567@tiny> <20011009165801.B851@btconnect.com> <407510000.1002645036@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <407510000.1002645036@tiny>; from mason@suse.com on Tue, Oct 09, 2001 at 12:30:36PM -0400
From: Joe Thornber <thornber@btconnect.com>
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

On Tue, Oct 09, 2001 at 12:30:36PM -0400, Chris Mason wrote:
> 
> 
> On Tuesday, October 09, 2001 04:58:01 PM +0100 Joe Thornber
> <thornber@btconnect.com> wrote:
> > 
> > Some of the betas misaligned the logical volumes.  If the volumes
> > aren't page aligned the snapshot code (which uses kiovecs) cannot
> > work.  You have this problem.  Fixing it isn't easy; you need to
> > shuffle your extents up or down by the appropriate amount.  No one has
> > written a program to do this as of yet.  Sorry.
> > 
> 
> Well, it worked in beta7

did it ?  It may not have segfaulted, but did you check the data
really carefully ?  After all it took a while for anyone to realise the
problem existed.

- Joe
