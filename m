Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i4R7IOtl022361
	for <linux-lvm@redhat.com>; Thu, 27 May 2004 08:18:24 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BTF9k-0008LW-II
	for linux-lvm@redhat.com; Thu, 27 May 2004 08:18:24 +0100
Date: Thu, 27 May 2004 08:18:24 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Message-ID: <20040527071824.GB31342@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
Sender: Patrick <patrick@tykepenguin.com>
Subject: [linux-lvm] [Bug#250906: lvm10: lvdisplay doesn't give proper
	return codes]
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

 
-- 

patrick

--3MwIy2ne0vdjdPXF
Content-Type: message/rfc822
Content-Disposition: inline

Return-path: <debbugs@bugs.debian.org>
Envelope-to: patrick@localhost
Delivery-date: Tue, 25 May 2004 20:41:08 +0100
Received: from fentible ([127.0.0.1] helo=localhost)
	by fentible with esmtp (Exim 4.34) id 1BShnQ-0003Kw-Be
	for patrick@localhost; Tue, 25 May 2004 20:41:08 +0100
Received: from pop.ntlworld.com [62.253.162.50]
	by localhost with POP3 (fetchmail-6.2.5)
	for patrick@localhost (single-drop);
	Tue, 25 May 2004 20:41:08 +0100 (BST)
Received: from spohr.debian.org ([128.193.0.4]) by mta10-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040525193736.BXCI13246.mta10-svc.ntlworld.com@spohr.debian.org>
	for <tykepenguin@ntlworld.com>; Tue, 25 May 2004 20:37:36 +0100
Received: from debbugs by spohr.debian.org with local (Exim 3.35 1 (Debian))
	id 1BShfb-0004y3-00; Tue, 25 May 2004 12:33:03 -0700
X-Loop: owner@bugs.debian.org
Subject: Bug#250906: lvm10: lvdisplay doesn't give proper return codes
Reply-To: Marc Haber <mh+debian-bugs@zugschlus.de>, 250906@bugs.debian.org
Resent-From: Marc Haber <mh+debian-bugs@zugschlus.de>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: Patrick Caulfield <patrick@debian.org>
Resent-Date: Tue, 25 May 2004 19:33:01 UTC
Resent-Message-ID: <handler.250906.B.108551323517774@bugs.debian.org>
X-Debian-PR-Message: report 250906
X-Debian-PR-Package: lvm10
X-Debian-PR-Keywords: 
Received: via spool by submit@bugs.debian.org id=B.108551323517774
	(code B ref -1); Tue, 25 May 2004 19:33:01 UTC
Received: (at submit) by bugs.debian.org; 25 May 2004 19:27:15 +0000
Received: from de46d.ipsec0.torres.ka0.zugschlus.de (torres.ka0.zugschlus.de)
	[212.126.222.70] (Debian-exim)
	by spohr.debian.org with esmtp (Exim 3.35 1 (Debian))
	id 1BShZz-0004cV-00; Tue, 25 May 2004 12:27:15 -0700
Received: from lefler.int.ka0.zugschlus.de ([192.168.130.38]:32793)
	by torres.ka0.zugschlus.de with esmtp (Exim 4.34 (Debian package
	4.34-0+1zg1)) id 1BShZx-0003mZ-PG; Tue, 25 May 2004 21:27:13 +0200
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Marc Haber <mh+debian-bugs@zugschlus.de>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Bcc: Marc Haber <mh+debian-bugs@zugschlus.de>
X-Mailer: reportbug 2.60
Date: Tue, 25 May 2004 21:27:11 +0200
Message-ID: <E1BShZx-0003mZ-PG@torres.ka0.zugschlus.de>
Delivered-To: submit@bugs.debian.org
Resent-Sender: Debian BTS <debbugs@bugs.debian.org>
X-Spam-Checker-Version: SpamAssassin 2.63 (2004-01-11) on fentible.pjc.net
X-Spam-Level: 
X-Spam-Status: No, hits=-4.9 required=3.3 tests=BAYES_00 autolearn=ham 
	version=2.63

Package: lvm10
Version: 1:1.0.8-3
Severity: normal

|[1/501]root@lefler:~$ lvdisplay /dev/vg0/usr; echo $?
|--- Logical volume ---
|LV Name                /dev/vg0/usr
|VG Name                vg0
|LV Write Access        read/write
|LV Status              available
|LV #                   1
|# open                 1
|LV Size                2 GB
|Current LE             64
|Allocated LE           64
|Allocation             next free
|Read ahead sectors     1024
|Block device           58:3
|
|
|0
|[2/502]root@lefler:~$ lvdisplay /dev/vg0/usf; echo $?
|lvdisplay -- logical volume "/dev/vg0/usf" doesn't exist
|
|
|0
|[3/503]root@lefler:~$ 

In the second case, I would expect a non-zero exit code.

Greetings
Marc

-- System Information:
Debian Release: testing/unstable
  APT prefers unstable
  APT policy: (500, 'unstable')
Architecture: i386 (i686)
Kernel: Linux 2.4.26-zgserver
Locale: LANG=C, LC_CTYPE=C

Versions of packages lvm10 depends on:
ii  debconf                     1.4.25       Debian configuration management sy
ii  file                        4.07-2       Determines file type using "magic"
ii  libc6                       2.3.2.ds1-12 GNU C Library: Shared libraries an
ii  lvm-common                  1.5.14       The Logical Volume Manager for Lin

-- debconf information excluded


--3MwIy2ne0vdjdPXF--
