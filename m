Return-Path: <gustavo@zacarias.com.ar>
Message-ID: <3A64ED3F.E0E4EEBF@zacarias.com.ar>
Date: Tue, 16 Jan 2001 21:54:23 -0300
From: Gustavo Zacarias <gustavo@zacarias.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2.4.1-pre7 + LVM 0.9.1 beta1 (CVS) - OK now
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

Ok, no more oopses doing vgextend's here :-)
For the lazy/curious crowd, i left a patch to make
a plain 2.4.0 into a 2.4.1-pre7-gz (to indentify the
mutation) at http://nrrti.zacarias.com.ar/linux
It's basically a 2.4.1-pre7 with LVM 0.9.1 beta1 checked
out from CVS this morning, plus super.c fix for root
reiserfs and a newer 8139too driver.
All this things fix my needs for now, which is an ext2
/boot, reiserfs-tea /, and reiserfs-r5 /data LVMed.
I've been pushing this thing hard for about an hour,
mostly SMB & FTP to/from the LVM device.
Please bear in mind this isn't any kind of official
patch, just a home grown one, only tested on 2
machines, and most of all unsupported.
And if you can't connect to get it, it's probably the
lousy ADSL/PPPoE connection...

Keep up the good work LVM team!

-- 
Gustavo Zacarias - Yahoo! ID "qarnage"
Yahoo! Argentina - http://www.yahoo.com.ar
--
