Message-ID: <3E3F5788.1030206@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re:cramfs ramdisk and rootfs on LVM
References: <E18fePh-0001Zk-00@gw.pe1mhp.ampr.org>
In-Reply-To: <E18fePh-0001Zk-00@gw.pe1mhp.ampr.org>
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
Date: Tue Feb  4 00:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Jan,

YES... sorry I miss this, I used the builtin "mount" command of the 
"nash" shell (very small shell from redhat).

Best regards.

Francis

Jan H. van Gils wrote:

>	Hi,
>
>I tryed the options Francis gave to me but it doesn't work.
>
>Here is my linuxrc file:
>
>#!/bin/sh
>/sbin/modprobe lvm-mod
>/bin/mount -t tmpfs none /etc
>/bin/mount -t proc none /proc
>/bin/mount
>echo "Scanning for Volume Groups ..."
>/sbin/vgscan
>echo "Activating Volume Groups ..."
>/sbin/vgchange -a y
>/bin/umount /proc
>/bin/umount /etc
>
>What is wrong in this file.
>The thing that I see, is that the /bin/mount option doesn't show me any mounted file
>systems. So /etc is not mounted with a tmpfs file system.
>
>Jan 
>  
>
