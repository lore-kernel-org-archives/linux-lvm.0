From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] serial console and initrd
Message-Id: <20020321215349.B31866@golem.blacknet.de>
References: <3C9A4638.2BB85101@wingenbach.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C9A4638.2BB85101@wingenbach.org>; from
    linux-lvm@wingenbach.org on Thu, Mar 21, 2002 at 03:44:40PM -0500
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
Date: Thu Mar 21 14:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux lvm <linux-lvm@sistina.com>

On Thu, Mar 21 '02 at 15:44, John Wingenbach wrote:
> I could use a little help on this one.  I just built an initrd (via
> lvmcreate_initrc) so that I could boot w/ my root fs in LVM.  It worked
> great except I lost my serial console.  It is as if the serial console
> is lost due to the initrd.  Prior to using an init ramdisk, I was having
> no issues with my serial console support from the kernel.
Just to make shure, you have
- support for serial console build into your kernel
- the console=ttS/0 (or what ever you need for your serial console)
  kernel parameter (in the lilo append line)

Cu,
    Goetz.
