From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040101233902.GG21031@percy.comedia.it>
References: <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is> <20040101184805.GA10139@percy.comedia.it> <1072993242.6220.12.camel@leto.cs.pocnet.net> <20040101224529.GD21031@percy.comedia.it> <1072998611.5199.21.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1072998611.5199.21.camel@leto.cs.pocnet.net>
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
Date: Thu Jan  1 17:40:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: linux-lvm@sistina.com

On Fri, Jan 02, 2004 at 12:10:11AM +0100, Christophe Saout wrote:
>I thought you were talking about the lvmcreate_initrd script that came
i actually never used lvmcreate_initrd that came with LVM1,

>Yes, I've seen redhat doing this. I personally prefer being able to
>override it at the command line though. Having something hardcoded in
>the initrd sounds strange to me.
i agree with your concern, i'll try to get it from the command line

>I have attached the script. I parse /proc/cmdline, try to remove root=
>using a shell function and if it actually removed something I know that
>the rest has to be a device name. :)
uhm, you should be wary of the case when a root= is in lilo.conf and
luser wants to override it from cmdline. you stop a t the first
occurrence.

>Wasn't ash the one from busybox?
no busybox is a dietlibc compiled shell that already has most command
compiled in, so a single executable, and smaller than glibc.

>With udev I just created /dev/console and some others. Doing everything
>from the script seems unnecessary.
i have to, because of tmpfs dev

>> My initrd detects if the root VG is on a md (softraid) device and
>> starts it before trying to activate the VG.
>Doesn't the kernel start them automatically? You mean, if it isn't
>activated in the kernel? Probably a good idea.
I strongly believe that raid autodetection should be done in user space,
possibly with mdadm. There is a big advantage in being able to control
what gets activated and when, besides distribution kernels use modular
scsi drive modules, so probably autodetection won't work anyway.
I also don't have the faintest idea if the kernel deals with stacked
raid devices

>Yes, that's also possible. But I don't really like it being readonly
>because, as you say, mounting something on /etc or /dev is unnecessary.
>What's the problem with ext2? The wasted memory?
wasted memory and disk space, being able to fit kernel+initrd on a
single floppy is a good reason

>I would love making the initrd an initramfs. But that doesn't currently
i think initramfs is not mature yet.
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
