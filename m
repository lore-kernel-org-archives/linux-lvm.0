Date: Tue, 09 Oct 2001 12:30:36 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] rc4 can't take snaphots of 0.9.1_beta7 lvs
Message-ID: <407510000.1002645036@tiny>
In-Reply-To: <20011009165801.B851@btconnect.com>
References: <387040000.1002641567@tiny> <20011009165801.B851@btconnect.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com
Cc: mge@sistina.com


On Tuesday, October 09, 2001 04:58:01 PM +0100 Joe Thornber
<thornber@btconnect.com> wrote:
> 
> Some of the betas misaligned the logical volumes.  If the volumes
> aren't page aligned the snapshot code (which uses kiovecs) cannot
> work.  You have this problem.  Fixing it isn't easy; you need to
> shuffle your extents up or down by the appropriate amount.  No one has
> written a program to do this as of yet.  Sorry.
> 

Well, it worked in beta7 so it certainly should be possible in rc4.  I'm
sorry if I missed this in the thread(s) where backwards compatibility was
discussed, but this does not work as a clean upgrade.

I really do appreciate the compatibility work done so far, but snapshots
don't count as a minor feature that can be ignored.

Joe, thanks for the quick response.

-chris
