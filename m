Return-Path: <jdomingo@crosswinds.net>
Date: Sat, 26 May 2001 15:49:03 +0000
From: =?us-ascii?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Test of LVM
Message-ID: <20010526154903.A1477@dardhal.mired.net>
References: <01052614354500.00527@notch>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01052614354500.00527@notch>; from pwk.linuxfan@gmx.de on Sat, May 26, 2001 at 02:35:45PM +0200
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Saturday, 26 May 2001, at 14:35:45 +0200,
Peter Kirk wrote:

> Hi,
> 
> I have two disks in one Logical Volume, and all "Partitions" in the LV are 
> striped over the disks, the two disks are both:
> 
I suppose you mean "a VG consiting of the two disks, with LV created with
--stripe=2, that is like a RAID-0 would do" :)

> Now I would like to know, how to test if my LVM is performing as it should, 
> [...]
>
Depending on what you want to test, you can use several methods/tools
ranging from dd'ing data in and out, recursive copying, hdparm, bonnie,
bonnie++ and mongo. Check http://bulma.lug.net/static to see some
filesystem-oriented test you could try.

Mu (little) experience with stripped LVs is that throughput is quite lower
that the achieved with kernel's software RAID-0: the latter achieved
nearly the sum of the disks's R/W KB/s, while stripped LVs performance
felt quite behind.

But this was a _very_ simple test with a Pentium75 machine, with 16 MB RAM
and two disks, 400 MB one and 800 MB the other (tested with bonnie). So
results can be far from true under more realistic setups :).

Regards.

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
