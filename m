From: "Jan H. van Gils" <JanVG@Knoware.NL>
Subject: RE: [linux-lvm] LVM rootfs and cramfs as ramdisk
Message-ID: <002901c2ca3a$03c98e90$240b892c@pe1mhp.ampr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3E39BCA9.3020103@wanadoo.fr>
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
Date: Sat Feb  1 15:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: francis.souyri@wanadoo.fr
Cc: linux-lvm@sistina.com

>
>Hi Jan,

Hi Francis,

>
>You need "/etc" in rw for this you can mount "/etc" in the "linuxrc" 
>script using a tmpfs filesystem like this:
>

Thanks for the information.
I was already wondering if I was the only one with this problem.

But what about the init files that are normaly in "/etc" ?
I can imagion that a tmpfs is an empty filesystem.
Or do I not fully understand what you mount option does ?

>/#!/bin/sh
>...
>mount -t tmpfs none /etc
>mount -t proc none /proc
>echo "Scanning for Volume Groups..."
>/sbin/vgscan
>echo "Activating Volume Groups"
>/sbin/vgchange -a y
>...
>umount /proc
>umount /etc
>/
>I used "romfs" for the "initrd" ramdisk.
>
>Best regards.
>
>Francis
>

With regards Jan


----
With regards Jan H. van Gils
Internet web-page http://www.Knoware.NL/users/janvg/
Internet e-mail address JanVG@Knoware.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
