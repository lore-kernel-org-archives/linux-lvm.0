Return-Path: <ramin@motakef.de>
From: Ramin Motakef <ramin@motakef.de>
Date: 01 Jul 2001 21:30:54 +0200
Message-ID: <873d8gtpjl.fsf@nase.motakef.de>
MIME-Version: 1.0
Subject: [linux-lvm] lvm and software raid1
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

Hi!
This is my first contact with LVM, so maybe i am doing something
wrong, however this are my problems:

I try to install LVM on /dev/md1:

# cat /proc/mdstat 
md1 : active raid1 sdb7[1] sda7[0]
      15411072 blocks [2/2] [UU]

Kernel is vanilla 2.4.5, distribution debian sid of today.

md1 is about 15GB, but when i run pvcreate on it, it uses only 1.8 GB:

# pvcreate -ff /dev/md1
pvcreate -- WARNING: forcing physical volume creation on "/dev/md1"
pvcreate -- physical volume "/dev/md1" successfully created

# pvdisplay /dev/md1
pvdisplay -- "/dev/md1" is a new physical volume of 1.86 GB

Any hints?

Thanks, Ramin
