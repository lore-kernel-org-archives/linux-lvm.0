Message-ID: <3E3F56CD.2000100@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM rootfs and cramfs as ramdisk
References: <002901c2ca3a$03c98e90$240b892c@pe1mhp.ampr.org>
In-Reply-To: <002901c2ca3a$03c98e90$240b892c@pe1mhp.ampr.org>
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
Date: Tue Feb  4 00:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Jan,

On my system lvm driver is in the kernel (no module).

/#!/bin/sh

I mount /etc with a tmpfs to have /etc in rw (I do not need the 
"/etc/fstab").

mount -t tmpfs none /etc

Now I mount /proc because "vgscan" need to access "/proc/partitions" (I 
do not need the "/etc/fstab").

mount -t proc none /proc

Finaly I can scan for the volume groups and activate these volume groups.

echo "Scanning for Volume Groups..."
/sbin/vgscan
echo "Activating Volume Groups"
/sbin/vgchange -a y

I umount /proc and /etc because, I do not need now the "/etc" (you need 
to do a vgscan in the startup script of your system to update the 
"/etc/lvm*" files in the real "/etc"), and the kernel after the mount of 
the real / mount the /proc.

umount /proc
umount /etc

I do not need any files in the "/etc" I only need to create temporaries 
files with vgscan.

Best regards.

Francis

Jan H. van Gils wrote:

>>Hi Jan,
>>    
>>
>
>Hi Francis,
>
>  
>
>>You need "/etc" in rw for this you can mount "/etc" in the "linuxrc" 
>>script using a tmpfs filesystem like this:
>>
>>    
>>
>
>Thanks for the information.
>I was already wondering if I was the only one with this problem.
>
>But what about the init files that are normaly in "/etc" ?
>I can imagion that a tmpfs is an empty filesystem.
>Or do I not fully understand what you mount option does ?
>
>  
>
>>/#!/bin/sh
>>...
>>mount -t tmpfs none /etc
>>mount -t proc none /proc
>>echo "Scanning for Volume Groups..."
>>/sbin/vgscan
>>echo "Activating Volume Groups"
>>/sbin/vgchange -a y
>>...
>>umount /proc
>>umount /etc
>>/
>>I used "romfs" for the "initrd" ramdisk.
>>
>>Best regards.
>>
>>Francis
>>
>>    
>>
>
>With regards Jan
>
>
>----
>With regards Jan H. van Gils
>Internet web-page http://www.Knoware.NL/users/janvg/
>Internet e-mail address JanVG@Knoware.NL
>RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
