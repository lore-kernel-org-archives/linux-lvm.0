From: Brant Katkansky <lists@katkansky.org>
Subject: Re: [linux-lvm] No Subject
Message-ID: <20040114234655.GA20045@aquila.katkansky.org>
References: <6413350.1074097638140.JavaMail.Administrator@atp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6413350.1074097638140.JavaMail.Administrator@atp>
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
Date: Thu Jan 15 08:49:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: trylinux@nc.rr.com

On Wed, Jan 14, 2004 at 08:27:18AM -0800, trylinux wrote:

[...]

> I recently used vgrename to rename the volume group (from rootvol to rootvg
> -- just a test to learn some more), and it seemed to succeed. I was able to
> run afterwards with no problems. On the first reboot after this, though, my
> system can no longer boot. Here's a rough transscription of what's going on:

[...]

> Activating logical volumes
> vgchange -- volume group "rootvg" successfully activated
> 
> Mounting root filesystem
> mount: error 2 mounting ext3
> pivotroot: pivot_root(/sysroot,/sysroot/initrt) failed: 2
> umount /initrd/proc failed: 2
> Freeing unused kernel memory: 136k freed
> Kernel panic: No init found. Try passing init= option to kernel.

You need to rebuild the kernel initrd if you change your root device,
as the linuxrc script in the initrd has the root device hard-coded.
