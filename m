Message-ID: <3FE42022.6060301@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
References: <1071837164.7460.37.camel@Chimay.bugfactory.org> <20031219132513.GA1197@tykepenguin.com>
In-Reply-To: <20031219132513.GA1197@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2.4 LVM1 devfs  -> 2.6.0 LVM2 devfs
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
Date: Sat Dec 20 04:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Patrick,

I have a full ("/" is also a logical volume) LVM1 2.4 devfs system, and 
I want to test the LVM2 2.6 devfs kernel.

I want to have the possibility to boot the 2.4 or the 2.6 kernel with 
the same filesystems.

You say "lvm-common will detect whether you have device-mapper or LVM1 
in the kernel and use the appropriate LVM tools". What is lvm-common ? 
And if lvm-common can use the appropriate LVM tools how to install the 
LVM1 and LVM2 tools in the same filesystem ("same" binaries)

Best regards.

Francis


Patrick Caulfield wrote:

>On Fri, Dec 19, 2003 at 01:32:44PM +0100, Xavier Brouckaert wrote:
>  
>
>>Hi,
>>
>>As the 2.6.0 is out, it's time for me to see if I can switch to it.
>>What is the procedure and the things to know to switch from a 2.4 LVM1
>>devfs to a 2.6 LVM2 udev ?  I'm using a debian/unstable.  I've seen that
>>there was a package lvm2 (2.00.08-3) but the comment contains at the end
>>"requires Linux kernel 2.4.". Does this mean that this package really
>>cannot handle 2.6 kernels ?
>>    
>>
>
>No, that lvm2/devmapper packages handle 2.6 perfectly well. If you've got an
>LVM1 setup on your Debian box all you should need to do to switch to LVM2 and
>2.6.0 is install the lvm2 packages and reboot into the new kernel.
>
> 
>  
>
>>I've also seen that devfs has been obsoleted by udev. However, I didn't
>>find a udev package for sid nor a kernel option for it (but I've read
>>that it is only in userspace).  The udev FAQ
>>(http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev-FAQ) does not
>>mention if I need to install hotplug to have udev working.
>>    
>>
>
>I don't know about udev or hotplug. They are not required for LVM2/devmapper
>operation though.
> 
>  
>
>>Do I have to change something in /etc/lvmtab.d and /etc/lvmconf ?
>>    
>>
>
>No. lvm-common will detect whether you have device-mapper or LVM1 in the kernel
>and use the appropriate LVM tools.
> 
>  
>
>>It seems that a thing called "device-mapper" is needed, but I couldn't
>>find it in the kernel. Is it CONFIG_DM_IOCTL_V4 ? The "DM" substring
>>makes me think it's that but the comment in "make menuconfig" doesn't
>>say that it's for LVM nor that it's a device mapper.
>>    
>>
>
>Yes, you must compile in IOCTL_V4 support for device-mapper in 2.6.0. (actually
>I think that may have been fixed now but the old "V1" ioctls are deprecated).
>CONFIG_BLK_DEV_DM is the device-mapper string but if you don't select that you
>won't even see the option for IOCTL_V4 !
>
>
>  
>
