Return-Path: <james@fr.clara.net>
Date: Wed, 7 Feb 2001 10:25:25 +0100 (CET)
From: James <james@fr.clara.net>
Message-ID: <Pine.LNX.4.21.0102071013170.15807-100000@munster.noc.fr.clara.net>
MIME-Version: 1.0
Subject: [linux-lvm] lvm with raid
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello

I am trying to use lvm with a /dev/md0 partition which I believe is
possible. But I miust be missing something. 

Using lvm_0.9, kernel 2.4.0 under debian Linux

I created /dev/md0 (raid autodetect)
Did a pvcreate /dev/md0
lvcreate'd partitions /usr /home /var

copied and remounted everything.
This all goes surprisingly well, until I decided to test with a reboot.

vgscan and vgchange don't find a thing !

test:/home/james# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

test:/home/james# vgchange -a y
vgchange -- no volume groups found

but if I try to recreate a PV 

test:/home/james# pvcreate /dev/md0
pvcreate -- ERROR: can't initialize physical volume "/dev/md0" of volume
group "devlvm" without -ff
 
Everything is still there apparantly.

I must be missing something fundamental. Thanks fot any help in advance.

James
