Return-Path: <oleg@bitband.com>
Message-ID: <3AC2EF8A.974ADCEE@bitband.com>
Date: Thu, 29 Mar 2001 10:17:14 +0200
From: Oleg Volkov <oleg@bitband.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM tryes
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
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Hi, all!

I had a good experience with LVM on HP machines, although I think
the IBM's one is better. So I trying Linux LVM from Sistina
just now. I know that this software is in beta state so the
history of my faults may be helpfull for developers.

A plain RH7 was installed on hda1(4G), swap on hda2(500M)
Kernel was updated to 2.4.2 (not good choise as I know now)
and lvm_0.9.tar.gz was downloaded and installed.

pvcreate and vgcreate on /dev/hda3 & /dev/hdc3 was successfull
and volume group named "home" and logical volume named "stripe"
was created.

Seeing that software is work in principal I was eager to move
my installation to full LVM configuration:
1. A "vg00" on /dev/hdc2 was created with lv named "root"
2. Migrate root content
3. A new entry was added to lilo.conf (creating an initrd.gz
   was on another kernel because of loop driver broken in 2.4.2)
   and boot with root=/dev/vg00/root was successfull. (Still
   booting from old root partition)
4. A /dev/hdc1 was created and content of /boot was transferred to it.
5. Disk /dev/hdc was taken to the computer with CD, connected as
   hda and booted from rescue CD I've created.
6. As you can suppose volume group named "home" is unworkable now
   (peer not exist). At that point I've discovered an unconsistent
   behaiviour of driver for major/minor numbers. At creation time
   the "home" vg got 0 (zero) minor number because of fact that
   it was created in the first turn. The "vg00" root goup got an
   1 (one) minor number and it works for lilo (it used an entry 3a:00
   as root partition) up to "home" was removed.
   OK. An entry in /boot/dev/vg00/root was modifyed to reflect the
   changes and "lilo -r /boot" was successfull. Now it boot in
   full LVM configuration (but standalone).
7. The disk previously beeing hda was added as hdc. Now the "home"
   vg configured successfull and stole minor number 0 again.
   So I cannot boot from /dev/vg00/root again.
8. I've decided to remove "home" at this point. vgremove was
   successfull and boot works. Lets create "home" again I said.
   vgcreate refused saying "home" already exist. O-ops I said,
   definitely I should be do vgexport before. Some playing with
   /etc/lvm* files and I can see "home" again. vgexport on it
   crashed with core. Hopefully I have an original root partition
   for playing. I've booted from there and tryed vgexport on "home"
   and "vg00" without success but with core dumps.

The main quiestion (and core dumps for vgexport off course) is
what the policy to setting minor number for vg ? Is it possible
to vgimport another vg and loose my root filesystem because of
jumping minor numbers ?

Oleg
