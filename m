Date: Thu, 10 Feb 2000 15:13:16 +0000 (GMT)
From: James Pattinson <jamesp@subdimension.com>
Subject: [linux-lvm] Recovering a PV VGDA
Message-ID: <Pine.LNX.4.10.10002101440220.748-100000@fuse.jj.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi -

I had problems last night with one of my 4 disks in my VG. I was trying
different things and somehow I managed to corrupt the VGDA on on the
disks. This caused vgscan to fail with an error -154. I'm sorry but I
forgot the actual text :)

I booted into a resuce disk I had with all the LVM tools on it, and I was
able to run lvmdiscscan etc to see what was going on. I found i was caught
in a catch 22 situation as I couldn't run vgcfgrestore because it wanted
me to run vgscan first. I eventually had to restore /etc/lvm* from DAT and
then I could make vgcfgrestore restore my VGDA to all the disks (as I
didn't really know which disk was failling!)

So, what is the best way of doing this kind of work? and also, how would I
tell what disk is preventing vgscan from working? I tried 'strace'ing it
but that wasn't very helpful. And of course most of the other vg/pv/lv
commands were useless as they all wanted me to run vgscan... :)

Cheers!

James
