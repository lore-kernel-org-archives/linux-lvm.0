Return-Path: <bluca@comedia.it>
Date: Wed, 13 Dec 2000 08:36:53 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Linux 2.4.0-test12-pre7 LVM .9 vs .8final
Message-ID: <20001213083653.A30015@colombina.comedia.it>
References: <Pine.OSF.4.21.0012081042590.14388-100000@mail.mnsu.edu> <3A3477D0.94BC1D88@twc.de> <20001212084807.A27177@colombina.comedia.it> <20001212170719.A5990@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001212170719.A5990@sistina.com>; from lewis@sistina.com on Tue, Dec 12, 2000 at 05:07:20PM -0600
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 12, 2000 at 05:07:20PM -0600, lewis@sistina.com wrote:
> On Tue, Dec 12, 2000 at 08:48:07AM +0100, Luca Berra wrote:
> > On Mon, Dec 11, 2000 at 07:44:32AM +0100, Ulf Bartelt wrote:
> > > A set of lvm tools for multiple versions of the io protocol could help a
> > > lot...
> > > 
> > > Sure this can be faked using links, wrappers etc...
> > 
> > i am using this piece of junk for testing and switching back btw 0.8 and 0.9
> 
> As far as I can tell though, this won't help people who are booting off of LVM
> to transition to 0.9  We need some sort of boot disk image or something to
> activate the volume group under the 0.9 code.

I don't grok the problem, (i have root lvm on my main system)
/dev/vg01/lvol1         253871     49152    191612  20% /

since the only known way to boot this is by having an initrd
i just put lvm 0.9 tools in the initrd an rebooted

my linuxrc looks like:
#!/bin/sh -x
mount -t proc /proc /proc
echo "" > /proc/sys/kernel/modprobe
insmod -k /lib/modules/*/kernel/drivers/md/lvm-mod.o
insmod -k /lib/modules/*/kernel/drivers/md/md.o
insmod -k /lib/modules/*/kernel/drivers/md/raid1.o
insmod -k /lib/modules/*/kernel/drivers/md/xor.o
insmod -k /lib/modules/*/kernel/drivers/md/raid5.o
insmod -k /lib/modules/*/kernel/drivers/scsi/scsi_mod.o
insmod -k /lib/modules/*/kernel/drivers/scsi/aic7xxx.o aic7xxx='verbose'
insmod -k /lib/modules/*/kernel/drivers/scsi/sd_mod.o
insmod -k /lib/modules/*/kernel/drivers/block/floppy.o
insmod -k /lib/modules/*/kernel/fs/reiserfs/reiserfs.o
raidstart -a
ln -s md/0 /dev/md0
ln -s md/1 /dev/md1
vgscan -v
vgchange -a y
umount /proc


-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
