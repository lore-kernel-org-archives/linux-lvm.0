From: Tom Brown <thecap@mail.utexas.edu>
Subject: Re: [linux-lvm] Can't create the Logical Volume in my system
Message-ID: <20011128034112.C23072@cream.ece.utexas.edu>
References: <48256B12.00325F26.00@mail.sercomm.com.tw>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48256B12.00325F26.00@mail.sercomm.com.tw>; from vincent_kuo@sercomm.com on Wed, Nov 28, 2001 at 05:10:14PM +0800
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
Date: Wed Nov 28 03:39:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Did you search the mail archives for help? You need to compile with
optimizations off because RH7 ships with a broken gcc. Search for 
segmentation fault 
at
http://tech.sistina.com/cgi-bin/htsearch

http://lists.sistina.com/pipermail/linux-lvm/2001-October/009496.html
is a good hit.


On Wed, Nov 28, 2001 at 05:10:14PM +0800, vincent_kuo@sercomm.com wrote:
> Dear sir,
>      I am trying the current version of LVM on my machine. I download the
> lvm-1.0.1-rc4.tar.gz file from the FTP site. But I can't create any Logical
> Volume on my machine. So I need your help. Thanks.
> 
>      My H/W information is:
>           VIA Socket7 motherboard with VT82C686A, VT8501 chip
>           CPU Cyrix MII-333
>           RAM 192MB
>           HDD x 3 =      hda 40GB (hda1=2G, hda5=rest size, hda6=64 swap)
>                     hdc 20GB (hdc1=2G, hdc2=2G, hdc3=2G, hdc5=128 swap, hdc6=5G,
> hdc7=5G, hdc8=rest size)
>                     hdd 40GB (hdd1=200MB, hdd5=rest size, hdd6=32 swap)
>           FileSystem XFS V1.0.1 on HDA, EXT2 on HDC and HDD.
>      My OS and Software..:
>           Red Hat Linux 7.1 with Kernel 2.4.10 (with XFS patches)
>      My testing procedure:
>           1. ./configure --with-kernel_dir=/usr/src/linux-2.4
>           2. cd PATCHES, make
>           3. cd /usr/src/linux-2.4
>           3. patch -p1 < lvm-1.0.1=rc4-2.4.10-xfs.patch
>           4. Configure the Kernel with LVM as Module (and RAID + linear, because
> I don't want to test the Software RAID now) There ever happen the Makefile
> patched during this procedure. (drivers/md/Makefile has already got "lvm-fs.o"
> line before the patch)
>           5. make bzImage, make modules, make modules_install, change lilo...
>           6. make, make install (LVM tool and library)
>           7. reboot
>           8. Change the partition ID by FDISK (83 Linux Native-> 8e Linux LVM)
> on /dev/hdc3, /dev/hdc8, /dev/hdd1
>           9. pvcreate  /dev/hdc3, pvcreate /dev/hdc8  -->  OK
>           10. vgcreate MyVG01 /dev/hdc3, vgcreate MyVG02 /dev/hdc8  -->  OK
>                  The result of "vgdisplay" is:  (See attached file: VolumeGroup)
>           11. vgchange -ay MyVG01, vgchange -ay MyVG02  -->  OK
>           12.  lvcreate -L 2G -n HDD01 MyVG01  -->  core dump
>           13.  lvcreate -L 2G -n HDD02 MyVG02  -->  core dump
>           14. What ever I do (changing the LV size or deactive/active the VG,
> format the partition....), it always display core dump.
>           15. The result of "pvdisplay" are: (See attached file:
> PhysicalVolume02)(See attached file: PhysicalVolume01)
>      I don't know what's wrong with my LVM. Did I make any mistake during the
> kernel or tool build procedure? Or I can't use XFS or EXT2 filesystem. I ever
> combine 2 partitions into one VolumeGroup, it still got "core dump". I plan to
> use LVM in a couple of weeks in all of my machine. So this procedure is my first
> try. Please tell me how to fix it (or what's wrong)?
>      By the way, the "lvcreate -d ...." will dump a lots of messages but I can't
> pipeline into a text file. The last few line are like below:
>      ............
>      <7777777> lvm_get_Device_type called
>      <7777777> lvm_get_Device_Type leaving with 0
>      <666666> lvm_check_partition_dev -- LEAVING with ret: TRUE
>      <55555> lvm_check_dev -- LEAVING with ret: 1
>      <55555> pv_check_new -- CALLED
>      <55555> pv_check_new -- LEAVING with ret: 0
>      <4444> pv_check_consistency -- LEAVING with ret: 0
>      <333> lv_check_on_pv -- LEAVING with ret: 1
>      <22> pv_reserve_pe -- EAVING with ret: 0
>      <1> lv_setup_for_create -- pv_reserve_pe returned: 0 pe_last: 13  pe:0
>      <1> lv_setup_for_create -- pe: 0
>      <1> lv_setup_for_create 00 LEAVING with ret: 0
>      <1> lvm_dont_interrupt -- CALLED
>      <1> lvm_dont_interrupt -- LEAVING
>      Segmentation fault (core dumped)
>      I wish they are helpful. (Also, I haven't mount any filesystem that they
> are not on hda. So HDC and HDD are definitely un-mounted.)
> Regards,
> 
> --
> Vincent C. Kuo
> vincent_kuo@sercomm.com
> ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
> Take a little time, I will be your friend. ^-^
> ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
> 
> 
> 
> 
> 




-- 
mailto:thecap@usa.net
http://www.ece.utexas.edu/~thecap/
28 70 20 71 2C 65 29 61 9C B1 36 3D D4 69 CE 62 4A 22 8B 0E DC 3E
