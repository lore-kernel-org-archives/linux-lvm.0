Return-Path: <thornber@btconnect.com>
Date: Mon, 13 Aug 2001 21:47:02 +0100
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010813214702.A1249@btconnect.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813161301.B6466@uk.sistina.com> <3B782E02.B5DB2FC8@tls.msk.ru> <20010813214943.A19522@cistron.nl> <20010813221837.A25630@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010813221837.A25630@dragon.blacknet.de>; from bock@blacknet.de on Mon, Aug 13, 2001 at 10:18:37PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Mon, Aug 13, 2001 at 10:18:37PM +0200, Goetz Bock wrote:
> 
> On Mon, Aug 13 '01 at 21:49, Wichert Akkerman wrote:
> > Compare with: wow! instead of a few simple modular applications we
> > now get a single one which tries to do everything. I'm not convinced
> > this is a step forward, the UNIX philosophy of having lots of small
> > single-purpose tools is a good one.
> (I did not check the cvs or how it is done)
> but if they did it right, they did it the same way busybox works:
> independent code file that could work as independent executables (if
> wrapped with some glue logic) but which work from one main executeable.
> While it keeps the mantainability of lots of small tools, it is actually
> better to manage for the user/admin (just one file), and the executable
> might even be smaller (better for bootdisks or simmilar low diskspace
> situations)

Exactly.

experimental
wc -l tools/*.[hc]
9441

beta8
wc -l tools/*.[hc]
13566

and there's a lot left to do.

- Joe
