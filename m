From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm
Message-ID: <20020809061302.GA22782@colombina.comedia.it>
References: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com> <20020808172939.GA18645@colombina.comedia.it> <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com>
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
Date: Fri Aug  9 01:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jorge Melhado <jrgmelhado@hotmail.com>
Cc: linux-lvm@sistina.com

On Thu, Aug 08, 2002 at 03:35:14PM -0300, Jorge Melhado wrote:
> Luca,
> 
> I generated another RAM with mkinitrd, changed the /etc/lilo.conf and reran
> lilo.
> After reboot, I note start up proceeds a bit more than before.
> Now I see this message:
> 
> Mounting root filesystem
> mount: error 6 mounting ext3
> pivoroot: pivot_root (/sysroot, /sysroot/initrd) failed: 2
> Freeing unused kernel memory: 280k freed
> Kernel panic:  No init found. Try passing init= option to kernel

mmmm
mumble....

can you provide the output of your mkinitrd command with -v option,
but first get rid of the junk LABEL= things in /etc/fstab

mkinitrd looks at the device file in fstab to see if you have lvm root
and probably LABEL= confuses it.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
