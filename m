Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: jan@stanger.com
Message-Id: <20030502145325.418.h006.c000.wm@mail.stanger.com.criticalpath.net>
Subject: [linux-lvm] Converting existing partitions/disks to LVM?
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
Date: Fri May  2 16:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

This is my first post, and although I have researched
the archives, I didn't find the right answers to my
questions below.

I have an existing SuSE 8.1 setup using two disks:

/dev/hda (40G) -- one single partition containing the
root file system and the complete Linux installation
/dev/hde (120G) -- pure data disk (one huge data
partition & one small swap partition).

Q1: Now I want to add another data disk to my system
and would like both, that new disk and my existing 120G
disk to be logically combined so that they appear as
only one disk. I understand that this is where LVM
comes into play. Can I convert my existing, full 120G
drive to be using LVM in conjunction with the new
drive, or will I have to reformat/repartition it first?

Q2: I am afraid to convert my root fs on /dev/hda to
LVM, so that currently is out of the question. But can
I resize my 40G hdd, say, to only have 20G for the
Linux installation, and combine the remaining 20G
together with the two data disks to one single logical
volume?

Thanks for any help. I am still learning about what LVM
can do for me, have read the Howto but still have tons
of questions left.

Thanks
Jan
