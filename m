Message-Id: <032101c1c3d5$36ab4950$02001aac@q3x.net>
From: "NoAntz" <noantz@yahoo.com>
References: <E16hphK-00042P-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Migrating root problems... (svetljo)
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
Date: Mon Mar  4 17:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks Svetljo!

>> title Net Hat Linux (2.4.7-10) VLM Support
>>         root (hd0,0)
>>         kernel / boot/vmlinuz-2.4.7-10feb2002 mem=250M ramdisk=5038 ro
>> root=/dev/q3xvol/ro
>>         initrd / boot/initrd-lvm-2.4.7-10feb2002.gz
>>
>isn't it mentioned in the how-to smth about ramdisk ~8000
>you can try to append at boot ramdisk_size=10000 or smth bigger
>and option ramdisk seems to be depricated

Sorry, but I doesn't understand you....


>> hdb:<7> LDM:  DEBUG (ldm.c, 876): validate_partition_table: Found
>> basic MS-DOS partition, not to dynamic disk.
>> hdb1
>> hdc:<7> LDM:  DEBUG (ldm.c, 876): validate_partition_table: Found
>> basic MS-DOS partition, not to dynamic disk.
>> hdc1
>> Floppy drive(s): fd0 is 1.44M
>> .
>>
>thats not important, it simply says that you don't have  win2k/ winXP
>dynamic disks

Ok!

>> Kernel panic: I have not root and I want to scream.
>>
>is there nothing about "trying to read beyond end of device "

No!

> could you post your fstabs

My fstab file:

/dev/q3xvol/root         /                       ext2    defaults        1 1
/dev/hda1               /boot                   ext2    defaults        0 2
none                    /dev/pts                devpts  gid=5,mode=620  0 0
none                    /proc                   proc    defaults        0 0
none                    /dev/shm                tmpfs   defaults        0 0
/dev/cdrom              /mnt/cdrom              iso9660
noauto,owner,kudzu,ro 0 0
/dev/fd0                /mnt/floppy             auto    noauto,owner,kudzu 0
0
/dev/hdb1               swap                    swap    defaults        0 0

Thnaks, in advance!



_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
