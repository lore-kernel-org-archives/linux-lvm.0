From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <1010615039.17321.2.camel@stout.americas.sgi.com>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <1010615039.17321.2.camel@stout.americas.sgi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1010615976.17321.5.camel@stout.americas.sgi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Wed Jan  9 16:40:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Eric Sandeen <sandeen@sgi.com>
Cc: Adrian Head <ahead@bigpond.net.au>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Wed, 2002-01-09 at 16:23, Eric Sandeen wrote:

> I tested snapshot creation & overflow with ext2, ext3, reiser, and xfs. 
> I have not looked closely enough to see why xfs breaks w/o this patch,
> and why it works with it, but... give it a shot.

Ah, ok.  Steve pointed out that in the stock LVM version,

unsigned long blocks[KIO_MAX_SECTORS];

plops 4k down on the stack; xfs's stack must be a bit bigger than other
filesystems, and it overflows... that's why xfs was failing with that
code, and other filesystems survived.

-Eric

-- 
Eric Sandeen      XFS for Linux     http://oss.sgi.com/projects/xfs
sandeen@sgi.com   SGI, Inc.
