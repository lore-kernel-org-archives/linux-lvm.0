Message-ID: <3C115049.90403@kenamea.com>
From: Kenny Gorman <kenny@kenamea.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] You must specify a filesystem type error
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
Date: Fri Dec  7 17:42:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I am utilizing LVM snapshots, and every once in a while I get this 'you 
must specify the filesystem type' error when trying to mount the volume:

$> ./snapshot.sh -s
lvremove -- doing automatic backup of volume group "datagrp"
lvremove -- logical volume "/dev/datagrp/datasnap" successfully removed

lvcreate -- WARNING: the snapshot will be automatically disabled once it 
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for 
"/dev/datagrp/datasnap"
lvcreate -- doing automatic backup of "datagrp"
lvcreate -- logical volume "/dev/datagrp/datasnap" successfully created

mount: block device /dev/datagrp/datasnap is write-protected, mounting 
read-only
mount: you must specify the filesystem type


But it only happens once in a while.   How can I rid myself of this 
issue?  I am on SuSE Linux 7.2 (2.4.7-64GB-smp) with lvm 0.9.1 beta7.

Thanks,
Kenny Gorman
DBA
