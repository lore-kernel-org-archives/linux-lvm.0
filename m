Subject: Re: [linux-lvm] Re: can't mount ext3 snapshot => needs_recovery flag always set on mounted ext3 partitions
Message-ID: <20020809140403.GA3324@fib011235813.fsnet.co.uk>
References: <20020809125201.GA3009@fib011235813.fsnet.co.uk> <47415.80.67.170.17.1028899844.squirrel@rezo.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47415.80.67.170.17.1028899844.squirrel@rezo.net>
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
Date: Fri Aug  9 09:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 09, 2002 at 03:30:44PM +0200, Antoine wrote:
> > Try LVM2, it supports writeable snapshots.
> 
> Well, I'm not sure it's stable enough. Is it ?

It's missing bits of functionality (eg. pvmove), but what is there is
robust.

- Joe
