Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Fri, 8 Jun 2001 10:24:53 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJOECDIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010607171549.A13292@stocks.pillory.com>
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
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Jack McKinney
> 
> Big Brother tells me that Steve Wray wrote:
> > > 
> > > LV are generally slower than other types of storage.  Since the
> > > boot partition is generally cyl 0 it's on the fastest storage
> > > available (short of tmpfs).  
> > 
> > Proportionally, how much slower is it? 50%? 25%? 12%? 
> > less than 1% slower?
> 
[snip]
> 
>     In other words, every block read that goes through LVM adds basically
> a division, a memory lookup and an addition.  The time it takes 
> to transfer
> the block from the drive is EONs compared to the time it takes to perform
> a couple of arithmetical computations.

Unless the machine in question is an i386 with no math copro?
8-)

Sounds good to me; I was surprised someone raised a speed issue
for /tmp on a LV.
Are there any other (good) reasons to have /tmp (or anything else other
than /boot) on a 'real' partition rather than on LV?

How about swap on LV? Or does swap need to be used before the LV's
are accessible?
