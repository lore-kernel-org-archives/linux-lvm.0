Message-ID: <000801bf197e$45d7af80$0ebcfea9@brd>
From: "Nicolas Brouard" <brouard@ined.fr>
Subject: [linux-lvm] FAQ Question not found
Date: Mon, 18 Oct 1999 17:34:23 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I have used and appreciated LVM on AIX for years. The main use for me
consisted in having initially a hard disk too big for my actual but
increasing needs.
It was very nice to increase a filesystem like /home /usr/local or /var when
mail traffic increased.
Now I have a similar need. I am using a laptop with 2Gb. I bought a 6Gb hard
disk which should replace the old one. I would like to have at the beginning
2Gb for Win98 and some initially small logical volumes for a Linux system.
With my 2Gb old disk, I used 1Gb for Windows and 1Gb for Linux.

Is it a good idea to try to implement LVM for the linux partition? How does
it deal with other partitions and the limitation to 4 primary partitions.
How to begin? Should I first install Linux with arbitrary partitions, and
then build a LVM kernel and then? I do only have one physical disk and can't
play so much with other partitions.

In fact I do not understand how it works. On AIX, all the disk was managed
with LVM? Here, can I decide that logical volume manager will only deal with
a big ext2 partition. And within this partition I would be able to have
variable sized /var /home / ?

I would appreciate any help, even if it is: Ok, do fixed partitions and not
LVM!

Nicolas Brouard
brouard@ined.fr
http://sauvy.ined.fr/brouard/english
