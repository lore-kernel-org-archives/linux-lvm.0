Return-Path: <ragnark@stine.vestdata.no>
Date: Sun, 5 Aug 2001 02:28:01 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805022800.A26419@vestdata.no>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20010804174049.B564@colombina.comedia.it>; from Luca Berra on Sat, Aug 04, 2001 at 05:40:49PM +0200
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

On Sat, Aug 04, 2001 at 05:40:49PM +0200, Luca Berra wrote:
> On Fri, Aug 03, 2001 at 04:16:20PM -0700, John DeFranco wrote:
> > Does LVM work with multi-path disks? For example I have
> > a fibre channel configuration in which I have two paths
> > to each disk. I pvcreate a disk and am able to use it
> > within a vg but when I reboot and do a vgscan, lvm cannot
> > find any vg's. If I remove the second path lvm can see
> > the vg fine.
> 
> John, there is an addition for multi-path to the md driver
> you can fetch it from the redhat source kernel rpm.
> you can then stack lvm on top of md to achieve your goal

E.g. you have a md0 device consisting of sda and sdb - would not lvm
find three different paths to the same data (sda, sdb, md0) when
scanning for physical volumes? Will that not cause problems?

From John's description it looks like vgscan can't handle multiple path
- and that's the problem - not that it is not able to take advantage of
it (loadbalance / failover).


-- 
Ragnar Kjorstad
Big Storage
