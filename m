From: Laurentiu Simion <lsimion@rogers.com>
In-Reply-To: <20020308235001.C12196@golem.blacknet.de>
References: <3C83AD42.20301@theiqgroup.com>
    <20020305002428.B13751@sistina.com> <3C85289C.8060606@theiqgroup.com>
    <20020305223226.A19035@sistina.com> <3C854B93.2060402@theiqgroup.com>
    <3C87A0A3.8080605@theiqgroup.com> <20020308094454.C519@sistina.com>
    <20020308021214.I1566@turbolinux.com> <20020308133510.A1267@sistina.com>
    <20020308235001.C12196@golem.blacknet.de>
Content-Transfer-Encoding: 7bit
Message-Id: <1015696110.3149.10.camel@cr227180-a>
MIME-Version: 1.0
Subject: [linux-lvm] Mounting Reiserfs errors
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
Date: Sat Mar  9 11:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am running LVM with ext3 and recently with Reiserfs on Mandrake 8.1
(kernel 2.4.8-26) I had no problems for quite a time with ext3 but when
I have tried to play with Reiserfs I've got into big big trouble.

This is the /proc/lmv/global listing:

------------------------------------------------------------------------
LVM module version LVM 0.9.1_beta7(ish) (20 June 2001)

Total:  2 VGs  3 PVs  5 LVs (4 LVs open 4 times)

Global: 44714 bytes malloced   IOP version: 10   0:09:22 active

VG:  system  [1 PV, 4 LV/4 open]  PE Size: 4096 KB
  Usage [KB/PE]: 9043968 /2208 total  6963200 /1700 used  2080768 /508
free
  PV:  [AA] ide/host0/bus0/target0/lun0/part6  9043968 /2208     6963200
/1700     2080768 /508   
    LVs: [AWDL  ] 1                           409600 /100      1x open
         [AWDL  ] 2                          5201920 /1270     1x open
         [AWDL  ] 3                           716800 /175      1x open
         [AWDL  ] 4                           634880 /155      1x open

VG:  depot  [2 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 4321280 /1055 total  2097152 /512 used  2224128 /543
free
  PVs: [AA] ide/host0/bus0/target0/lun0/part7  2064384 /504      2064384
/504            0 /0     
       [AA] ide/host0/bus0/target0/lun0/part8  2256896 /551        32768
/8        2224128 /543   
    LV:  [AWDL  ] lvol1                      2097152 /512      close
--------------------------------------------------------------------------

The VG with problems is "depot". Is split on 2 disk partitions and has
one LV using half of the space.
I was able at the beginning to mount /dev/depot/lvol1 as reiserfs but
after a FS resize I've got the following error trying to mount the FS:

# mount -t reiserfs /dev/depot/lvol1 /u0
mount: wrong fs type, bad option, bad superblock on /dev/depot/lvol1,
       or too many mounted file systems

I was running all the possible checks on /dev/depot/lvol1 as per below:

# reiserfsck /dev/depot/lvol1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/depot/lvol1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Y
[root@cr227180-a lvm]# reiserfsck /dev/depot/lvol1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/depot/lvol1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Sat Mar  9 12:44:21 2002
###########
reiserfs_fetch_ondisk_bitmap: bread failed reading bitmap (491520)
Replaying journal..
0 transactions replayed
Checking S+tree..ok                        
Comparing bitmaps..on-disk bitmap does not match to the correct one.
32767 bits differ
on-disk bitmap does not match to the correct one.
Checking Semantic tree...
ok
There were found 1 corruptions which can be fixed with --fix-fixable
###########
reiserfsck finished at Sat Mar  9 12:44:26 2002
###########

I forced a FS repair but it will not repair. It seems there are no major
corruptions on the FS, but I cannot mount.

# reiserfsck /dev/depot/lvol1 --fix-fixable

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will check consistency of the filesystem on /dev/depot/lvol1
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Sat Mar  9 12:45:34 2002
###########
reiserfs_fetch_ondisk_bitmap: bread failed reading bitmap (491520)
Replaying journal..
0 transactions replayed
Checking S+tree..ok                        
Comparing bitmaps..on-disk bitmap does not match to the correct one.
32767 bits differ
Trying to fix bitmap ..
 bitmaps were not recovered. 
	You can either run rebuild-tree or live with some leaked space
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
	Leaves 658
	Internal nodes 6
	Directories 106
	Other files 2335
	Data block pointers 133863 (zero of them 0)
	Safe links 0
###########
reiserfsck finished at Sat Mar  9 12:45:40 2002
###########

I have upgraded the LVM module to 1.0.1.-rc4 in a 2.4.18 Kernel, but
nothing is changed.

Can somebody show me light at the end of the tunnel PLEASE?

Thanks in advance,

Laurentiu
