From: markus <pr1v8@t4.sk>
Message-Id: <20020219214522.A8326@star.orbisartis.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm and crypto: is there a way to resize it ?
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
Date: Tue Feb 19 14:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi all 

i have tried to mount logical volume due aes cipher enabled loop device
... 
	patch writen by Jari Ruusu <jari.ruusu@pp.inet.fi>
	package can be found at: http://loop-aes.sourceforge.net/
..
i have tried to add physical volume to my volumegroup and migrate the
encrypted data from one physical volume to another.
everything worked well  ... i had no data corruption or lose.

i have tried to add a physical volume and extend the logical volume too
but i did encounter a problem when i wanted to resize the reiserfs i use

base:~# pvcreate /dev/ide/host2/bus0/target0/lun0/part1
pvcreate -- physical volume "/dev/ide/host2/bus0/target0/lun0/part1"
successfully created

base:~# vgextend t4 /dev/ide/host2/bus0/target0/lun0/part1
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- doing automatic backup of volume group "t4"
vgextend -- volume group "t4" successfully extended

base:~# lvextend -L+27.95G /dev/t4/mothafuck
lvextend -- rounding size to physical extent boundary
lvextend -- extending logical volume "/dev/t4/mothafuck" to 31.84 GB
lvextend -- doing automatic backup of volume group "t4"
lvextend -- logical volume "/dev/t4/mothafuck" successfully extended

base:~# resize_reiserfs -f /dev/t4/mothafuck

<-------------resize_reiserfs, 2001------------->
reiserfsprogs 3.x.0j
reiserfs_open: neither new nor old reiserfs format found on
/dev/t4/mothafuck

resize_reiserfs: no reiserfs found on the device

this is correct since everything there is encrypted ... 

base:~# resize_reiserfs -f /dev/loop1

<-------------resize_reiserfs, 2001------------->
reiserfsprogs 3.x.0j

resize_reiserfs: can't find mount entry

but this is not usable to :[

base:~# grep -v '^#' /etc/fstab
/dev/hda1       /               ext2    defaults,errors=remount-ro
0       1
/dev/hda3       none            swap    swap                    0
0
proc            /proc           proc    defaults
0       0
/dev/t4/mothafuck /glftpd/site reiserfs
rw,defaults,noauto,loop=/dev/loop1,encryption=AES128 0 0

i have tried to fake the entry in fstab too .. but i did not help

i there anyone who uses something similar ? 

i'll be happy for any advice
anybody can help me out pleas ?

Cheers
	mark 

ps: i am sorry for my bad english :)
