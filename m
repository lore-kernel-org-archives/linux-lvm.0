From: Patrick Caulfield <caulfield@sistina.com>
Message-ID: <20030924070929.GA1551@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
Subject: [linux-lvm] [Bug#212483: vgscan fails at least with raids inside raids]
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
Date: Wed Sep 24 08:01:06 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline


-- 

patrick


--6TrnltStXW4iwmi0
Content-Type: message/rfc822
Content-Disposition: inline

X-Mail-Format-Warning: Bad RFC2822 header formatting in >From patrick  Wed Sep 24 08:05:59 2003
Return-path: <debbugs@master.debian.org>
Envelope-to: patrick@localhost
Delivery-date: Wed, 24 Sep 2003 08:05:59 +0100
Received: from localhost.pjc.net ([127.0.0.1] helo=localhost)
	by arthur.pjc.net with esmtp (Exim 3.36 #1 (Debian))
	id 1A23il-00009k-00
	for <patrick@localhost>; Wed, 24 Sep 2003 08:05:55 +0100
Received: from mail.cix.co.uk
	by localhost with POP3 (fetchmail-5.9.11)
	for patrick@localhost (single-drop); Wed, 24 Sep 2003 08:05:55 +0100 (BST)
Received: from master.debian.org (master.debian.org [146.82.138.7])
	by mta02.mx.cix.co.uk (8.11.3/CIX/8.11.3) with ESMTP id h8NMmKs08552
	for <patrick@tykepenguin.cix.co.uk>; Tue, 23 Sep 2003 23:48:20 +0100
X-Envelope-From: debbugs@master.debian.org
Received: from debbugs by master.debian.org with local (Exim 3.35 1 (Debian))
	id 1A1vx0-0003sh-00; Tue, 23 Sep 2003 17:48:06 -0500
X-Loop: owner@bugs.debian.org
Subject: Bug#212483: vgscan fails at least with raids inside raids
Reply-To: Santiago Garcia Mantinan <manty@debian.org>, 212483@bugs.debian.org
Resent-From: Santiago Garcia Mantinan <manty@debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: Patrick Caulfield <patrick@debian.org>
Resent-Date: Tue, 23 Sep 2003 22:48:04 UTC
Resent-Message-ID: <handler.212483.B.106435711813900@bugs.debian.org>
X-Debian-PR-Message: report 212483
X-Debian-PR-Package: lvm10
X-Debian-PR-Keywords: 
Received: via spool by submit@bugs.debian.org id=B.106435711813900
          (code B ref -1); Tue, 23 Sep 2003 22:48:04 UTC
Received: (at submit) by bugs.debian.org; 23 Sep 2003 22:45:18 +0000
Received: from 204.red-213-96-224.pooles.rima-tde.net (betawl.net) [213.96.224.204] 
	by master.debian.org with esmtp (Exim 3.35 1 (Debian))
	id 1A1vuF-0003b8-00; Tue, 23 Sep 2003 17:45:15 -0500
Received: from man.beta.es (man.beta.es [192.168.1.2])
	by betawl.net (Postfix) with ESMTP
	id D22C027AFE; Wed, 24 Sep 2003 00:45:12 +0200 (CEST)
Received: by man.beta.es (Postfix, from userid 1000)
	id EA4001003C; Wed, 24 Sep 2003 00:45:08 +0200 (CEST)
Content-Type: multipart/mixed; boundary="===============0139022805=="
MIME-Version: 1.0
From: Santiago Garcia Mantinan <manty@debian.org>
To: Debian Bug Tracking System <submit@bugs.debian.org>
X-Mailer: reportbug 2.29
Date: Wed, 24 Sep 2003 00:45:08 +0200
Message-Id: <20030923224508.EA4001003C@man.beta.es>
X-BadReturnPath: manty@man.beta.es rewritten as manty@debian.org
  using "From" header
Delivered-To: submit@bugs.debian.org
Resent-Sender: Debian BTS <debbugs@master.debian.org>
X-Envelope-To: patrick@tykepenguin.cix.co.uk
X-Spam-Status: No, hits=-7.0 required=3.4
	tests=BAYES_01,DEBIAN_BTS_BUG,RCVD_IN_RFCI,X_LOOP
	version=2.55
X-Spam-Level: 
X-Spam-Checker-Version: SpamAssassin 2.55 (1.174.2.19-2003-05-19-exp)

This is a multi-part MIME message sent by reportbug.

--===============0139022805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Package: lvm10
Version: 1:1.0.7-7
Severity: important

vgscan tries to scan every device and by doing so it fails at least under
some circumstances.

The circumstances on which I have found this are these: I have a raid0
device named md0 which is itself part of a raid5 device named md2.

This is what happens: I create a pv on the raid5 device and then define a
group named raid5vg inside and a couple of logical volumes inside of this, I
format the lvs and I even mount them and play with the system, everything is
fine till I boot up again, I see that starting the lvm fails because of
vgscan failing.

What happens to vgscan is that it is finding stuff about raid5vg in both md0
and md2, this is caused by md0 being part of md2, I have tried changing the
position of md0 in the raid (making it the last of the 3 devices I have in
the raid5, instead if the first one) but same thing happened.

To prove that my supposition is correct I have done this:

I run vgscan with all the raids started and i get:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of volume group
"raid5vg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

Then I stop the raid0 by: stopping the raid5, then the raid0 and then
starting the raid5 in a dregradated mode. These are the commands I issue:

raidstop /dev/md2
raidstop /dev/md0
raidstart /dev/md2

And run again vgscan, but now md0 doesn't exist as it is not started, so I
get...

vgscan -- reading all physical volumes (this may take a while...)
raid5: switching cache buffer size, 4096 --> 1024
vgscan -- found inactive volume group "raid5vg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

If I start md0 again, I get the error again.

I compiled lvm10 in debug mode and run vgscan -v --debug in the case where
it fails, I'm attaching the output to this report.

I think that vgscan shouldn't have any kind of problem in this situation, I
mean, maybe he cannot get the info about raid5vg from md0, but he surely can
get it from md2.

Regards...

-- System Information:
Debian Release: testing/unstable
Architecture: i386
Kernel: Linux man 2.4.22 #1 Mon Sep 22 00:43:52 CEST 2003 i586
Locale: LANG=C, LC_CTYPE=C

Versions of packages lvm10 depends on:
ii  debconf                       1.3.14     Debian configuration management sy
ii  file                          4.03-3     Determines file type using "magic"
ii  libc6                         2.3.2-8    GNU C Library: Shared libraries an
ii  lvm-common                    1.5.9.3    The Logical Volume Manager for Lin

-- debconf information:
* lvm10/warning: 


--===============0139022805==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="/tmp/vgscan.debug.gz"

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
mQ2ODXbpzYPMiE9O/g9ghpl51SoBAA==
--===============0139022805==--


--6TrnltStXW4iwmi0--
