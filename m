Message-ID: <376DA1DD.9D2251AC@mainz.ibm.de>
Date: Mon, 21 Jun 1999 04:22:21 +0200
From: Udo Weber <udo.weber@mainz.ibm.de>
MIME-Version: 1.0
Subject: [linux-lvm] pvcreate -- extended partition "/dev/hda10" doesn't exist
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi LVM-specialists,

I'm new here the Linux-LVM-array. This means I was downloading all
needed software+patches, compiled successfull and also installed without
erors on my IBM-Thinkpad (300 MHz PII, 128 MB RAM, 8GByte HD).
I have all my LINUX-stuff on several extended partitions.

Now at first some generally questions (I don't  found an answer for this
in the docu):
Is it possible to create a PV on a extended partion or do I need only
primary partions ?
I think pvcreate writes something at the top of the physical volume (
whole PV or partion).
Do that works well with other OS-formated parts of the same hdisk ?

If the first question is no, forget the rest of this mail!
If it should works please help. Here are all infos related to my
problem:

###########################################################################

Welcome to SuSE Linux 6.1 (i386) - Kernel 2.2.10 (tty4).
