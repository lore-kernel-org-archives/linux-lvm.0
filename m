Message-Id: <3C9A5287.89623697@wingenbach.org>
From: John Wingenbach <linux-lvm@wingenbach.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] serial console and initrd
References: <3C9A4638.2BB85101@wingenbach.org>
    <20020321215349.B31866@golem.blacknet.de>
Content-Transfer-Encoding: 7bit
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
Date: Thu Mar 21 15:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ahh.. Thank you!  I missed that.  I had a global append line which got lost by
the custom one for the initrd boot.

-- John

Goetz Bock wrote:

> On Thu, Mar 21 '02 at 15:44, John Wingenbach wrote:
> > I could use a little help on this one.  I just built an initrd (via
> > lvmcreate_initrc) so that I could boot w/ my root fs in LVM.  It worked
> > great except I lost my serial console.  It is as if the serial console
> > is lost due to the initrd.  Prior to using an init ramdisk, I was having
> > no issues with my serial console support from the kernel.
> Just to make shure, you have
> - support for serial console build into your kernel
> - the console=ttS/0 (or what ever you need for your serial console)
>   kernel parameter (in the lilo append line)
>
> Cu,
>     Goetz.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
