From: Erkki Seppala <flux-lvm@inside.org>
Message-Id: <20020126145908.GA19287@xulfad.ton.tut.fi>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Failure to create and _keep_ a filesystem
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
Date: Sat Jan 26 08:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

I seem to be unable to store and keep data on my VG. It's actually the
last drive I'm trying to convert to LVM having quite good success with
it till now.

What I do is this (except potential typos):
vgcreate fast /dev/scsi/host0/bus0/lun0/target10/part1
-> ok
lvcreate -n home -L 30G fast
-> ok
mkreiserfs or mke2fs /dev/fast/home
-> ok
extract data to the volume, use the data
-> ok
reboot
-> after boot the file system is not valid
lvremove /dev/fast/home
-> ok, -BUT- /dev/fast/home inode stays
rm /dev/fast/home; lvcreate ..
-> continue from step 3

It seems that the filesystem has had its 16 first kibibytes zeroed,
both with ext2 and reiserfs. Many of my other volumes have that too,
some are zeroed up to 8KB, but my old /boot-partition has data right
at the beginning. It could be completely normal, I don't know :).

I'm using LVM 1.0.1rc4(ish)(03/10/2001) from kernel 2.4.16, and LVM
1.0.1-release1 from debian unstable, but my initrd-image has older
utilities.

Also I have one non-backupped media-filesystem which I'd really much
like to recover, but I don't think that should be attempted before the
lvm works otherwise :-o.

What I'm now doing is making a traditional filesystem on the
partition, atleast -that- shouldn't be disappearing.

--
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
