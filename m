Return-Path: <thornber@btconnect.com>
Date: Thu, 21 Jun 2001 09:46:45 +0100
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010621094645.A300@gambit>
References: <134718885.992837796416.JavaMail.root@boots> <20010618123318.A31606@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010618123318.A31606@tiger.bigcats.invalid>; from weissel@netcologne.de on Mon, Jun 18, 2001 at 12:33:18PM +0200
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

On Mon, Jun 18, 2001 at 12:33:18PM +0200, Wolfgang Weisselberg wrote:
...

> First, we need a fool^Wcrashproof, completely interruptible
> pvmove for active, being currently read from and written
> to LVs.

I hope this is already there.  Do your experiences suggest it isn't
working for active pv's ?

>  Once this is there, we need to have a pvmove which
> can be told the physical place to move to, else we can only
> spread the most accessed PEs over the PVs.

This is exactly what we're planning for the next version of LVM.  The
moving of extents will be performed by the kernel rather than in user
space, the ioctl interface will allow the user to specify a list of pe
movements.

> Then the rest is simply ripping a balancing algorithm from
> somewhere and slap it into a wrapper.  Data aquisition is
> already done via lvmsadc/lvmsar.

Yes, a little Perl script to process the usage stats and then create a
new map.

- Joe
