Subject: Re: [linux-lvm] error mounting snapshot of ext3 filesystem
In-Reply-To: Your message of
    "22 Jan 2002 13:59:26 CST."
    <1011729567.6638.40.camel@benway.cv.telegroup.com>
References: <1011729567.6638.40.camel@benway.cv.telegroup.com>
MIME-Version: 1.0
From: Pierrick PONS <ppons@cvf.fr>
Message-Id: <E16TOej-0001qC-00@arwen.dev33.cvf>
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
Date: Wed Jan 23 08:46:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Ok, I know that several discussions regarding snapshots have occurred in
> the last month or two and I've tried to read every post from those
> threads.  Nothing I read has helped me solve my problem.
> 
> Essentially, I can create a snapshot LV but I cannot mount it.
> 
> I have compiled 2.4.17 with the lvm101-rc4 patch created from the source
> archive.  (I specified -with-kernel_dir appropriately.)  I tried to
> apply to apply the VFS-lock patch but the kernel would not compile after
> having done so.  (I wasn't sure if I needed this patch or not, but I
> tried applying it anyway.)  It fails like so:
> 
> 
> make[2]: Entering directory `/home/spin/src/linux/fs'
> gcc -D__KERNEL__ -I/home/spin/src/linux/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
> -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2
> -march=i686    -c -o super.o super.c
> super.c: In function `unlockfs':
> super.c:403: `mount_sem' undeclared (first use in this function)
> super.c:403: (Each undeclared identifier is reported only once
> super.c:403: for each function it appears in.)
> make[2]: *** [super.o] Error 1
> 
> 
> Anyway, continuing without VFS lock:
> I have three disks, an IDE disk /dev/hda, and two small SCSI disk,
> /dev/sda and /dev/sdb and one VG with /dev/hda4, and the entirety of
> both SCSI disks in it which is called main. 
> 
> /boot 	/dev/hda3
> / 	/dev/main/root  (entirely on hda4)
> /var	/dev/main/var	(entirely on hda4)
> /tmp	/dev/main/scratch (on both sda and sdb)
> /home	/dev/main/home  (spread out across all three PVs)
> 
> There are some PVs left on sdb, otherwise it's all used.
> All of the filesystems are ext3, except /boot which is ext2.
> 
> This is basically the sequence of events:
> 
> [root@benway /]# lvcreate -s -n snaptest -L 200m /dev/main/root 
> lvcreate -- WARNING: the snapshot will be automatically disabled once it
> gets full
> lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for
> "/dev/main/snaptest"
> lvcreate -- doing automatic backup of "main"
> lvcreate -- logical volume "/dev/main/snaptest" successfully created
> 
> [root@benway /]# mount /dev/main/snaptest /mnt
> mount: block device /dev/main/snaptest is write-protected, mounting
> read-only
> mount: wrong fs type, bad option, bad superblock on /dev/main/snaptest,
>        or too many mounted file systems
> 
> Trying to mount it as ext2 doesn't change anything.  No matter which LV
> I create the snapshot of, I cannot mount it and it fails with the same
> error.  
> 
> Even if I create a small LV with ext3 filesystem entirely on sdb, and
> then create a snapshot of it, it still won't mount.  I can get this
> small-all-on-one LV/FS scenario to work if I create an ext2 fs on the
> LV.  
> 
> I know this is nearly exactly like the problems discussed in previous
> threads but I haven't seen a solution yet that seems like it applied to
> my situation.  
> 
> Thanks,
> Aran
>   
> 
> 

I do have the same problem :

mount /dev/testlvm/snap /mnt/snap 
mount: block device /dev/testlvm/snap is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on /dev/testlvm/snap,
       or too many mounted file systems

I tried with -text2 or -text3 option and it's the same. 
What is the type wanted  ?

Is there a more documentated snapshot section where to found some more 
explanation ?

Thanks in advance.


Pierrick
