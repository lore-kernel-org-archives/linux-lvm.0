Message-Id: <200112121346.fBCDkNQ18525@lewis.abi.tconline.net>
From: Lewis Bergman <lbergman@abi.tconline.net>
Subject: Re: [linux-lvm] reinstall, import, export question
References: <NBBBKLKHMJHIJLHOGAOJKEKDJCAA.steve.wray@the.net.nz>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJKEKDJCAA.steve.wray@the.net.nz>
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
Date: Wed Dec 12 07:46:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I want to be able to simply reinstall the system
> and carry the physical volumes, and the VG's and
> LV's they hold over to the rebuilt system.
I just finished doing this.
I installed a new python version from source which torched all my printing in 
RH7. So instead of reinstalling the RPM I decided to wipe the OS and do a 
fresh install. Here is my setup.

OLD:
hda 	held "/" on ext2
hdb	held /home, /usr, /root, /var on LVM with reiserfs

NEW:
hda	holds "/" on ext3
hdb	holds /home, /usr, /root, /var on LVM with reiserfs

I might miss a step but will try not to.

1. Back up all /etc/lvm* files and dirs. (I don't think this is neccessary 
since vgscan rebuilds them I think but I did it anyway)
2. Install fresh OS or upgrade.
3. Download latest kernel (I used 2.4.16). Of course you could use theirs but 
if you are going to build a kernel get the latest stable one there is.
4. Enable proper kernel options (in my case LVM, ext3, reiserfs)
5. make dep clean bzImage modules modules_install
6. Make sure you have boot disk  of old kernel.
7. make changes to grub or lilo for new kernel
8. reboot
9. make dirs to mount LVM on and copy back the /etc/lvm* stuff from backup. 
(again, may not be neccessary)
10. Get and install the lvm utilities from Sistina
11. run pvscan to see if the "inactive" pv is recognized
12. run vgscan, then vgchange -a y
13. run lvscan to make sure all went as expected
14. mount all to the dirs you created. In my case something like:
	mount -t reiserfs /dev/main/lvhome /mnt/lvhome
15. scan them and read/write them to make sure you get no fs errors
16. make sure vgscan, vgchange -a y is in startup and vgchange -a n is in 
shutdown
17. make changes to fstab to mount the dirs to the correct places
18. double check above
19. reboot

Of course You know most all of that I am sure but it is easier for me to lay 
it out that way. If you don't have a "dedicated" LVM disk as I do That will 
most surely complicate things if the OS doesn't support an upgrade or install 
of LVM. I know RH and deb don't. (the two I use) I have seen on the list that 
suse and another do. This worked for me at least.

Hope I didn't forget anything major.
-- 
Lewis Bergman
Texas Communications
4309 Maple St.
Abilene, TX 79602-8044
915-695-6962 ext 115
