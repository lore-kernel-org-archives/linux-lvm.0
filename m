Subject: Re: [linux-lvm] determing lvm support
From: Rich Turner <rich@storix.com>
In-Reply-To: <20031220123023.H21022@uk.sistina.com>
References: <1071881237.1464.14.camel@rich>
	 <20031220123023.H21022@uk.sistina.com>
Message-Id: <1072109013.1353.11.camel@rich>
Mime-Version: 1.0
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
Date: Mon Dec 22 10:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sat, 2003-12-20 at 04:30, Alasdair G Kergon wrote:
> On Fri, Dec 19, 2003 at 04:47:18PM -0800, Rich Turner wrote:
> > lvm2:
> > look for "vgcreate" command and
> Better to check for the new 'lvm' base command: other commands are
> links to it: check that running 'lvm version' produces complete output.
> That will also confirm that device-mapper is available in the live
> kernel and that /dev/mapper/control is set up correctly.
> (See device-mapper/scripts/devmap_mknod.sh)
if i have 'device-mapper' and 'lvm version' produces complete output, is
there anything else to check if lvm is supported on the system?

is 'device-mapper' used for anything else besides lvm?

does the kernel need to be built with 'lvm' support (which i believe was
true with lvm1-created 'lvm-mod'), or does building a kernel for 'lvm'
support just create 'dm-mod' loadable module/builtin 'dm-mod' kernel
support?

> > look for "device-mapper" in /proc/devices or
> It's better to check for that in /proc/misc, which will tell you whether
> or not device-mapper support is present in the running kernel.
why is it better to check in /proc/misc? when device-mapper support is
loaded, it shows up in both /proc/misc as well as /proc/devices.

> 
> > look for "dm-mod" in /lib/modules/[release]/kernel/drivers/md/*
> Better to attempt to load the module with modprobe and then do the
> tests above to check it worked.
>  
> Alasdair
