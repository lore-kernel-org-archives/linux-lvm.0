From: Patrick Caulfield <caulfield@sistina.com>
Message-ID: <20030727122613.GB3186@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
Subject: [linux-lvm] [Bug#203051: lvm10: pvcreate detects partition table although there is none]
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
Date: Mon Jul 28 08:42:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline


-- 

patrick


--X1bOJ3K7DJ5YkBrT
Content-Type: message/rfc822
Content-Disposition: inline

X-Mail-Format-Warning: Bad RFC2822 header formatting in >From patrick  Sun Jul 27 12:50:48 2003
Return-path: <debbugs@master.debian.org>
Envelope-to: patrick@localhost
Delivery-date: Sun, 27 Jul 2003 12:50:48 +0100
Received: from localhost.pjc.net ([127.0.0.1] helo=localhost)
	by arthur.pjc.net with esmtp (Exim 3.36 #1 (Debian))
	id 19gk35-0001LY-00
	for <patrick@localhost>; Sun, 27 Jul 2003 12:50:47 +0100
Received: from mail.cix.co.uk
	by localhost with POP3 (fetchmail-5.9.11)
	for patrick@localhost (single-drop); Sun, 27 Jul 2003 12:50:47 +0100 (BST)
Received: from master.debian.org (master.debian.org [146.82.138.7])
	by mta04.mx.cix.co.uk (8.11.3/CIX/8.11.3) with ESMTP id h6RBm9P13029
	for <patrick@tykepenguin.cix.co.uk>; Sun, 27 Jul 2003 12:48:10 +0100
X-Envelope-From: debbugs@master.debian.org
Received: from debbugs by master.debian.org with local (Exim 3.35 1 (Debian))
	id 19gk0R-0005OJ-00; Sun, 27 Jul 2003 06:48:03 -0500
X-Loop: owner@bugs.debian.org
Subject: Bug#203051: lvm10: pvcreate detects partition table although there is none
Reply-To: Guido Guenther <agx@debian.org>, 203051@bugs.debian.org
Resent-From: Guido Guenther <agx@debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: Patrick Caulfield <patrick@debian.org>
Resent-Date: Sun, 27 Jul 2003 11:48:01 UTC
Resent-Message-ID: <handler.203051.B.105930622119598@bugs.debian.org>
X-Debian-PR-Message: report 203051
X-Debian-PR-Package: lvm10
X-Debian-PR-Keywords: 
Received: via spool by submit@bugs.debian.org id=B.105930622119598
          (code B ref -1); Sun, 27 Jul 2003 11:48:01 UTC
Received: (at submit) by bugs.debian.org; 27 Jul 2003 11:43:41 +0000
Received: from honk1.physik.uni-konstanz.de [134.34.140.224] 
	by master.debian.org with esmtp (Exim 3.35 1 (Debian))
	id 19gjwA-00055k-00; Sun, 27 Jul 2003 06:43:38 -0500
Received: from localhost (localhost [127.0.0.1])
	by honk1.physik.uni-konstanz.de (Postfix) with ESMTP id 729B22BC3F
	for <submit@bugs.debian.org>; Sun, 27 Jul 2003 13:43:37 +0200 (CEST)
Received: from honk1.physik.uni-konstanz.de ([127.0.0.1])
 by localhost (honk [127.0.0.1:10024]) (amavisd-new) with ESMTP id 18873-01
 for <submit@bugs.debian.org>; Sun, 27 Jul 2003 13:43:34 +0200 (CEST)
Received: from bogon.sigxcpu.org (kons-d9bb547c.pool.mediaWays.net [217.187.84.124])
	by honk1.physik.uni-konstanz.de (Postfix) with ESMTP id 1912B2BC3B
	for <submit@bugs.debian.org>; Sun, 27 Jul 2003 13:43:34 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
	id 22D00173AC; Sun, 27 Jul 2003 13:41:13 +0200 (CEST)
Date: Sun, 27 Jul 2003 13:41:13 +0200
From: Guido Guenther <agx@debian.org>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Message-ID: <20030727114113.GA8725@bogon.ms20.nix>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
X-Reportbug-Version: 2.18
User-Agent: Mutt/1.5.4i
X-Virus-Scanned: by amavisd-new-20021227-p2 (Debian)
Delivered-To: submit@bugs.debian.org
Resent-Sender: Debian BTS <debbugs@master.debian.org>
X-Envelope-To: patrick@tykepenguin.cix.co.uk
X-Spam-Status: No, hits=-12.9 required=3.4
	tests=BAYES_00,DEBIAN_BTS_BUG,PGP_SIGNATURE_2,USER_AGENT_MUTT,
	      X_LOOP
	autolearn=ham version=2.55
X-Spam-Level: 
X-Spam-Checker-Version: SpamAssassin 2.55 (1.174.2.19-2003-05-19-exp)


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: lvm10
Version: 1:1.0.7-4
Severity: normal

Hi,
If i create a dos partition table on a disk using fdisk, afterwards
erase it with dd if=/dev/zero of=/dev/hdf (as described in the manpage),
reboot (to make sure the kernel gets that there is no partition table
anymore) and then run pvcreate /dev/hdf on the device, pvcreate still
claims there is a partition table although there is none (verified with
hexdump) and refuses to create a pv making the disk unusable for lvm.
Regards,
 -- Guido

Kernel version is 2.4.21-rc1 in case that matters

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/I7pYn88szT8+ZCYRAjSnAJ9piHaTPcJ8ETGqj9e1u3EJEimBqgCcDhx+
S5gLQaWsqwAQCaC9klPEhWI=
=Lcit
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--


--X1bOJ3K7DJ5YkBrT--
