From: "tester7 A." <benew666@hotmail.com>
Mime-Version: 1.0
Message-ID: <Sea2-F56SMXQebfaxI10000b3bf@hotmail.com>
Subject: [linux-lvm] LVM2 in a cluster and lvchange.
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
Date: Wed Sep 17 19:40:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I would like to use the LVM in a 2-node cluster. I know that LVM is not 
CLVM, which will be released next year or so, but I would like to use LVM2 
for it.

What I did was follows:

node1:
   pvcreate /dev/sdo
   vgcreate vg10 /dev/sdo
   lvcrete -n test -L20G vg10
   mkreiserfs /dev/vg10/test

Now, I tried to access the newly created LV from node2:
node2# pvscan                            ---------------> is this necesarry?
  PV /dev/sdo   VG vg10   lvm2 [68.36 GB / 48.36 GB free]
  Total: 1 [48.36 GB] / in use: 1 [48.36 GB] / in no VG: 0 [0   ]
node2# vgscan                           ---------------> is this necesarry?
  Reading all physical volumes.  This may take a while...
  Found volume group "vg10" using metadata type lvm2
node2# lvscan                           ---------> it found the lv, but
  inactive          '/dev/vg10/test' [20.00 GB] next free (default)
node2# mount /dev/vg10/test /opt        ---> can not be accessable.
mount: special device /dev/vg10/test does not exist
node2# lvscan -D                                 ------> read from the disk,
  inactive          '/dev/vg10/test' [20.00 GB] next free (default)
node2# mount /dev/vg10/test /opt        ---> still not accessable.
mount: special device /dev/vg10/test does not exist
node2# lvscan -D -b        ---> same with -b option.
  inactive          '/dev/vg10/test' [20.00 GB] next free (default)
node2# mount /dev/vg10/test /opt
mount: special device /dev/vg10/test does not exist
node2# lvchange -ay /dev/vg10/test          ----> changing it to active 
node. (it is active in node1)
node2# mount /dev/vg10/test /opt        --------> now works.

Again, after extending the lv from node1, even tough lv size is shown 
correctly in node2, it can not be accessable, unless 'doing lvchange -an 
/dev/vg10/test ; lvchange -ay /dev/vg10/test'

node1# lvextend -L+10G /dev/vg10/test
  Extending logical volume test to 30.00 GB
  Logical volume test successfully resized

node2:~ # lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg10/test
  VG Name                vg10
  LV UUID                zUjDCv-L774-opXv-fZz8-zZpT-omKv-csr8JM
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                30.00 GB
  Current LE             7680
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:1
node2:~ # resize_reiserfs /dev/vg10/test
resize_reiserfs 3.6.2 (2002)
/dev/vg10/test already is of the needed size. Nothing to be done     
--------> means that block devices tools did not see the extended size yet.

node2:~ # lvchange -an /dev/vg10/test ; lvchange -ay /dev/vg10/test
node2:~ # resize_reiserfs /dev/vg10/test
resize_reiserfs 3.6.2 (2002)
ReiserFS report:
blocksize             4096
block count           7864320 (5242880)
free blocks           7855869 (5234509)
bitmap block count    240 (160)

Syncing..done             ------------------> now it sees the extended 
size...

My question is that 'doing lvchange -an /dev/vg10/test ; lvchage -ay 
/dev/vg10/test' in the other node make the kernel recognize the lv changes. 
Is there any better way or command, becase making inactive temporaryly does 
not make me feel right.

TIA

_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail
