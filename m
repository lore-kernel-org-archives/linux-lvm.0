Message-ID: <47415.80.67.170.17.1028899844.squirrel@rezo.net>
Subject: Re: [linux-lvm] Re: can't mount ext3 snapshot => needs_recovery flag always set on mounted ext3 partitions
From: "Antoine" <antoine@rezo.net>
In-Reply-To: <20020809125201.GA3009@fib011235813.fsnet.co.uk>
References: <20020809125201.GA3009@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Fri Aug  9 08:30:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Try LVM2, it supports writeable snapshots.

Well, I'm not sure it's stable enough. Is it ?

> The point of the VFS patch you mentioned in an earlier email was to
> ensure that the journals are flushed correctly before the snapshot is
> taken.

!! Ooops... My fault ;) I had just applied the patch issued by 'make' in
the PATCHES directory. I thought it would include the VFS patch ; after
checking the kernel files it seems it does not (and the README doesn't
say anything about applying the VFS patch separately...).

Ok, now the VFS patch is really there, it works ;) Sorry, the doc files
weren't very clear....

Thanks,

Antoine.
