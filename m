From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Errors compiling 2.2.20 with LVM
Message-ID: <20011109134323.B916@tykepenguin.com>
References: <20011109143013.A25638@schlund.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011109143013.A25638@schlund.de>; from anders@schlund.de on Fri, Nov 09, 2001 at 02:30:13PM +0100
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
Date: Fri Nov  9 07:58:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 09, 2001 at 02:30:13PM +0100, Anders Henke wrote:
> When trying to compile lvm-1.0.1-rc4 against 2.2.20, the lvm-patches apply
> without any problems, but the compile failes:
> 
> 
> [...]
> /usr/bin/gcc272 -D__KERNEL__ -I/usr/src/linux-2.2.20-hap-1/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer  -D__SMP__ -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=686   -c -o lvm.o lvm.c
> lvm.c: In function `lvm_do_lv_create':
> lvm.c:2192: structure has no member named `de'
> lvm.c: In function `lvm_do_lv_remove':
> lvm.c:2277: structure has no member named `de'
> make[4]: *** [lvm.o] Error 1

This is fixed in the CVS version. Either check out the whole lot from CVS or
just get the kernel/lvm.c file and remake the patch.

patrick
