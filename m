From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] where do i find the device mapper/LVM2 documentation?
Message-ID: <20030529212127.GA4011@fib011235813.fsnet.co.uk>
References: <3ED32F3E.9000009@silicide.dk> <3ED478E1.1020509@silicide.dk> <200305281643.04803.jhs@oes.co.th> <200305291427.15518.dphillips@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200305291427.15518.dphillips@sistina.com>
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
Date: Thu May 29 16:20:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 29, 2003 at 02:27:15PM +0200, Daniel Phillips wrote:
> On Wednesday 28 May 2003 11:42, Jason H. Smith wrote:
> > > >>How it is built up. Detailed information explaining to me how i can
> > > >> expand it, stuff like that.

If you're interested in writing your own targets I suggest you look at
a couple of the trivial targets that already exist.  Such as
dm-linear.c, dm-stripe.c.

- Joe
