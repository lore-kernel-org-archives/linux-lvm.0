Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1LGxW120133
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 11:59:32 -0500
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k1LGxTeR004689
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 11:59:29 -0500
Date: Tue, 21 Feb 2006 17:59:18 +0100 (MET)
From: "Markus Schreier" <mdschreier@gmx.net>
MIME-Version: 1.0
Message-ID: <12705.1140541158@www081.gmx.net>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgcfgbackup and vgcfgrestore
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hello,

i'm new to your list and would like to introduce myself. I'm markus. I've
worked with linux for quit a while as administrator also using lvm.  Now i
try to get some desaster-recovery-strategie working.

I've quit a couple of linux-systems. I use vgcfgbackup (lvm1) to bachkup the
configuration of volumegroups into a file normal backup-software to backup
files..

Wenn system crashes i would like to=20
* start with some (new) rescue-cd, recover vg-configuration file, recreate
volumegroups (with recoverd config-file),  restore data and reboot
This works fine with new systems running lvm2 and some rescue-cd with lvm2.

Now there are old lvm1-systems as well. I would like to use the same
recover-CD, but it has lvm2-commands and i can't get it to recover old
config-files.

In short:
I would like to get the following things working:
vgcfgbackup (lvm1-binary, 2.4 kernel) backing up lvm1-Volume and creating
metadata-file (in lvm1 format)
vgcfgrestore (lvm2-binary, 2.6 kernel) restoring lvm1-Volume from above.
working with restored vg with lvm1, 2.4 kernel.

Does this work?
Can someone give me example commands?

Please excuse my poor english,=20
thanks in advance for your help
Markus

--=20
10 GB Mailbox, 100 FreeSMS/Monat http://www.gmx.net/de/go/topmail
+++ GMX - die erste Adresse f=EF=BF=BDr Mail, Message, More +++
