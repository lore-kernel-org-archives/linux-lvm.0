Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1JIn9QB016013
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 13:49:09 -0500
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.3.105])
	by mx1.redhat.com (Postfix) with ESMTPS id AE11D19CBD1
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 3763C140E16
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 19:40:26 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id VaJ9eFksN_oG for <linux-lvm@redhat.com>;
	Fri, 19 Feb 2016 19:40:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 2D18F141102
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 19:40:24 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id w8eywtBlXQcr for <linux-lvm@redhat.com>;
	Fri, 19 Feb 2016 19:40:24 +0100 (CET)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id EB83A140D44
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 19:40:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id DAFDD100921
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 19:40:23 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id x130EVDsNP7E for <linux-lvm@redhat.com>;
	Fri, 19 Feb 2016 19:40:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 4538B101337
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 19:40:23 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 65Eqq9FvbiVF for <linux-lvm@redhat.com>;
	Fri, 19 Feb 2016 19:40:23 +0100 (CET)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 1EF6B100921
	for <linux-lvm@redhat.com>; Fri, 19 Feb 2016 19:40:23 +0100 (CET)
Date: Fri, 19 Feb 2016 19:40:22 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <1665753824.5013038.1455907222524.JavaMail.zimbra@helmholtz-muenchen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] problem with lvcreate and redirection
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM Mailingliste <linux-lvm@redhat.com>

Hi, 

i have a script in which i invoke lvremove and lvcreate. With lvremove i don't have proplems but with lvcreate. 
I'm redirecting stdout and stderr to a file because the script is executed by cron and i'd like to have a look afterwards if everything went fine. 
The command is: lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root > lvcreate_with_redirection.log 2>&1. Shell does not accept further commands afterwards, but host still responds to ping. You can have a look on lvcreate_with_redirection.log here: https://hmgubox.helmholtz-muenchen.de:8001/d/b4c7025bac/ .
System seems to stop while suspending. 

last lines of the log:
======================================================

...
    Creating vg1-lv_root_snapshot-cow
    Loading vg1-lv_root_snapshot-cow table (252:3)
    Resuming vg1-lv_root_snapshot-cow (252:3)
    Loading vg1-lv_root_snapshot table (252:1)
    Suspending vg1-lv_root (252:0) with filesystem sync with device flush
======================================================


I did a strace on the command and that confirms it:
strace -ftt lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root > lvcreate_strace_with_redirection.log 2>&1
last lines of the log (you find all the mentioned logs on the link):

====================================================================

...
17:43:59.199487 ioctl(4, DM_TABLE_DEPS, 0x7875e0) = 0
17:43:59.199581 ioctl(4, DM_DEV_STATUS, 0x7875e0) = -1 ENXIO (No such device or address)
17:43:59.199680 ioctl(4, DM_DEV_STATUS, 0x7875e0) = -1 ENXIO (No such device or address)
17:43:59.199749 ioctl(4, DM_DEV_STATUS, 0x7875e0) = 0
17:43:59.199803 write(2, "  ", 2  )       = 2
17:43:59.199905 write(2, "  ", 2  )       = 2
17:43:59.199945 write(2, "Suspending vg1-lv_root (252:0) w"..., 69Suspending vg1-lv_root (252:0) with filesystem sync with device flush) = 69
17:43:59.199981 write(2, "\n", 1
)       = 1
17:43:59.200068 ioctl(4, DM_DEV_SUSPEND
====================================================================

Issuing the command without the redirection of stderr works !
lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root > lvcreate_with_redirection_without_stderr.log

Snapshot is created and systems keeps on running (although snapshot is created in all cases, also with the commands which stop the server).

When i use "lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root > lvcreate_with_redirection_without_stderr.log" in conjunction with unbuffer, system also keeps running:
unbuffer lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root > lvcreate_with_redirection_unbuffer.log 2>&1

Logfile again on the internet.

For the sake of completeness i did a strace without redirection and copied afterwards the content of the terminal to the file lvcreate_strace_without_redirection.log: strace -ftt lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root.
System keeps on running.

Any ideas why this behaves so strange ?

Host is a virtual machine (KVM), running SLES 11 SP4 64bit. LVM is lvm2-2.02.98-0.37.2.
My root directory resides on a lv:
mount
/dev/mapper/vg1-lv_root on / type ext3 (rw,strictatime,acl,user_xattr)
...
/dev/vda3 on /boot type ext3 (rw,strictatime,acl,user_xattr)
...

The host for the vm is also SLES 11 SP4 64bit.



Bernd

-- 
Bernd Lentes 

Systemadministration 
institute of developmental genetics 
Gebäude 35.34 - Raum 208 
HelmholtzZentrum München 
bernd.lentes@helmholtz-muenchen.de 
phone: +49 (0)89 3187 1241 
fax: +49 (0)89 3187 2294 

Wer Visionen hat soll zum Hausarzt gehen 
Helmut Schmidt
Helmholtz Zentrum München

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Alfons Enhsen, Renate Schlusen (komm.)
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
