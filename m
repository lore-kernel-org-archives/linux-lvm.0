Message-Id: <1010588497.3c3c5b5182e7e@www.snappymail.ca>
From: IpSo <ipso@snappymail.ca>
Subject: Re: [linux-lvm] A way to bypass LVM and extract the raw data off?
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
    <1010343969.3c38a0214056f@www.snappymail.ca>
    <20020106152433.Q12868@lynx.no>
    <1010359883.3c38de4b3692f@www.snappymail.ca>
    <1010543196.3c3baa5c40c49@www.snappymail.ca>
    <20020108200408.R769@lynx.adilger.int>
In-Reply-To: <20020108200408.R769@lynx.adilger.int>
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
Date: Wed Jan  9 09:02:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Well, I gave this a shot and everything seemed promising until I mounted the
loop back file.

dd if=/dev/hda bs=512 skip=4670127 count=35461377 of=/big/backup_hda6.bin

-rw-r--r--    1 root     root     17105949184 Jan  8 22:05 backup_hda6.bin

File size seems about right. 

[root@ipso big]# mount -o loop ./backup_hda6.bin /test -t reiserfs
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems

Understandable...

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

Seems like it found a backup super block, bitmaps, etc... Though "Filesystem
state ERROR" doesn't look so good, but no errors so, lets try a rebuild.

[root@ipso big]# reiserfsck --rebuild-tree ./backup_hda6.bin
reiserfsck, 2001 - reiserfsprogs 3.x.0j

This is an experimental version of reiserfsck, MAKE A BACKUP FIRST!
Don't run this program unless something is broken.
Some types of random FS damage can be recovered
from by this program, which basically throws away the internal nodes
of the tree and then reconstructs them.  This program is for use only
by the desperate, and is of only beta quality.  Email
reiserfs@devlinux.com with bug reports.
Will rebuild the filesystem tree
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: bitmap 0 was marked free
reiserfs_open: first bitmap looks corrupted
reiserfs_open: bitmap 1 was marked free
reiserfs_open: bitmap 2 was marked free
reiserfs_open: bitmap 4 was marked free
reiserfs_open: bitmap 5 was marked free
reiserfs_open: bitmap 6 was marked free
reiserfs_open: bitmap 9 was marked free
reiserfs_open: bitmap 12 was marked free
reiserfs_open: bitmap 13 was marked free
reiserfs_open: bitmap 18 was marked free
reiserfs_open: bitmap 22 was marked free
reiserfs_open: bitmap 25 was marked free
reiserfs_open: bitmap 26 was marked free
reiserfs_open: bitmap 29 was marked free
reiserfs_open: bitmap 30 was marked free
reiserfs_open: bitmap 41 was marked free
reiserfs_open: bitmap 42 was marked free
reiserfs_open: bitmap 44 was marked free
reiserfs_open: bitmap 46 was marked free
reiserfs_open: bitmap 49 was marked free
reiserfs_open: bitmap 55 was marked free
reiserfs_open: bitmap 56 was marked free
reiserfs_open: bitmap 59 was marked free
reiserfs_open: bitmap 62 was marked free
reiserfs_open: bitmap 63 was marked free
reiserfs_open: bitmap 64 was marked free
reiserfs_open: bitmap 65 was marked free
reiserfs_open: bitmap 67 was marked free
reiserfs_open: bitmap 70 was marked free
reiserfs_open: bitmap 71 was marked free
reiserfs_open: bitmap 75 was marked free
reiserfs_open: bitmap 76 was marked free
reiserfs_open: bitmap 77 was marked free
reiserfs_open: bitmap 80 was marked free
reiserfs_open: bitmap 81 was marked free
reiserfs_open: bitmap 82 was marked free
reiserfs_open: bitmap 83 was marked free
reiserfs_open: bitmap 85 was marked free
reiserfs_open: bitmap 86 was marked free
reiserfs_open: bitmap 87 was marked free
reiserfs_open: bitmap 88 was marked free
reiserfs_open: bitmap 93 was marked free
reiserfs_open: bitmap 96 was marked free
reiserfs_open: bitmap 97 was marked free
reiserfs_open: bitmap 98 was marked free
reiserfs_open: bitmap 100 was marked free
reiserfs_open: bitmap 101 was marked free
reiserfs_open: bitmap 102 was marked free
reiserfs_open: bitmap 103 was marked free
reiserfs_open: bitmap 109 was marked free
reiserfs_open: bitmap 110 was marked free
reiserfs_open: bitmap 111 was marked free
reiserfs_open: bitmap 113 was marked free
reiserfs_open: bitmap 115 was marked free
reiserfs_open: bitmap 116 was marked free
reiserfs_open: bitmap 117 was marked free
reiserfs_open: bitmap 118 was marked free
reiserfs_open: bitmap 119 was marked free
reiserfs_open: bitmap 120 was marked free
reiserfs_open: bitmap 121 was marked free
reiserfs_open: bitmap 129 was marked free
reiserfs_open: bitmap 132 was marked free
Analyzing journal..nothing to replay (no transactions match to latest mount id)
Rebuilding..
Loading on-disk bitmap .. Fetching on-disk bitmap..fetch_bitmap: on-disk bitmap
is not padded p
roperly
done
2036947 bits set - done
Skipping 74 blocks (super block, journal, bitmaps) 2036873 blocks will be read

Pass 0 (2036873 (of 4432672) blocks will be read):
0%....20%....40%....60%....80%....100%                         left 0, 795 /sec
Looking for allocable blocks .. ok
        Read blocks (but not data blocks) 2036873
                Leaves among those 1
                Blocks pointed by indirect items 96
                        - once 96
                Objectids found 50
        allocable 4424229 blocks

Pass1:
0%....20%....40%....60%....80%....100%                           left 0, 0 /sec
        1 leaves read
                1 inserted
Tree is built. Checking it - done
Syncing..done
Pass 3 (semantic):
dir 1 2 has wrong sd_size 48, has to be 80
        Files found: 0
        Directories found: 2
Pass 3a (looking for lost files):
Looking for lost directories:
Looking for lost files:0 /sec
        Objects without names 46
        Files linked to /lost+found 46
Pass 4 - done           left 2, 0 /sec
        Deleted unreachable items 1
Syncing..done
Done
[root@ipso big]# mount -o loop ./backup_hda6.bin /test -t reiserfs

Mounts fine now...

[root@ipso big]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda5              2079404   1895672    183732  92% /
/dev/big/1            18742720  17781164    961556  95% /big
none                    192356         0    192356   0% /dev/shm
/big/backup_hda6.bin  17730140     33228  17696912   1% /test

Uhh, what happened to all the data? And theres no lost+found directory either.
There _should_ be perfectly good data on /dev/hda6, just LVM won't let me access
it. Do any LVM commands modify the data itself? Should this have worked?

Thanks.   


Quoting Andreas Dilger <adilger@turbolabs.com>:

> On Jan 08, 2002  18:26 -0800, IpSo wrote:
> > Well, it doesn't look like there is a way I can recover my LVM volume
> groups
> > and whatnot. (See below) But I know theres a fully intact ReiserFS of
> 17315mb
> > on /dev/hda6. "gpart" scanned my disk and came up with this: 
> > 
> > Possible extended partition at offset(249mb)
> >    Possible partition(Linux LVM physical volume), size(17315mb),
> offset(2280mb)
> >       type: 142(0x8E)(Linux LVM physical volume)
> >       size: 17315mb #s(35461377) s(4670127-40131503)
> >       chs:  (1023/15/63)-(1023/15/63)d (4633/1/1)-(39812/15/63)r
> >       hex:  00 0F FF FF 8E 0F FF FF AF 42 47 00 01 19 1D 02
> > 
> > End scan.
> > 
> > Is there some way to "dd" the data off onto another partition and access
> it
> > there? Because I know the filesystem was only on a single PV, and a
> single
> > LV, and the problems occured when trying to extend that LV, but I never
> got
> > to the point of extending the filesystem itself with reiser_resize. You
> > would think I could somehow using the offsets given above create a new
> > partition to copy the data to, run a reiserfsck and rebuild the file
> system
> > so I can access the data? Has anyone tryed something along these lines
> before?
> 
> dd if=/dev/hda bs=512 skip=4670127 count=35461377 of=<somewhere>
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
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
