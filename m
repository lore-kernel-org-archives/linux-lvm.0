Return-Path: <glenn@gecpalau.com>
Message-ID: <3AE7D6AA.895E9C79@gecpalau.com>
Date: Thu, 26 Apr 2001 17:04:58 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Cannot unmount my /usr partition.....
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
To: linux-lvm@sistina.com

Hi all!

Great job on LVM...loving it so far..just have a quick question if I
may..

Here is my current setup:
RH 6.2 with misc updates (PAM GlibC etc.)
2.4.3 kernel with LVM Patch and ReiserFS Patch
Compiled in (of special note) are ReiserFS support, DevFS support with
automount at boot option enabled, and LVM 0.9.1Beta7(from patch made in
the PATCHES dir of sourcetree).

Boots fine (better than fine!) and devfs reiser and lvm seem to play
well together while they are running...... but upon shutdown I cannot
unmount my /usr partition for some reason it is busy.

I have hacked the init scripts to let me reboot successfully (as it IS a
production machine with automatic reboot times entered in the cron) but
it cannot deactivate my LVM due to the /usr partition being busy.

Current slicing setup:

LVM Name is warlock1
size is 11.48GB
2.48GB Free

Mount Point    Partition    type        size
/                        /dev/hda4    ext2        2G (not LVM)
/usr           /dev/warlock1/usr  reiserfs  6GB (LVM)
/root        /dev/warlock1/root reiserfs 1GB (LVM)


Any ideas here guys?
Other than that little hiccup, I'm having a GREAT time setting up and
messing with LVM!


Glenn
