From: "Ben Holness" <ben@bens-house.org.uk>
Subject: RE: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <000001c18dff$5d1f6500$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011226105856.A20872@colombina.comedia.it>
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
Date: Wed Dec 26 05:22:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>> I did a locate on "libzso.1", but it couldn't find it.
> it is libz.so.1, used by modprobe to uncompress gzipped modules

Quite right - a typo on my part :)

> anyway, could you try with lvm tools and the modified mkinitrd
> found on http://www.comedia.it/bluca/lvm/

OK, I upgraded to the latest mkinitrd and re-ran lvmcreate_initrd, but it
complained that it couldn't find lvm-mod.o (or mod-lvm.o - I don't remember
which way round).

So I downloaded the latest version of lvm (1.0.1) from the link you gave me
and upgraded. This time lvmcreate_initrd worked, but when I reboot I get
another error:

****

RAMDISK: Complressed image found at block 0
Uncompressing...............<3>invalid compressed format (err=2)done.

****

And then it all fails because Root fs is not mounted...

Any ideas?

Cheers,

Ben
