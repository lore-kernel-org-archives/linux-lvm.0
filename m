Message-ID: <1585.24.46.54.254.1031665189.squirrel@mail.scottsavarese.com>
Subject: Re: [linux-lvm] software mirroring
From: "Scott Savarese" <scott@scottsavarese.com>
In-Reply-To: <3D7DE10F.733BFCE6@silicide.dk>
References: <4808.24.46.54.254.1031320260.squirrel@mail.scottsavarese.com>
        <20020906201136.GB5094@localhost>
        <3256.24.46.54.254.1031409280.squirrel@mail.scottsavarese.com>
        <20020907204200.GA3481@localhost>
        <3D7DE10F.733BFCE6@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Sep 10 08:40:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: jon+lvm@silicide.dk

Jon Bendtsen said:
> I have tried it, and it works fine.

OK...I need massive help... I have 2 drives hda and hdc. hda contains 1
partition, the original installation. hdc has two partitions. One for
/boot and one for / (and all subdirectories). I then created to raid1's
with hdc as the primary drive and hda as a "failed-disk". This way I can
always boot off of hda in case it doesn't work. /dev/md0 sits on hdc1 and
contains /boot and /dev/md1 sits on hdc2.

I then pvcreated /dev/md1 and created a root LV and then copied my
installation. I modified lilo.conf and fstab and ran lilo (I'll include my
lilo.conf at the end).

My theory is that I can change my BIOS setting to boot off /dev/hdc and
then once I am sure it works, change hda entries in my raiddtab to
"raid-disk" and hot add them. Rerun lilo and then I should be able to boot
off of hda.In theory.

I can run lilo. It understands my raid disks (lilo is version 22.2, my
kernel 2.4.18 and I am using lvm 1.0.5). However once I reboot and switch
the BIOS, I now get L 80 80 80...when I try and boot of /dev/hdc. It still
works fine booting off of hda.

Can you help?
Thanks,
Scott

HERE is my lilo.conf for the raid

boot = /dev/md0
delay = 50
vga = normal
lba32
image = /boot/vmlinuz
  root = /dev/rootvg/root
  label = linux
  initrd = /boot/initrd-lvm-2.4.18.gz
  ramdisk = 8192
  read-only
