Return-Path: <ragnark@stine.vestdata.no>
Date: Sun, 5 Aug 2001 23:47:16 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805234715.A30768@vestdata.no>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com> <20010805202558.A13863@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20010805202558.A13863@colombina.comedia.it>; from Luca Berra on Sun, Aug 05, 2001 at 08:25:58PM +0200
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

On Sun, Aug 05, 2001 at 08:25:58PM +0200, Luca Berra wrote:
> in *redhat* kernels there is a patch that adds multipath support
> to the md driver, you configure it as a raid-1 array, but it is
> actually a multipath configuration.

If I remember correctly, you configure as "multipath" not "raid1". 

> it is the only way i know of doing what you want.
Another alternative is the linux-driver for the SUN T3. I haven't tried
it myself, but supposedly one can use the same driver for other
dual-path RAIDs as well.



-- 
Ragnar Kjorstad
Big Storage
