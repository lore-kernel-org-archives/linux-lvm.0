Subject: Re: [linux-lvm] core dumps with rc1
Message-ID: <OF3B538C3F.FFBCD136-ON85256AB8.0077BD7D@raleigh.ibm.com>
From: "Kevin M Corry" <corryk@us.ibm.com>
Date: Thu, 30 Aug 2001 16:51:26 -0500
MIME-Version: 1.0
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

From your fdisk output, it looks like you tried to modify the partition
table of the drive with your root filesystem (or any other filesystem that
happened to be mounted). I'd first take the advise from fdisk and reboot
your machine just to be sure the new partition tables are updated in
memory. Then try the pvcreate again and see if it is still core dumping.

-Kevin

-----------------------


Whoa!  I just went to sistina.com (looking for the mailing-list archives)
and thought I had it wrong, I tried sistina.org but no dice, then realised
you guys have redesigned the page!

nice job!! it looks great.

Now for my predicament: As I previously posted, I successfully built LVM
1.0.1rc1 with the Linus 2.4.9 kernel on a Guiness box (RH 7.0).

I've followed the instructions in the INSTALL file except for:

> 10. Add a "vgscan" and a "vgchange -a y" to your startup files
>     (/sbin/init.d/boot with SuSE for eg.) so that the actual volume
>     group configuration is online after each reboot.
>
>     Put a "vgchange -a n" into your shutdown script (/sbin/init.d/halt
for
eg.)
>     after dismounting all filesystems.

since I'm not certain of how this is done in RedHat.  I don't know whether
the right thing is to put these commands in /etc/rc.d/rc.sysinit
(probably),
/etc/rc.d/rc.local (less likely) or to create an lvm file in
/etc/rc.d/inet.d with links in the /etc/rc?.d (which runlevel to put it in?
I'm so clueless!!).

For now I've just run them manually:

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

# vgchange -a y
vgchange -- no volume groups found

I've set the type to 8e of a couple of partitions in a couple of drives as
follows:

Disk /dev/hda: 128 heads, 63 sectors, 589 cylinders
Units = cylinders of 8064 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1         5     20128+  83  Linux
/dev/hda2             6       589   2354688   8e  Linux LVM

Disk /dev/hdc: 16 heads, 63 sectors, 39870 cylinders
Units = cylinders of 1008 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdc1   *         1     18266   9206032+  83  Linux
/dev/hdc2         18267     39870  10888416    5  Extended
/dev/hdc5         18267     18787    262552+  83  Linux
/dev/hdc6         18788     19308    262552+  83  Linux
/dev/hdc7         19309     19829    262552+  82  Linux swap
/dev/hdc8         19830     39870  10100632+  8e  Linux LVM

although, in each instance, after "writing" the modifications I got error
messages as follows:

> Command (m for help): w
> The partition table has been altered!
>
> Calling ioctl() to re-read partition table.
> Re-read table failed with error 16: Device or resource busy.
> Reboot your system to ensure the partition table is updated.
>
> WARNING: If you have created or modified any DOS 6.x
> partitions, please see the fdisk manual page for additional
> information.
> Syncing disks.

the above looks worrisome but I've found a number of tutorials that talk
about using fdisk and all of them show the same error message without
reference to what it means... so presumably it's spurious?

anyway, then:

# pvcreate /dev/hda2 /dev/hdc8
Segmentation fault (core dumped)

yikes!

I've looked through the mailing list archives but only found:

http://lists.sistina.com/pipermail/linux-lvm/2001-August/008469.html

what next?

1k thx - e


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
