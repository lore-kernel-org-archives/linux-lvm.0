From: lvm@interlinx.bc.ca
Message-ID: <20020817070901.GA5022@linux.interlinx.bc.ca>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] moving single LVM disk from one system to another
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
Date: Sat Aug 17 02:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

My workstation died (the MB, not the disk).  :-(

In it I have a single ATA disk with three fdisk type partitions:

hd?1 Linux boot
hd?2 Windows ~hangs head in shame~ (it's for testing only :-)
hd?3 LVM

Inside the LVM partition is the root, swap and a couple of other
filesystems.  On the ext3 /boot partition there is an initrd with all
the magic in it to get LVM and ext3 up and running.

On the dead machine, where the disk was built and last running, the
disk was device /dev/hde on a Promise ATA100 bus.  I want to move it
to another (working) machine on the primary ATA bus so it will be
/dev/hda.

When I boot the system, the initrd fires up and runs a vgscan but it
does not find the rootvol volume group.  So I boot on my Linux
distro's boot CD in rescue mode, install the LVM module, run vgscan
(the vendor was nice enough to put the lvm tools on the boot/rescue
cd) and it finds it fine.  I run "vgchange -a y" and whammo, the
volume group is active and I can mount my rootfs.  Great.  So I chroot
the HD (LVM) rootfs and mount /boot and run vgscan again so that it
updates the /etc/lvm* stuff and also build a new initrd, hoping that
the new configuration information will make it into the initrd.

I reboot again and still vgscan finds no volume groups.  What am I
missing here?  Why can the rescue mode of the boot CD find the volume
group no problem with a vgscan and my initrd's vgscan cannot?

Thanx in advance for any enlightment.

b.

--=20
Brian J. Murrell
