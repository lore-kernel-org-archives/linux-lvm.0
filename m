Message-ID: <3FE32D1A.6040500@alteeve.com>
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Ext3 -> ReiserFS on '/' convertion prob
References: <3FE2892B.8000506@alteeve.com> <1071846372.22613.2.camel@gecko.indygecko.com>
In-Reply-To: <1071846372.22613.2.camel@gecko.indygecko.com>
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
Date: Fri Dec 19 10:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi!

   Thank you very much for your reply! May I pick your brain just a 
little bit more? Because I can't boot I am currently accessing the LVM 
LV via the Fedora Core 1 Install 1 CD using the 'linux rescue' option. I 
tried running that command but it threw a lot of "file not found" errors 
so I syslinked the missing files into place and it seemed a lot better 
but I keep getting two more errors;

   To show you what I mean here is the output:

  -= First, 'df' before I begin...

sh-2.05b# df
Filesystem	1K-blocks	Used	Available  Use%	Mounted on
rootfs		     6120	3564	     2206  62%	/
/dev/root.old	     6120	3564	     2206  62%	/
/tmp/cdrom	   644864	644864	        0 100%	/mnt/source
/dev/vg0/root	 17919448	1916960	 16002488  11%	/mnt/sysimage
/dev/hda1	   101086	6767	    89100   8%	/mnt/sysimage/boot
/dev/hda3	 76304192	32828	 72395284   1%	/mnt/sysimage/single

   (Note that I have an IDE for '/boot' and swap)

  -= Okay, my simlinks are in place. Now running 'lvmcreate_initrd'

sh-2.05b# lvmcreate_initrd
Logical Volume Manager 1.0.3 by Heinz Mauelshagen  02/19/2002
lvmcreate_initrd -- make LVM initial ram disk 
/boot/initrd-lvm-2.4.22-1.2115.nptl.gz

lvmcreate_initrd -- finding required shared libraries
lvmcreate_initrd -- stripping shared libraries
lvmcreate_initrd -- calculating initrd filesystem parameters
lvmcreate_initrd -- calculating loopback file size
du: invalid option -- c
BusyBox v0.60.5 (2003.01.24-22:44+000) multi-call binary

Usage: du [-lsxhmk] [FILE]...

lvmcreate_initrd -- making loopback file (541 kB)
lvmcreate_initrd -- making ram disk filesystem 9238 inodes)
lvmcreate_initrd -- mounting ramdisk filesystem
lvmcreate_initrd -- creating new /etc/modules.conf
lvmcreate_initrd -- creating new modules.dep
depmod: Can't open /lib/modules/2.4.22-1.2115.nptl/modules.dep for writing
lvmcreate_initrd -- ERROR running depmod
rmdir: unable to remove '/tmp/mnt.1185': Device or resource busy

   -= It failed... Here is 'df' again, with the loopback still mounted

sh-2.05b# df
Filesystem	1K-blocks	Used	Available  Use%	Mounted on
rootfs		     6120	3564	     2206  62%	/
/dev/root.old	     6120	3564	     2206  62%	/
/tmp/cdrom	   644864	644864	        0 100%	/mnt/source
/dev/vg0/root	 17919448	1916960	 16002488  11%	/mnt/sysimage
/dev/hda1	   101086	6767	    89100   8%	/mnt/sysimage/boot
/dev/hda3	 76304192	32828	 72395284   1%	/mnt/sysimage/single
/dev/loop1	      506	19	      487   4%	/tmp/mnt.1185

   -= When I try to create a symlink to '/lib/modules' I am told:

sh-2.05b# cd /lib
sh-2.05b# ln -s /mnt/sysimage/lib/modules
ln: creating symbolic link './modules' to '/mnt/sysimage/lib/modules': 
Read-only file system
sh-2.05b# cd /
sh-2.05b# ls -lah | grep lib
lrwxrwxrwx	1 root	root	16 Dec 19 12:05 lib -> /mnt/runtime/lib
sh-2.05b# cd /mnt/runtime/
sh-2.05b# ls -lah | grep lib
drwxr-xr-x	1 root	root   1.6k Jan  1 1970 lib

   So, have I done something stupidly wrong?? :)

   Again, you help is -very- much appreciated!

Madison

Jord Tanner wrote:
> You need to run "lvmcreate_initrd", which will create an lvm-initrd file
> in /boot. Then edit grub.conf to use the new initrd, and you are off to
> the races. This will make the lvm tools available at boot, then your VG
> will come online.
> 
> On Thu, 2003-12-18 at 21:14, Madison Kelly wrote:
> 
>>Hi all,
>>
>>   This is my first post to the list so forgive me please if I am making 
>>any mistakes of protocol! :)
>>
>>   I am relatively new to LVM but I have read most of the docs that I 
>>could find on the topic and I am pretty strong on RAID and general 
>>storage tech. With that said, here is my problem/scenario:
>>
>>   I have a small test server that I am trying to use to learn how to 
>>configure the '/' filesystem of a Fedora Core 1 install of linux to 
>>reside on a software RAID5 array with an LVM VG on top of it and the 
>>bulk of that partition on a single LV mounted as '/'. This so far is 
>>just fine. Oh, fwiw, the four drives are SCSI on an Adaptec 2940x PCI 
>>controller (three in use now, a forth to be used as a temp drive during 
>>FS convertion and later added to the array) with another IDE drive used 
>>for '/boot' and <swap>.
>>
>>   Now what I am trying to do immidiately is to convert the '/' 
>>filesystem from 'ext3' to 'resierfs'. ReiserFS is not an install-time 
>>option and the LVM FAQ says simple to boot from a rescue CD, back the 
>>'/' LV data up, re-format the LV with a ReiserFS and then restore the 
>>data. Sounds easy enough, eh? Anyway, I have been able to do all of this 
>>and I am even pretty sure that the data is intact because when I boot 
>>the Fedora Core 1 Disk 1 using 'linux rescue' it scans for the install 
>>and finds it on both '/dev/sdd1' (the drive I am using temporarily to 
>>backup the '/' LV data to) and on '/dev/vg0/root' (the LV that started 
>>life as an ext3 filesystem during the OS install).
>>
>>   The problem is that when I boot into the OS proper something 
>>somewhere is still telling something to do with LVM that the file system 
>>is still ext3 and thus it throws a kernel panic. I have edited 
>>'/etc/fstab', '/etc/mtab' and '/etc/blkid.tab' to read 'reiserfs' 
>>instead of the original 'ext3'. Am I missing a file somewhere? Is there 
>>a command I need to run to tell '/etc/lvmtab' or '/etc/lvmtab.d/root' 
>>that the filesystem has changed? Am I missing something all together 
>>different?
>>
>>   Anywho, as a little heads up and maybe a little request for comment; 
>>once I manage to get the '/' LV on ReiserFS the next thing I want to do 
>>is add a forth drive (the '/dev/sdd' drive) to the RAID5 array, extend 
>>it via 'raidreconf', add the new space to the PV, pass that space up to 
>>the VG and finally extend the 'root' LV and update the filesystem while 
>>online (hence the desire for ReiserFS). Am I on the right track? Does 
>>anyone who has done this before have any pointers?
>>
>>   Thanks all for listening to a n00by!!
>>
>>Madison
