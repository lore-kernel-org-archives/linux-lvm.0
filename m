Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7QDSPV06591
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 09:28:26 -0400
Received: from [212.115.146.242] (mail.hivos.nl [212.115.146.242])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7QDSIrW011944
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 09:28:19 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by servius.hivos.nl (Postfix) with ESMTP id EAD5858800A
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 15:22:53 +0200 (CEST)
Received: from servius.hivos.nl ([127.0.0.1])
	by localhost (servius [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 11312-10 for <linux-lvm@redhat.com>;
	Fri, 26 Aug 2005 15:22:53 +0200 (CEST)
Received: from localhost (servius.hivos.nl [192.168.200.3])
	by servius.hivos.nl (Postfix) with ESMTP id DB8B9588001
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 15:22:52 +0200 (CEST)
Message-ID: <20050826152252.1zxn5dw8fwg0ossg@servius.hivos.nl>
Date: Fri, 26 Aug 2005 15:22:52 +0200
From: Jeroen Vriesman <jeroen@hivos.nl>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] segmentation fault with snapshot creation
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Dear all.

The following error occured with kernel 2.6.12-rc5, lvm2 2.01.04-5 on debian,
using an adaptec 2200S raid controller (write cache disabled), with 7 73G disk
on each channel, in a mirror configuration, where the mirrors are seen by the
OS as /dev/sdb, /dev/sdc .... /dev/sdh.

One vg is created, called "rack1_all", and one lv with:

lvcreate -i7 -I4 -L400G -nsamba_space rack1_all
mkfs.xfs /dev/rack1_all/samba_space

which is mounted, and works fine.

When I create a snapshot with:

lvcreate -L10G -s -ndsnap /dev/rack1_all/samba_space

This snapshot works fine, however, when I create it with:

lvcreate -i7 -I4 -L10G -s -ndsnap /dev/rack1_all/samba_space

I get:

tacitus:/home/jeroen/lvm2-2.01.04/tools# lvcreate -i7 -I4 -L10G -s -ndsnap
/dev/rack1_all/samba_space
  Rounding size (2560 extents) up to stripe boundary size (2562 extents)
Segmentation fault

The -I4 option doesn't seem to matter, it's just when I try to stripe the
snapshot it segfaults.

This is the same with -vvvvvvv: (the last part of it, the rest looks fine)

#metadata/pv_map.c:177         Allowing allocation on /dev/sdf start PE 14629
length 2864
#metadata/pv_map.c:177         Allowing allocation on /dev/sdg start PE 14629
length 2864
#metadata/pv_map.c:177         Allowing allocation on /dev/sdh start PE 14629
length 2864
#archiver.c:109     Archiving volume group "rack1_all" metadata.
Segmentation fault


And this is the backtrace (thanks to strib on #lvm):

(gdb) run
Starting program: /home/jeroen/lvm2-2.01.04/tools/lvcreate -i7 -I4 -L10G -s
-ndsnap /dev/rack1_all/samba_space
File descriptor 3 left open
File descriptor 4 left open
File descriptor 5 left open
  Rounding size (2560 extents) up to stripe boundary size (2562 extents)

Program received signal SIGSEGV, Segmentation fault.
0x08094aea in _text_export (seg=0x8103050, f=0x80f54c0)
    at snapshot/snapshot.c:85
85              outf(f, "origin = \"%s\"", seg->origin->name);
(gdb) backtrace
#0  0x08094aea in _text_export (seg=0x8103050, f=0x80f54c0)
    at snapshot/snapshot.c:85
#1  0x08077d99 in _print_segment (f=0x80f54c0, vg=0xa, count=0, seg=0x8103050)
    at format_text/export.c:421
#2  0x080786bb in _print_lvs (f=0x80f54c0, vg=0x80d7f10)
    at format_text/export.c:622
#3  0x08078b80 in _text_vg_export (f=0x80f54c0, vg=0x80d7f10,
    desc=0x81030e8 "Created *before* executing
'/home/jeroen/lvm2-2.01.04/tools/lvcreate -i7 -I4 -L10G -s -ndsnap
/dev/rack1_all/samba_space'")
    at format_text/export.c:724
#4  0x08078d56 in text_vg_export_file (vg=0x0, desc=0x0, fp=0x0)
    at format_text/export.c:766
#5  0x080768e8 in archive_vg (vg=0x80d7f10, dir=0x80d5928 "/etc/lvm/archive",
    desc=0x0, retain_days=1, min_archive=1) at format_text/archive.c:263
#6  0x0804f627 in __archive (vg=0x80d7f10) at archiver.c:94
#7  0x0804f711 in archive (vg=0x80d7f10) at archiver.c:110
#8  0x080529a4 in _lvcreate (cmd=0x80bf828, lp=0xbf927080) at lvcreate.c:559
#9  0x080530b6 in lvcreate (cmd=0x80bf828, argc=0, argv=0x0) at lvcreate.c:655
#10 0x08056cb7 in _run_command (cmd=0x80bf828, argc=1, argv=0xbf92721c)
    at lvmcmdline.c:857
#11 0x080579a6 in lvm2_main (argc=7, argv=0xbf927204) at lvmcmdline.c:1469
#12 0x080674a9 in main (argc=0, argv=0x0) at lvm.c:20
(gdb)


It seems like a bug to me, hope it's fixable,
Cheers,
Jeroen.
