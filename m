From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM, Reiserfs, and snapshots.
Message-ID: <20011112085858.D624@tykepenguin.com>
References: <20011111212427.B4199@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011111212427.B4199@auctionwatch.com>; from petro@auctionwatch.com on Sun, Nov 11, 2001 at 09:24:27PM -0800
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
Date: Mon Nov 12 02:57:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 11, 2001 at 09:24:27PM -0800, Petro wrote:
>     Im having a bit of trouble here, and I'm hoping that someone on this 
>     list can assist me. 
> Nov 11 21:15:23 dbgsh01 kernel: reiserfs:warning: CONFIG_REISERFS_CHECK is set ON
> Nov 11 21:15:23 dbgsh01 kernel: reiserfs:warning: - it is slow mode for debugging.
> Nov 11 21:15:23 dbgsh01 kernel: reiserfs: checking transaction log (device 3a:01) ...
> Nov 11 21:15:23 dbgsh01 kernel: journal-1153: found in header: first_unflushed_offset 7026, last_flushed_trans_id 11094
> Nov 11 21:15:23 dbgsh01 kernel: journal-1006: found valid transaction start offs et 7026, len 3 id 11095
> Nov 11 21:15:23 dbgsh01 kernel: clm-2076: device is readonly, unable to replay log
> Nov 11 21:15:23 dbgsh01 kernel: Replay Failure, unable to mount
> Nov 11 21:15:23 dbgsh01 kernel: reiserfs_read_super: unable to initialize journal space


You need to apply the VFS lock patch in the LVM PATCHES directory to make
reiserfs snapshots work.


patrick
