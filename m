Message-ID: <3A0694E7.52D2AF89@fl.priv.at>
Date: Mon, 06 Nov 2000 12:24:23 +0100
From: Friedrich Lobenstock <fl@fl.priv.at>
MIME-Version: 1.0
Subject: [linux-lvm] / on LVM - what to do on shutdown?
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi!

I have a problem because I don't know what to do when / is on lvm.

Currently /sbin/init.d/halt does the following (/ is not on lvm):

  [..]
  echo "Unmounting file systems"
  umount -avt noproc,nonfs 
  [..]
  umount -anvt proc
  
  if test -d /etc/lvmtab.d -a -x /sbin/vgchange ; then
      /sbin/vgchange -a n
  fi
  
  [..]
  mount -no remount,ro / 2> /dev/null
  sync                
  [..]
  halt -d -f


Now what if / is on lvm? Should I really call "/sbin/vgchange -a n" ?
What are with the commands afterwards will they fail or might
the lvm device get mixed up because of not correctly closing it?
Or should I load a ramdisk to do the work, if at all possible?

I think the md-Device does a clean shutdown by itself, because
I use md to create a raid1 with lvm on top?

PS: You might gess that I'm using SuSE Linux, 7.0 to precise.
The kernel ist 2.4.0-test10.


MfG / Regards
Friedrich Lobenstock
