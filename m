Subject: Re: [linux-lvm] Re: can't mount ext3 snapshot => needs_recovery flag always set on mounted ext3 partitions
Message-ID: <20020809125201.GA3009@fib011235813.fsnet.co.uk>
References: <20020809122723.GB2873@fib011235813.fsnet.co.uk> <46157.80.67.170.17.1028897064.squirrel@rezo.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46157.80.67.170.17.1028897064.squirrel@rezo.net>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Aug  9 07:51:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 09, 2002 at 02:44:24PM +0200, Antoine wrote:
> 
> > Would a writeable snapshot help ?  Since you would be able to change
> > the needs_recovery flag specifically on the snapshot.
> 
> How can I have a writable snapshot ? LVM snapshots are supposed to
> be read-only, aren't they ?

Try LVM2, it supports writeable snapshots.

> But indeed if the journal data has not been committed on the original
> volume when the snapshot is taken, then the snapshot may have false data
> in it as, due to its read-only nature, it is not able to catch up the
> uncommitted journal data... Am I missing something ?

The point of the VFS patch you mentioned in an earlier email was to
ensure that the journals are flushed correctly before the snapshot is
taken.

- Joe
