Message-Id: <200401150411.i0F4BC724491@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <6413350.1074097638140.JavaMail.Administrator@atp> (message from
	trylinux on Wed, 14 Jan 2004 08:27:18 -0800 (PST))
Subject: Re: [linux-lvm] No Subject
References: <6413350.1074097638140.JavaMail.Administrator@atp>
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
Date: Thu Jan 15 08:49:02 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: trylinux@nc.rr.com

trylinux wrote:

>First things first. Is there a FAQ for this group?

http://www.tldp.org/HOWTO/LVM-HOWTO/index.html

It covers LVM 1 and has been recently updated for verion 1.0.8. 

>Now then, I'm running Fedore Core/1 (Red Hat 9) with LVM 1.0.3-13 (or at
>least RPM says it's 1.0.3). I have a single volume group containing a single
>disk. While /boot is NOT in the volume group (for obvious reasons),
>everything else, include / is. / is a ext3 filesystem.

This is a Red Hat patched version of LVM 1.0.3, but the problem is not
version related.

>I recently used vgrename to rename the volume group (from rootvol to rootvg
>-- just a test to learn some more), and it seemed to succeed. I was able to
>run afterwards with no problems. On the first reboot after this, though, my
>system can no longer boot. Here's a rough transcription of what's going on:

>Mounting root filesystem
>mount: error 2 mounting ext3
>pivotroot: pivot_root(/sysroot,/sysroot/initrt) failed: 2
>umount /initrd/proc failed: 2
>Freeing unused kernel memory: 136k freed
>Kernel panic: No init found. Try passing init= option to kernel.

Was "root=/dev/rootvol/root" changed to "root=/dev/rootvg/root" in the
/boot/grub/grub.conf file?

>I'd be happy to provide more info if it would help anyone. (grub.conf,
>fstab, etc.)

Of course the volume group name change must be done in /etc/fstab also.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
