Return-Path: <sbg00091@wolmail.nl>
Message-ID: <001a01c127f1$6e1a3f20$4d0b79c3@vandenberg>
From: "Johan van den Berg" <sbg00091@wolmail.nl>
References: <3B7AC356.A2FD65A3@xapnet.com>
Subject: Re: [linux-lvm] Help with redhat install
Date: Sat, 18 Aug 2001 16:23:57 +0200
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello!!

    I encountered the same pronlems. I was in the
    supposition the kernel 2.4.2 was already fit for
    lvm-iop-0.9.1_beta6-1.

    The source is indeed suitable for lvm, but it still
    has to be patched with the patchgenerator.

    I have the same kernel as yours, and all has to be
    patched and recompiled

    0)    make a bootable floppy (rescuefloppy) of the existing kernel

    1)    patch the sources (you must have the sources)
            `patch -p1 <  /../../../lvm-0.9.1_beta?-2.2.18.patch'

            2.2.18. may be another version, coming from
            the rpm-package chosen.
            This step is necessary, the source still needs to
            be patched. I skpped this step once, because I
            assumed the soures were fit for LVM, but this
            step needs to be done however.

    2)     cd ../../source-directory of linux/
            make mrproper
            make xconfig

            NOW load from ../configs/<your kernel-configuration>
                Next to your kernel-source there has to be a
                directory, named configs.
                In that directory, configs, there is a configuration-file,
                for diverse architectures and usages (BOOT, normal)
                Choose the desired architecture and usage (probably *-i386-)
            AFTER loading the configurationfile from ../configs,
            choose the submenu of `RAID and LVM support'
            THEN choose how you want to compile, as a module or
            directly into the kernel.

    3)    make dep
    4)    make bzImage
    5)    make bzdisk    - if you use a floppy -
                OR
            make install    - if you have lilo installed.
    6)    if have chosen the lvm (in make xconfig) to be used as a module
            make modules
            make modules install
    7)    copy the kernel image (bzImage) to the place were your regular
            bootable kernel is found
    8)    eventually have a bootable floppy readyof the new kernel
            OR/AND update the /etc/lilo.conf, to have one or both kernels
                            available.

Johan van den Berg,
's Hertogenbosch,
Holland

----- Original Message -----
From: Chris Bourne <cbourne@xapnet.com>
To: <linux-lvm@sistina.com>
Sent: Wednesday, August 15, 2001 8:45 PM
Subject: [linux-lvm] Help with redhat install


> Hello!!
>          I am trying to get lvm working on redhat 7.1 with kernel
> 2.4.2-2. I down loaded the source rpm's 1)
> lvm-iop-0.9.1_beta6-1.src.rpm   2)
> lvm-iop-patchgen-0.9.1_beta6-1.src.rpm  and the base rpm 3)
> lvm-base-1.1-1.i386.rpm. I did a rpm --rebuild and ran the rpm command
> and all seemed to install well with no problems. The problem I did
> discover is that there is no lvm dir. in /proc and the lvm-mod is
> nowhere to be found. I was under the impression that kernel 2.4 has lvm
> already built in. I did a insmod lvm-mod and modprobe lvm-mod and nada.
> I cannot figure out what I am doing wrong or if I should not be using
> this version of lvm and use lvm 1.0 instaed (will it work on redhat?).
> Thanks, Chris.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
