Return-Path: <vegard@engen.priv.no>
Date: Tue, 17 Apr 2001 22:08:04 +0200
Message-ID: <20010417220804.T31343@engen.priv.no>
Mime-Version: 1.0
Content-Disposition: inline
From: Vegard Engen <vegard@engen.priv.no>
Subject: [linux-lvm] Strangenesses with snapshots, 0.9.1-beta6.
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

The two last days I started testing 0.9.1-beta6 for my home-machine, hoping to get rid of the everlasting partitioning pain. Trying out the snapshots, I get
worrying errors when making a full backup of my ~4 GB /home partition. This is
a pretty long mail demonstrating the error....

I'm using kernel 2.4.3, with ext2 filesystems on the logical volumes. The
kernel is patched with LVM 0.9.1-beta6 patches, and these patches succeeded.
I followed the instructions and made a lvm-0.9.1_beta6-2.4.3.patch - which
applied flawlessly to the kernel.

I have made the following backup-script as a test:
----- snip ------
#!/bin/sh
if [ -e /dev/backup/home ] ; then
  umount /dev/backup/home;
  lvremove -f /dev/backup/home;
fi
if [ -e /dev/vg/backup ] ; then
  umount /dev/vg/backup
  lvremove -f /dev/vg/backup
fi

lvcreate -L 1000M -s -n backup /dev/vg/nhome
mount /dev/vg/backup /mnt/backup
lvcreate -L 5000M -n home backup
mount /dev/backup/home /mnt/bhome
cp -a /mnt/backup/* /mnt/bhome
----- snip ------

I tried it out. There was very little activity at all on the system when
running this, so filling up the snapshot-volume is not an issue here.

Well, the following is output from the script. This is a little long - I'm commenting inside the output, so please read....

middagspynten:/usr/local/sbin# ./backup_home.sh 
lvcreate
lvcreate -- WARNING: the snapshot must be disabled if it gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/vg/backup"
lvcreate -- doing automatic backup of "vg"
lvcreate -- logical volume "/dev/vg/backup" successfully created

mount: block device /dev/vg/backup is write-protected, mounting read-only
lvcreate
lvcreate -- doing automatic backup of "backup"
lvcreate -- logical volume "/dev/backup/home" successfully created

[*** these are normal files and are indeed readable in the normal /home ***]

cp: `/mnt/backup/vegard/Mail/irc/ircd-users/356' has unknown file type
cp: `/mnt/backup/vegard/Mail/cups/343' has unknown file type
cp: `/mnt/backup/vegard/Mail/cups/344' has unknown file type
cp: `/mnt/backup/vegard/Mail/cups/346' has unknown file type

[ *** some debug *** ]
This works:
middagspynten:/home/vegard/Mail/irc/ircd-users# cat 356

This is quite strange:
middagspynten:/mnt/backup/vegard/Mail/irc/ircd-users# ls -l 356
?--sr-srw-  15370 1734492719 1868774980 4482544195540565054 Feb 17  2003 356
middagspynten:/mnt/backup/vegard/Mail/irc/ircd-users# cat 356
cat: 356: Invalid argument

[ *** End debug, continue log *** ]

cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/314': Input/output error
cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/315': Input/output error
cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/316': Input/output error
cp: cannot stat `/mnt/backup/vegard/Mail/unix/openldap-general/317': Input/output error

[ *** This is another strangeness *** ]
middagspynten:/mnt/backup/vegard/Mail/unix/openldap-general# ls -l
.....
-rw-------    1 vegard   vegard       3454 Dec 11  1999 309
-rw-------    1 vegard   vegard       4530 Sep  9  1999 31
-rw-------    1 vegard   vegard       4147 Dec 11  1999 310
-rw-------    1 vegard   vegard       3294 Dec 11  1999 311
-rw-------    1 vegard   vegard       3452 Dec 11  1999 312
-rw-------    1 vegard   vegard       5775 Dec 13  1999 313
-rw-------    1 vegard   vegard       3292 Dec 22  1999 318
-rw-------    1 vegard   vegard       4318 Dec 22  1999 319
-rw-------    1 vegard   vegard       4384 Sep 11  1999 32
.....
middagspynten:/mnt/backup/vegard/Mail/unix/openldap-general# cat 314
314: Input/output error

This works:
middagspynten:/mnt/backup/vegard/Mail/unix/openldap-general# cat 318

[ *** These are the same as the first one *** ]
cp: `/mnt/backup/vegard/Mail/inbox/234' has unknown file type
cp: `/mnt/backup/vegard/Mail/inbox/235' has unknown file type
cp: `/mnt/backup/vegard/Mail/inbox/236' has unknown file type
cp: `/mnt/backup/vegard/Mail/inbox/237' has unknown file type

[ *** This *is* actually an error in my .procmailrc and the name of the
directory ;-) - the \255 is actually an \xad, though, so it's not an \255.
But, apart from that, it's exactly like the second case *** ]

cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/233': Input/output error
cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/234': Input/output error
cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/235': Input/output error
cp: cannot stat `/mnt/backup/vegard/Mail/linux/tecra\255linux/236': Input/output error

[ *** This is a third strangeness - and more worrying for me, because this
time, it *works* in the snapshot volume, but gets corrupted on the copy *** ]

cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/357': No such device or address
cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/358': No such device or address
cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/359': No such device or address
cp: cannot create regular file `/mnt/bhome/vegard/Mail/linux/linux-net/360': No such device or address

[ **** Debugging on the above problem **** ]
middagspynten:/mnt/backup/vegard/Mail/linux/linux-net# ls -l 359
-rw-------    1 vegard   vegard       5351 Dec  6  1999 359

This file is also cat'able.

But:
middagspynten:/mnt/bhome/vegard/Mail/linux/linux-net# ls -l 359
s-wx------    1 3233857728 3233857728        0 May 17  1936 359
middagspynten:/mnt/bhome/vegard/Mail/linux/linux-net# cat 359
cat: 359: No such device or address

[ *** Here, I don't know what happened. Thie is a workable file on /mnt/backup,
but in /mnt/bhome it turns into a directory, which it later tries to
overwrite *** ]
cp: cannot overwrite directory `/mnt/bhome/vegard/Mail/linux/linux-usb/111' with non-directory

[ *** The rest is cases described before *** ]


This is looks like pretty serious bugs to me. This seemed only to happen down
in my MH-directories. For those who doesn't know, MH is a mailfolder system
which stores each mail in one file, which it names according to the message
number in the folder. However, the MH-directory compromises quite a lot of
my home-directory, too, I think I counted it to ~ 80.000 files, last I counted.
Statistically, it's still strange that it shouldn't happen in the rest of
my /home partition, as the rest isn't exactly insignificant either. So I
*think* it must be somehow related to MH or how MH folders look like. Perhaps
something with the size of directories, or the number of levels in the
directory hierarchy. But this is only guesswork.

It does, however, seem to work on the real /home, I've not yet discovered any
errors here.

- Vegard
