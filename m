Subject: Re: [linux-lvm] Re: [PATCH] 2.5 version of device mapper submission
Message-ID: <20021014175608.GA14963@fib011235813.fsnet.co.uk>
References: <1034453946.15067.22.camel@irongate.swansea.linux.org.uk> <1034614756.29775.5.camel@UberGeek.coremetrics.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1034614756.29775.5.camel@UberGeek.coremetrics.com>
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
Date: Mon Oct 14 13:03:27 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Austin Gonyou <austin@coremetrics.com>
Cc: linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Oct 14, 2002 at 11:59:17AM -0500, Austin Gonyou wrote:
> Just curious, but device-mapper and 2.5.42 do not seem to jive very
> well. Please advise.

Try the patches at:

http://people.sistina.com/~thornber/patches/2.5-unstable/

There are three minor changes:

09.patch
  [Device-mapper]
  Remove linux/iobuf.h include.

10.patch
  [Device-mapper]
  Add call to blk_queue_bounce() at the beginning of the request function.

11.patch
  [Device-mapper]
  Pass md into dm_suspend/dm_resume instead of a kdev_t.

- Joe
