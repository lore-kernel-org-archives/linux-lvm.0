Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20040101233902.GG21031@percy.comedia.it>
References: 
	 <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is>
	 <20040101184805.GA10139@percy.comedia.it>
	 <1072993242.6220.12.camel@leto.cs.pocnet.net>
	 <20040101224529.GD21031@percy.comedia.it>
	 <1072998611.5199.21.camel@leto.cs.pocnet.net>
	 <20040101233902.GG21031@percy.comedia.it>
Message-Id: <1073000959.5199.33.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
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
Date: Thu Jan  1 17:50:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Luca Berra <bluca@comedia.it>
Cc: linux-lvm@sistina.com

Am Fr, den 02.01.2004 schrieb Luca Berra um 00:39:

> >I thought you were talking about the lvmcreate_initrd script that came
> i actually never used lvmcreate_initrd that came with LVM1,

I did. It was quite simple to use and worked practically everywhere (if
you didn't use an initrd to do anything else).

> >I have attached the script. I parse /proc/cmdline, try to remove root=
> >using a shell function and if it actually removed something I know that
> >the rest has to be a device name. :)
> uhm, you should be wary of the case when a root= is in lilo.conf and
> luser wants to override it from cmdline. you stop a t the first
> occurrence.

Ah. You're probably right. I assumed the boot loader would replace it. I
never tested that though. My mistake.

> >With udev I just created /dev/console and some others. Doing everything
> >from the script seems unnecessary.
> i have to, because of tmpfs dev

Right. You mentioned that later.

> I strongly believe that raid autodetection should be done in user space,
> possibly with mdadm. There is a big advantage in being able to control
> what gets activated and when, besides distribution kernels use modular
> scsi drive modules, so probably autodetection won't work anyway.
> I also don't have the faintest idea if the kernel deals with stacked
> raid devices

One day everything will be done in userspace, even detection of
partitions. So you're right. But it's a thing to do in a generic initrd,
not in an LVM-only one. There are a lot of other things you should
probably think of in a generic initrd. EVMS users, or perhaps encrypted
root volume or something...?

> wasted memory and disk space, being able to fit kernel+initrd on a
> single floppy is a good reason

Yes, but does cramfs save a lot compared to a compressed ext2
filesystem?

> >I would love making the initrd an initramfs. But that doesn't currently
> i think initramfs is not mature yet.

It simply not finished.
