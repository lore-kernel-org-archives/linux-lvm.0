Message-Id: <3C840EBE.50308@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Migrating root problems... (svetljo)
References: <E16hphK-00042P-00@hermes.sistina.com>
    <032101c1c3d5$36ab4950$02001aac@q3x.net>
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
Date: Mon Mar  4 18:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>>>title Net Hat Linux (2.4.7-10) VLM Support
>>>        root (hd0,0)
>>>        kernel / boot/vmlinuz-2.4.7-10feb2002 mem=250M ramdisk=5038 ro
>>>root=/dev/q3xvol/ro
>>>        initrd / boot/initrd-lvm-2.4.7-10feb2002.gz
>>>
>>isn't it mentioned in the how-to smth about ramdisk ~8000
>>you can try to append at boot ramdisk_size=10000 or smth bigger
>>and option ramdisk seems to be depricated
>>
>
>Sorry, but I doesn't understand you....
>


snip from linux/Documentation/kernel-parameters.txt

--------------------------------------------------------------------------- 
---------------
    raid=        [HW,RAID]

    ramdisk=    [RAM] Sizes of RAM disks in kilobytes [deprecated].

    ramdisk_blocksize=
            [RAM]
 
    ramdisk_size=    [RAM] New name for the ramdisk parameter.
---------------------------------------------------------------------------------------------

and from the lvm how-to
http://www.sistina.com/lvm_howtos/lvm_howto/Converting_a_root_filesys.html
---------------------------------------------------------------------------------------------

   1. Add an entry in /etc/lilo.conf for LVM

      This should look similar to the following:

  image   = /boot/KERNEL_IMAGE_NAME
  label   = lvm
  root    = /dev/vg/root
  initrd  = /boot/INITRD_IMAGE_NAME
  ramdisk = 8192

      Where KERNEL_IMAGE_NAME is the name of your LVM enabled kernel,
      and INITRD_IMAGE_NAME is the name of the initrd image created by
      lvmcreate_initrd. The ramdisk line may need to be increased if you
      have a large LVM configuration, but 8192 should suffice for most
      users. The default ramdisk size is 4096. If in doubt check the
      output from the lvmcreate_initrd command, the line that says:

lvmcreate_initrd -- making loopback file (6189 kB)

      and make the ramdisk the size given in brackets.

------------------------------------------------------------------------------------------------

>>>Kernel panic: I have not root and I want to scream.
>>>
>>is there nothing about "trying to read beyond end of device "
>>
>
>No!
>
hm i suppose i have to find some documentation about grub
but i'll do in 9-10 hours ( my clock shouts 01:15 )

are you useing devfs
could you send me your initrd-lvm-2.4.7-10feb2002.gz

>>could you post your fstabs
>>
>
>My fstab file:
>
>/dev/q3xvol/root         /                       ext2    defaults        1 1
>/dev/hda1               /boot                   ext2    defaults        0 2
>none                    /dev/pts                devpts  gid=5,mode=620  0 0
>none                    /proc                   proc    defaults        0 0
>none                    /dev/shm                tmpfs   defaults        0 0
>/dev/cdrom              /mnt/cdrom              iso9660
>noauto,owner,kudzu,ro 0 0
>/dev/fd0                /mnt/floppy             auto    noauto,owner,kudzu 0
>0
>/dev/hdb1               swap                    swap    defaults        0 0
>
