Message-ID: <3D23E0C7.3B30B618@zip.com.au>
From: Andrew Morton <akpm@zip.com.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 modifies the buffer_head struct?
References: message from Jens Axboe on Wednesday July 3 <15651.54044.557070.109158@notabene.cse.unsw.edu.au>
Content-Transfer-Encoding: 7bit
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
Date: Thu Jul  4 00:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Neil Brown <neilb@cse.unsw.edu.au>
Cc: Jens Axboe <axboe@suse.de>, Joe Thornber <joe@fib011235813.fsnet.co.uk>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org

Neil Brown wrote:
> 
> ...
> We just want ext3/jbd to make sure that it only calls bh2jh on
> an unlocked buffer... is that easy?

It's feasible, but a downright pita.

> Ofcourse this ceases to be an issue in 2.5 because the filesys uses
> pages or buffer_heads and the device driver uses bios.

Well, for 2.4 I'd be inclined to just add the extra field to 
struct buffer_head and be done with it.

Current sizeof(buffer_head) is 96 bytes, and making that 100 would
be a nuisance, but its quite easy to shrink the buffer_head a
bit (replace b_inode with BH_inode, say...).

-
