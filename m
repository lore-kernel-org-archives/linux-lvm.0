Return-Path: <hch@ns.caldera.de>
Date: Thu, 14 Dec 2000 16:53:22 +0100
From: Christoph Hellwig <hch@ns.caldera.de>
Subject: Re: [linux-lvm] devfs
Message-ID: <20001214165322.A22656@caldera.de>
References: <0012132117412P.00826@lyta> <20001214164152.A1886@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20001214164152.A1886@colombina.comedia.it>; from bluca@comedia.it on Thu, Dec 14, 2000 at 04:41:53PM +0100
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
To: Luca Berra <bluca@comedia.it>, Linux-LVM@sistina.com

On Thu, Dec 14, 2000 at 04:41:53PM +0100, Luca Berra wrote:
> On Wed, Dec 13, 2000 at 09:17:41PM +0100, Russell Coker wrote:
> > It appears that devfs is not supported in LVM at this time (but I can't be 
> > certain because I haven't got it going properly yet).  What are the plans for 
> > devfs support?
> 
> this is not exact, there is some devfs support in lvm 0.9, or
> 0.8 in kernels >= 2.4.0-test8, but it does not work!!!
> 
> i had to patch the lvm tools so they don't remove the /dev/<vgname> directory
> 
> also from my brief testing it seems that devfs tries to create the
> /dev/vg/group node when activating the vg (while this should be done
> during vgscan), but does not create the lv defice files.

Right - you have to apply _two_ patches for the userlevel.

I had a system running devfs and LVM for a while but than switched back
to traditional /dev for other reasons.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
