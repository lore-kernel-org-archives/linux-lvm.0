Return-Path: <seawolf@attglobal.net>
Message-ID: <3A6768A6.CC431D9@attglobal.net>
Date: Thu, 18 Jan 2001 17:05:26 -0500
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: [linux-lvm]  Migration path - 2.2.17 & LVM 0.8final -> 2.4.0 & LVM 
 0.9.1-b2 
References: <20010118204335.35DCBE0B7@wraith>
Content-Transfer-Encoding: 7bit
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

My current workstation is running Linux Mandrake 7.2.  It has a 2.2.17
kernel patched with lvm-0.8final-2.2.16TL.patch.

Most of the system is reiserfs created on lvm devices.  In fact, the
only part of the system that is not reiserfs/lvm is the /boot tree as
you can see:

Filesystem            Size  Used Avail Use% Mounted on
/dev/lvg01/slash      600M  268M  332M  45% /
/dev/hda1              45M  4.4M   39M  10% /boot
/dev/lvg01/home       1.0G  133M  891M  13% /home
/dev/lvg01/usr        2.0G  1.3G  752M  63% /usr
/dev/lvg01/src        700M  249M  451M  36% /usr/src
/dev/lvg01/local      1.0G  537M  487M  52% /usr/local
/dev/lvg01/var        300M  123M  177M  41% /var
/dev/lvg01/mp3        1.5G  1.4G  110M  93% /mp3
/dev/lvg01/pictures   1.0G   38M  986M   4% /pictures
/dev/lvg01/wine       1.0G   32M  992M   3% /wine


I want to migrate to the source from
 
	kernel-headers-2.4.0-5mdk.i586.rpm
	kernel-source-2.4.0-5mdk.i586.rpm

patched with lvm_0.9.1_beta2.tar.gz.

The problem is, I am not sure of the implementation order.  i.e., should
I first try to add the 0.9.1 user space tools and then the new kernel.
Or, should I try to add a 0.9.1 patch to the current kernel before
switching to the new 2.4.0 kernel etc...

As you can see,  I am a bit confused.  I would appreciate some words of
guidance from anyone that has already done something similar
(successfully).

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
