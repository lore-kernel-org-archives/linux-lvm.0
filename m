Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j33AdSO17546
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 06:39:28 -0400
Received: from pollux.ds.pg.gda.pl (postfix@pollux.ds.pg.gda.pl [153.19.208.7])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j33AdRP0007656
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 06:39:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by pollux.ds.pg.gda.pl (Postfix) with ESMTP id 3B519E1C91
	for <linux-lvm@redhat.com>; Sun,  3 Apr 2005 12:39:21 +0200 (CEST)
Received: from pollux.ds.pg.gda.pl ([127.0.0.1])
	by localhost (pollux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 04081-01 for <linux-lvm@redhat.com>;
	Sun,  3 Apr 2005 12:39:21 +0200 (CEST)
Received: from piorun.ds.pg.gda.pl (piorun.ds.pg.gda.pl [153.19.208.8])
	by pollux.ds.pg.gda.pl (Postfix) with ESMTP id E25D2E1C81
	for <linux-lvm@redhat.com>; Sun,  3 Apr 2005 12:39:20 +0200 (CEST)
Received: from matthew.ogrody.nsm.pl (daemon@localhost [127.0.0.1])
	by piorun.ds.pg.gda.pl (8.13.1/8.13.1) with SMTP id j33AdGJC006660
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 12:39:22 +0200
Date: Sun, 3 Apr 2005 12:41:58 +0200
From: Tomasz Torcz <zdzichu@irc.pl>
Message-ID: <20050403104158.GA6712@irc.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
Subject: [linux-lvm] [PATCH] --ignorelockingfailure for `lvm mkvgnodes`
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
To: linux-lvm@redhat.com


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


 Hi,

 `lvm vgmknodes` needs --ignorevglocking. Consider following scenario:
- just after initrd finishes, everything is activated
- /dev is mount as tmpfs, read-write, managed by udev
- other filesystem hovewer are mounted read-only
  - /var could be not mounted at all!

- filesystem are going to be remounted rw after fsck. But fsck won't
  run, as there are LVM nodes missing from /dev. fsck error == fatal
  condition
- lvm vgmknodes won't run, because it can't obtain lock in /var. But
  should work, as /dev is writable

 Attached trivial patch adds --ignorelockingfailure to vgmknodes. It is
pretty safe.

 I've ecnountered above scenario on Slackware system during migration to
LVM2.

-- 
Tomasz Torcz               "Never underestimate the bandwidth of a station
zdzichu@irc.-nie.spam-.pl    wagon filled with backup tapes." -- Jim Gray


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="vgmknodes-ignorelockingfailure.diff"

diff -ru LVM2.old/tools/commands.h LVM2.new/tools/commands.h
--- LVM2.old/tools/commands.h	2005-04-03 12:08:05.000000000 +0200
+++ LVM2.new/tools/commands.h	2005-04-03 12:29:17.000000000 +0200
@@ -717,9 +717,12 @@
    "vgmknodes\n"
    "\t[-d|--debug]\n"
    "\t[-h|--help]\n"
+   "\t[--ignorelockingfailure]\n"
    "\t[-v|--verbose]\n"
    "\t[--version]" "\n"
-   "\t[VolumeGroupName...]\n" )
+   "\t[VolumeGroupName...]\n",
+
+   ignorelockingfailure_ARG)
 
 xx(vgreduce,
    "Remove physical volume(s) from a volume group",

--qMm9M+Fa2AknHoGS--
