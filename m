From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Fri, 7 Sep 2001 13:10:08 +0200
Subject: Re: [linux-lvm] disk swap
Message-ID: <20010907131008.A30548@tiger.bigcats.invalid>
References: <Pine.LNX.4.33.0109061240350.10967-100000@jupiter.loonybin.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0109061240350.10967-100000@jupiter.loonybin.net>; from rwf@loonybin.net on Thu, Sep 06, 2001 at 12:45:31PM -0400
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Rob!

Rob Foehl (rwf@loonybin.net) wrote 29 lines:

> I'm assuming its possible to put swap on LVM, I may be wrong..

I have never tried making a swap partition on LVM. Ssince the
kernel can and will strip over swap with equal priority and you
want swap to be FAST, you should put it 'near the beginning'
of (each?) disk, outside LVM or similar.

LVM is not the fastest way of accessing data -- there is some
overhead.  The price is not high, but as swap is 'extended RAM'
you don't want that penalty, since you gain little or nothing.

For additional (shorttime) swapspace needs you can always use
a swapfile -- a bit slower (FS overhead) but it can live on
any FS.

But then Swap use should be tailored to your specific situation.
A busy disk is a bad place for a swapfile, for example.

-Wolfgang
