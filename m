From: Ajay Shekhawat <ajay@cedar.Buffalo.EDU>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
Message-ID: <20031208162615.GJ2015@zaurak.cedar.Buffalo.EDU>
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D49@s99mail06> <1070853946.1558.17.camel@avalon>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1070853946.1558.17.camel@avalon>
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
Date: Mon Dec  8 13:56:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 08, 2003 at 04:25:47AM +0100, Markus Schiltknecht wrote:
> why is that? thought reiser was faster than ext3 while ext3 would be
> considered more stable (in general).

Reiser has this "tail packing" option, as well as some other optimizations
that benefit sites with lots of small files (best example: Usenet feeds).
However, this can come at a price for really LARGE files (as a DB would need).

> Before getting ways off topic: where can I find a good comparison /
> discussion on different filesystems?

Checkout
	http://oregonstate.edu/~kveton/fs/

Since noone has mentioned XFS, let me throw in my recommendation for XFS.
XFS (like, probably, IBM's JFS) is a top-notch filesystem. 
Try it out in your scenario, you might like it.

Ajay
