Message-Id: <1010599408.3c3c85f02893b@www.snappymail.ca>
From: IpSo <ipso@snappymail.ca>
Subject: Re: [linux-lvm] A way to bypass LVM and extract the raw data off?
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
    <1010343969.3c38a0214056f@www.snappymail.ca>
    <20020106152433.Q12868@lynx.no>
    <1010359883.3c38de4b3692f@www.snappymail.ca>
    <1010543196.3c3baa5c40c49@www.snappymail.ca>
    <20020108200408.R769@lynx.adilger.int>
    <1010588497.3c3c5b5182e7e@www.snappymail.ca>
    <20020109172947.A24522@fb0442.mathematik.tu-darmstadt.de>
In-Reply-To: <20020109172947.A24522@fb0442.mathematik.tu-darmstadt.de>
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
Date: Wed Jan  9 12:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Holger Grothe <grothe@mathematik.tu-darmstadt.de>:

> 
> IMHO the wrong way. To my experience the mount error message indicates
> a "bad filesystem structure", which means you skipped a wrong number of 
> blocks when using dd.
> 
> > Uhh, what happened to all the data? And theres no lost+found directory
> either.
> 
> Due to the "bad filesystem structure" the filesystem is _more_ or less
> initialised by the reiserfsck command. reiserfs has no lost+found
> directory.
> 
> > > > Possible extended partition at offset(249mb)
> > > >    Possible partition(Linux LVM physical volume), size(17315mb),
> > > offset(2280mb)
> > > >       type: 142(0x8E)(Linux LVM physical volume)
> > > >       size: 17315mb #s(35461377) s(4670127-40131503)
>                                          ^^^^^^^
> If I'am right this means sectors #4670127 to #40131503 (35461377 sectors)
> are used for the volume. Therfore the dd command should skip only the
> first 4670126 sectors:
>   dd if=/dev/hda bs=512 skip=4670126 count=35461377 of=/big/backup_hda6.bin
>                              ^^^^^^^
> Please try.


Hrmm, No luck. You figure having to reiserfsck with --rebuild isn't going to
help eh? That partition information above is what gpart "guessed", so its likely
this is wrong? Is there a more reliable way to get the offsets by chance? 

Thanks.


dd if=/dev/hda bs=512 skip=4670126 count=35461377 of=/big/backup_hda6.bin

[root@ipso big]# mount -o loop ./backup_hda6.bin /test -t reiserfs
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems

[root@ipso big]# reiserfsck ./backup_hda6.bin 
reiserfsck, 2001 - reiserfsprogs 3.x.0j
Will read-only check consistency of the partition
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: neither new nor old reiserfs format found on ./backup_hda6.bin
reiserfsck: --rebuild-sb may restore reiserfs super block
[root@ipso big]# reiserfsck --rebuild-sb ./backup_hda6.bin
reiserfsck, 2001 - reiserfsprogs 3.x.0j
Will check SB and rebuild if it is needed
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: neither new nor old reiserfs format found on ./backup_hda6.bin

what is version of ReiserFS you use[1-4]
        (1)   3.6.x
        (2) >=3.5.9
        (3) < 3.5.9 converted to new format
        (4) < 3.5.9
        (X)   exit
1
Super block of format 3.6 found on the 0x3 in block 16
Block count 4432672
Blocksize 4096
Free blocks 0
Busy blocks (skipped 16, bitmaps - 136, journal blocks - 8193
1 super blocks, 4424326 data blocks
Root block 0
Journal block (first) 18
Journal dev 0
Journal orig size 8192
Filesystem state ERROR
Tree height 0
Hash function used to sort names: not set
Objectid map size 0, max 972
Version 2
Is this ok ? [N/Yes]: Yes

Do not forget to run reiserfsck --rebuild-tree


[root@ipso big]# mount -o loop ./backup_hda6.bin /test -t reiserfs
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems



> 
> Holger
> -- 
> Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
> Fachbereich Mathematik, TU Darmstadt
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 


IpSo

--------------------------------------------------------------------
Never worry about viruses in your Email again.
Get your FREE! virus scanned Email accounts at http://snappymail.ca
