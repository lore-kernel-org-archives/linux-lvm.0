Message-Id: <3C80C540.5070608@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Migrating root problems...
References: <OE72ABifXNQAsPIUllI00010bae@hotmail.com>
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
Date: Sat Mar  2 06:26:07 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>  
> I am trying to install the LVM v1.0.3 in a RedHat 7.2 but I have some 
> problems. I am following the HowTo ( 
> http://www.sistina.com/lvm_howtos/lvm_howto) and I have carried out 
> the steps there suitable. I recompiled Kernel to be able to support 
> LVM etc... At the moment I have the following hard disks: 
>  
> / dev/hda1 ext2  (Linux native) 
> / dev/hdb1 swap  (Linux swap) 
> / dev/hdc1 ext2  (LVM volume) 
>  
> In the / dev/hda1 has installed the current RedHat, but what I attempt 
> is migrate the / to a LVM volume (following the howto 
> http://www.sistina.com/lvm_howtos/lvm_howto/Converting_a_root_filesys.html 
> ) but here it is where I have problems. The unit LVM is created and it 
> is activated in the boot process. I have copied the whole content of 
> the / less /boot directory. The problem comes when wanting to pull up 
> Linux having the / in the volume LVM (/dev/hdc1). The modifications of 
> the one in the /etc/fstab of the /dev/hdc1 is carried out, as well as 
> the creation of the initrd and in the grub I have added the correct 
> option to be able to start up: 
>  
> title Net Hat Linux (2.4.7-10) VLM Support 
>         root (hd0,0) 
>         kernel / boot/vmlinuz-2.4.7-10feb2002 mem=250M ramdisk=5038 ro 
> root=/dev/q3xvol/ro 
>         initrd / boot/initrd-lvm-2.4.7-10feb2002.gz 
>
isn't it mentioned in the how-to smth about ramdisk ~8000
you can try to append at boot ramdisk_size=10000 or smth bigger
and option ramdisk seems to be depricated
 

> When I start up and I select this option and the system it begins to 
> start up.... but shortcomings take place: 
>

> . 
> hdb:<7> LDM:  DEBUG (ldm.c, 876): validate_partition_table: Found 
> basic MS-DOS partition, not to dynamic disk. 
> hdb1 
> hdc:<7> LDM:  DEBUG (ldm.c, 876): validate_partition_table: Found 
> basic MS-DOS partition, not to dynamic disk.   
> hdc1 
> Floppy drive(s): fd0 is 1.44M 
> . 
>
thats not important, it simply says that you don't have  win2k/ winXP 
dynamic disks

>  
> . 
> NET4 LinuxIPX 0.47 for NET4.0 
> IPX Portions Copyright (c) 1995 Boiler, Inc 
> IPX Portions Copyright (c) 2000, 2001 Conectiva, Inc 
> Kernel panic: I have not root and I want to scream.
>
is there nothing about "trying to read beyond end of device "

>  
>
> And the system stops having that reeboot. It seems that he doesn't 
> find or it cannot mount the root. Does somebody know what it happens? 
> Some idea? 
>  
> Thank you for the help!
>
could you post your fstabs
