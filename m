Return-Path: <bluca@comedia.it>
Date: Sun, 5 Aug 2001 20:25:58 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805202558.A13863@colombina.comedia.it>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B6D85EB.4AFF6D2D@cup.hp.com>; from defranco@cup.hp.com on Sun, Aug 05, 2001 at 10:44:11AM -0700
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

On Sun, Aug 05, 2001 at 10:44:11AM -0700, John DeFranco wrote:
> I'm not certain exactly how I would use md in this
> context, and I'm not sure that I really want to since
> I'm using hw raid.
LVM does NOT have support for multipath.
in *redhat* kernels there is a patch that adds multipath support
to the md driver, you configure it as a raid-1 array, but it is
actually a multipath configuration.
it is the only way i know of doing what you want.

btw. i never tried this, i have an XP512 but i don't have a fc
card supported by linux on intel (should i tri with pa-linux?)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
