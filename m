MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E18aYn7-0006GE-00@gw.pe1mhp.ampr.org>
From: "Jan H. van Gils" <janvg@vgnet.nl>
Subject: [linux-lvm] RE:Unable to mount root fs after kernel upgrade
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
Date: Mon Jan 20 04:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Fred,

Here some info after I changed the kernel image with rdev.

>> Part off the Original message
>
> image=/boot/vmlinuz-2.4.20-686
>         label=Linux-2.4.20
>         read-only
>         root=/dev/vg00/root
>         initrd=/boot/initrd-lvm-2.4.20-686.gz
>         append="ramdisk_size=8192"
>
>> 
>> Now when I reboot the system and try to boot the new kernel 
>I get the 
>> following message : Kernel panic: VFS: Unable to mount root fs on 
>> 3a:00
>> 

>
>I'm not really sure of why this problem occurs but I've been able to 
>solve it in the past doing a rdev on the linux kernel image to 
>indicate that the root fs is /dev/vg00/root. man rdev should 
>help you finding the 
>accurate syntax. By the way I thought the problem was due to 
>grub (since I'm using grub instead of lilo), but it seems 
>that's not the reason.
>
>Fred.

I tryed to boot the system after I changed the root using rdev
but this didn't change the behavior.
I also tryed at the boot prompt <image> root=/dev/vg00/root

But I found an other error in de console log when trying to boot the
new kernel :

Here it is:
cramfs: wrong magic
Kernel panic: VFS: Unable to mount root fs on 3a:00


Maybe the error message about cramfs can give me some information to solve
the problem.

Greetz Jan

-- 
With regards Jan H. van Gils
Internet web-page http://www.VGNet.NL/
Internet e-mail address JanVG@VGNet.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
