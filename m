Return-Path: <dick@britain.agilent.com>
Date: Fri, 25 May 2001 09:28:34 +0100 (BST)
From: Dick Middleton <dick@britain.agilent.com>
Message-Id: <200105250828.JAA11414@queeg.britain.agilent.com>
Subject: [linux-lvm] Root on LVM and vgscan
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have root running on lvm on sw raid partitions on linux 2.2.18.  It all
works fine.  However I have had difficulty during booting after adding new
LVs.  The symptom is that the initial mounts of LVs fails or the wrong
partition is mounted.

What happens is that vgscan is run during the initrd phase and so the lvmtab
is updated on the ram disk.  Once the root file system on the hard disk has
been mounted the lvmtab on that comes into use.  That has not been updated by
vgscan and so does not reflect the changes. 

Obviously it's possible to run vgscan again (between remounting root rw and
checking the other discs) to update the lvmtab but it does beg a few
questions.

1) why does mount use the data in lvmtab and not in /proc to find out about
   active VGs?

2) if lvmtab is so essetial why is it not updated by vgcreate/lvcreate and
   other utilities when changes are made?

3) would it not be possible/better to update lvmtab from /proc without doing
   a rescan.

I don't know the issues involved and reasoning behind the design of this
aspect of LVM but it does seem to me that there is something less than ideal
in the current scheme.

Dick
