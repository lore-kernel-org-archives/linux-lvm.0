From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <20011226234944.A22510@colombina.comedia.it>
References: <20011226105856.A20872@colombina.comedia.it>
    <000001c18dff$5d1f6500$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001c18dff$5d1f6500$0b00a8c0@homelan.org>; from
    ben@bens-house.org.uk on Wed, Dec 26, 2001 at 11:20:44AM -0000
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
Date: Wed Dec 26 16:47:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 26, 2001 at 11:20:44AM -0000, Ben Holness wrote:
> > anyway, could you try with lvm tools and the modified mkinitrd
> > found on http://www.comedia.it/bluca/lvm/
> 
> OK, I upgraded to the latest mkinitrd and re-ran lvmcreate_initrd, but it
> complained that it couldn't find lvm-mod.o (or mod-lvm.o - I don't remember
> which way round).
you should be able to use mkinitrd instead of lvmcreate_initrd.

> RAMDISK: Complressed image found at block 0
> Uncompressing...............<3>invalid compressed format (err=2)done.

did you run lilo again after creatinh the initrd?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
