Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j32274O23104
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 21:07:04 -0500
Received: from sapo.pt (relay5.ptmail.sapo.pt [212.55.154.25])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j3226wAx021802
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 21:06:58 -0500
Received: from unknown (HELO [10.0.0.9]) ([213.13.235.7])
	(envelope-sender <lists@tuxdoit.com>)
	by mta7 (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 2 Apr 2005 02:06:49 -0000
Message-ID: <424DFE39.3080206@tuxdoit.com>
Date: Sat, 02 Apr 2005 03:06:49 +0100
From: =?ISO-8859-1?Q?M=E1rio_Gamito?= <lists@tuxdoit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Lost all info in a file server because of LVM - HEEEELP
	ME, please
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I'm totally desperated.

I have this file server with a total of about 200 GB of my user's files.

The server has "3 in 1" discs, using LVM.

Somehow, i don't know why, the LVM info is gone and i cannot access my=20
file system.

I had in LVM:

sda1 -> /boot
sda2 -> /
sda3 -> /home (expanding to sdb and sdc and where all the Samba shares=20
resides).
sda4 -> swap

sdb

sdc

The machine now starts with a single partition ( / ) mounted on /dev/root

 From there i can manually mount under /mnt, partitions "/boot", "/",=20
but NOT "/home".
Trying to mount /home, i always get the busy error.
I cannot unmount the "/" on /dev/root, obviously.

How can i (if possible) restore the LVM info ?

I have a backup from last Sunday, so, it's really not a life or death=20
case, but nevertheless it is a real annoiance, and the server is already=20
down for 24 hours :(

If it a lost case, how can i at least mount /home so that the changes=20
made since the backup until today can be transferred to another machine,=20
while i reinstall this that one that went bezerk ?

Any help would be apreciated.

Warm Regards,
M=EF=BF=BDrio Gamito
