From: "Jan H. van Gils" <JanVG@Knoware.NL>
Subject: RE: [linux-lvm] Unable to mount root fs after kernel upgrade
Message-ID: <004a01c2be1e$2f73cdd0$240b892c@pe1mhp.ampr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3E26CFBC.2020108@inrialpes.fr>
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
Date: Fri Jan 17 05:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Fred,

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

Fred do I understand you correct that this is a lilo issue ?
Lilo is not using the option "root=/dev/vg00/root" when booting ?


Jan

----
With regards Jan H. van Gils
Internet web-page http://www.Knoware.NL/users/janvg/
Internet e-mail address JanVG@Knoware.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
