From: "Jorge Melhado" <jrgmelhado@hotmail.com>
References: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com> <20020808172939.GA18645@colombina.comedia.it> <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com> <20020809061302.GA22782@colombina.comedia.it>
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <OE183IR6t6c6oghBePr00001338@hotmail.com>
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
Date: Fri Aug  9 07:51:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

I�ve remove LABEL= from /etc/fstab and reboot my system.
Now it doesn�t startup. During startup process, when it checks root
filesystem, occurs:


Checking root filesystem
fsck.ext3/:
The superblock could not be read or does not describe a correct ext2
filesystem. If the device is valid and it really contains an ext2 filesystem
(and not swap or ufs or something else), then the superblock is corrupt, and
you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>
: Is a directory while trying to open /

[FAILED]
*** An error ocurred during the file system check
*** Dropping you to a shell; the system will reboot
*** when you leave the shell.
Give root password for maintenance
(or type Control-D for normal startup)


Then, if I enter with root passwor I can�t change /etc/fstab because it�s in
readonly mode. So, I reboot again and the problem persists.
I�v tried to execute   "e2fsck -b 8193 /dev/sda" , but it shows me the same
message.

Jorge


----- Original Message -----
From: "Luca Berra" <bluca@comedia.it>
To: "Jorge Melhado" <jrgmelhado@hotmail.com>
Cc: <linux-lvm@sistina.com>
Sent: Friday, August 09, 2002 3:13 AM
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm


> On Thu, Aug 08, 2002 at 03:35:14PM -0300, Jorge Melhado wrote:
> > Luca,
> >
> > I generated another RAM with mkinitrd, changed the /etc/lilo.conf and
reran
> > lilo.
> > After reboot, I note start up proceeds a bit more than before.
> > Now I see this message:
> >
> > Mounting root filesystem
> > mount: error 6 mounting ext3
> > pivoroot: pivot_root (/sysroot, /sysroot/initrd) failed: 2
> > Freeing unused kernel memory: 280k freed
> > Kernel panic:  No init found. Try passing init= option to kernel
>
> mmmm
> mumble....
>
> can you provide the output of your mkinitrd command with -v option,
> but first get rid of the junk LABEL= things in /etc/fstab
>
> mkinitrd looks at the device file in fstab to see if you have lvm root
> and probably LABEL= confuses it.
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
