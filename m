From: Jens Axboe <axboe@suse.de>
Subject: Re: [linux-lvm] Re: [PATCH] 2.5 version of device mapper submission
Message-ID: <20021015082152.GA4827@suse.de>
References: <1034453946.15067.22.camel@irongate.swansea.linux.org.uk> <1034614756.29775.5.camel@UberGeek.coremetrics.com> <20021014175608.GA14963@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021014175608.GA14963@fib011235813.fsnet.co.uk>
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
Date: Tue Oct 15 04:00:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Cc: Austin Gonyou <austin@coremetrics.com>, linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Oct 14 2002, Joe Thornber wrote:
> 10.patch
>   [Device-mapper]
>   Add call to blk_queue_bounce() at the beginning of the request function.

What on earth for? I also see that you are setting BLK_BOUNCE_HIGH as
the bounce limit unconditionally for your queue. Puzzled.

When does dm even have to touch the data in the bio?

-- 
Jens Axboe
