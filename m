Return-Path: <johannjh@iafrica.com>
From: "Johann" <johannjh@iafrica.com>
Subject: RE: [linux-lvm] syslogd reports:  kernel: lvm -- lvm_chr_ioctl: unknown command 4004fe0a
Date: Thu, 12 Jul 2001 21:07:43 +0200
Message-ID: <FDEJIMPDHJAAPNLFKBMGIEEECEAA.johannjh@iafrica.com>
In-reply-to: <20010712094638.B418@btconnect.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I noted the version difference and patched the kernel and utils to the
lastest version.

Thanx for your help.

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Joe Thornber
Sent: 12 July 2001 10:47
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] syslogd reports: kernel: lvm -- lvm_chr_ioctl:
unknown command 4004fe0a


we added a new ioctl between beta2 and beta7, it sounds like you are
using newer tools which are expecting the new ioctl to be there.  When
they don't find it they just fall back on the old command so no harm
done, other than a spurious kernel message.

- Joe

On Wed, Jul 11, 2001 at 08:33:14PM +0200, Theo wrote:
> Hello guys.
>
> This is my first time using lvm.
>
> After using pvcreate and vgcreate I rebooted and tried to activate the
> volume group.
>
> After the reboot I found the following in the kernel log:
> Jul 11 19:40:52 alderaan kernel: LVM version 0.9.1_beta2  by Heinz
> Mauelshagen (18/01/2001)
> Jul 11 19:40:52 alderaan kernel: lvm -- Driver successfully initialized
>
> Okay the driver is then in the kernel. No problem... later.... in the
kernel
> log:
> Jul 11 19:40:53 alderaan kernel: lvm -- lvm_chr_ioctl: unknown command
> 4004fe0a
>
> Same same error appears I run "vgchange"
>
> I am a bit confused about this ?
>
> I'm  using slackware 8.0 and I'm using the 2.4.5 kernel that comes with
the
> bare245.i image file.
>
> Any ideas ?
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
