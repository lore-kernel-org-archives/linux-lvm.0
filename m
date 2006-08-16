Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7GFiECc005942
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2006 11:44:14 -0400
Received: from post.fh-kl.de (post.fh-kl.de [143.93.17.200])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7GFhqaE023013
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2006 11:43:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by post.fh-kl.de (Postfix) with ESMTP id 29A972408C45
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2006 17:43:52 +0200 (CEST)
Received: from post.fh-kl.de ([127.0.0.1])
	by localhost (post.fh-kl.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 19759-01-7 for <linux-lvm@redhat.com>;
	Wed, 16 Aug 2006 17:43:45 +0200 (CEST)
Received: from zwo224-tv.ds.fh-kl.de (sub17.rz-zw.fh-kl.de [143.93.17.17])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by post.fh-kl.de (Postfix) with ESMTP id 3C66B2401FB2
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2006 17:43:45 +0200 (CEST)
From: Timo Veith <tv@rz.fh-kl.de>
Date: Wed, 16 Aug 2006 17:43:44 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200608161743.44625.tv@rz.fh-kl.de>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] probably just another xfs and lvm snapshot problem?
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

Hi list readers,

the archive has various messages about this topic but I am not sure if my 
problem is caused by xfs and the lvm snapshot or not. I came a long way 
to this place. Let me elaborate on this a little.

First of all my system config:
I am using Gentoo Linux, kernel 2.6.16-gentoo-r7, device-mapper-1.02.07, 
lvm2-2.02.06, xfsprogs-2.7.11

and on the test box: 2.6.17-gentoo-r4, device-mapper-1.02.08, 
lvm2-2.02.07, xfsprogs-2.7.11

My intension is to make full system (just everything) backups of a 
reasonably busy mailserver. I am using cyrus imap as pop/imap server, 
postfix as smtpd and amavisd-new as malware scanner. Pretty common setup.

I wrote a backup script that uses the hard linking techique of rsync 
(described e.g. here 
http://www.mikerubel.org/computers/rsync_snapshots/). Before starting 
rsync I made lvm snapshots of /var and /var/spool/imap. These are the 
most busiest partitions.

The output of rsync showed errors and everybody wants his backup to be the 
same as the original data, right? Thus I wrote another script that 
verifies source against destination data. I can provide the code for it. 
The script fails when doing the md5sum check. Here is the output:

md5sum: WARNING: 8 of 70769 computed checksums did NOT match
md5sum check failed
./amavis/db/__db.001: FAILED
./amavis/db/__db.002: FAILED
./amavis/db/__db.003: FAILED
./imap/db/__db.001: FAILED
./imap/db/__db.002: FAILED
./imap/db/__db.003: FAILED
./imap/db/__db.004: FAILED
./imap/db/__db.005: FAILED

or like so:

md5sum: WARNING: 9 of 72522 computed checksums did NOT match
md5sum check failed
./amavis/db/__db.001: FAILED
./amavis/db/__db.002: FAILED
./amavis/db/__db.003: FAILED
./amavis/quarantine/spam-74v2QeUbeNRR.gz: FAILED
./imap/db/__db.001: FAILED
./imap/db/__db.002: FAILED
./imap/db/__db.003: FAILED
./imap/db/__db.004: FAILED
./imap/db/__db.005: FAILED

My first attempt to solve this was to stop the daemons that write these 
files. I stopped amavisd-new and cyrus, took the lvm snapshot and 
restarted the services. Then I did the backup. But the verify was still 
failing.

I asked myself why only that few files out of more than 70000 are failing 
the test. I took a closer look and compared the first file manually. The 
size was equal but "cmp" said that the files were differing in the first 
byte.

Then I thought it was a kind of a file system caching issue and I put 
some "sync" commands after stopping the daemons and before taking the lvm 
snapshot. The result was that only two files were failing the md5sum 
check. However two files failing are two files too much.

Somehow I found the xfs_freeze command and I thought that it must be the 
solution of my problems. Unfortunately I locked the mailserver ;) and had 
to hard reset it, because lvcreate didn't give me the prompt back. 
Hitting CTRL-C neither.

From the archive I have learned that xfs_freeze shouldn't be necessary 
with lvm2 anymore. Also I have read something about versioning problems. 
I posted mine above, so maybe it's a version issue?

If not, I also read about the dmsetup command. I played around a little 
with dmsetup and found a working combination of commands. Bit I am not 
sure if this is the way one can do this.

dmsetup suspend vg0-var
xfs_freeze -f /var
dmsetup resume vg0-var
lvcreate -s -L 1G -n snapvar /dev/vg0/var
xfs_freeze -u /var
# do backup from the snapshot
lvremove -f /dev/vg0/snapvar

To me it doesn't sound good issueing these commands. Just a feeling ;).

Does there remain any other source of the above md5sum errors? I believe 
not, because the other 70,000 files were checked and proved to be right. 
Any hints?


TIA and kind regards,

Timo
