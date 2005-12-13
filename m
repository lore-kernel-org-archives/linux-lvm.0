Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBDDhW126740
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 08:43:32 -0500
Received: from pr.selfip.biz (pr.selfip.biz [80.72.255.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBDDhLxS003402
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 08:43:25 -0500
Received: from localhost (localhost [127.0.0.1])
	by pr.selfip.biz (Postfix) with ESMTP id D16F08B8096
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 14:43:20 +0100 (CET)
Received: from pr.selfip.biz ([127.0.0.1])
	by localhost (delta [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 07168-03 for <linux-lvm@redhat.com>;
	Tue, 13 Dec 2005 14:43:14 +0100 (CET)
Received: from [192.168.1.6] (unknown [192.168.1.6])
	by pr.selfip.biz (Postfix) with ESMTP id A2F508B8095
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 14:43:14 +0100 (CET)
Message-ID: <439ECFEB.4090309@reinhardtweb.de>
Date: Tue, 13 Dec 2005 14:43:07 +0100
From: Patrick Reinhardt <pr@reinhardtweb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple lvm2-snapshots on the same origin
	->	device-mapper error
References: <439EB4BB.2070009@web.de>
	<20051213122545.GF25866@agk.surrey.redhat.com>
In-Reply-To: <20051213122545.GF25866@agk.surrey.redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi!
Thank you for the hints.

Alasdair G Kergon schrieb:
> We don't have a solution for that particular problem yet, but we do have code 
> changes that should avoid the risk of the system locking up when it happens.

In fact i need about 40 snapshots of a single filesystem for xen. Do you
have any idea how to circumvent the problem? Maybe by creating 3
identical origin filesystems and distribute the snapshots?

Thank you in advance.

Patrick Reinhardt
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3-cvs (MingW32)
Comment: GnuPT 2.7.4

iD8DBQFDns/rf1C3plDEOPkRAuUpAJsHKnUEY+ZqQAU7f5WVBkK1lWZWfwCePLbQ
iF2UzozJ4yLUM4ZUoTVwlg4=
=i8JQ
-----END PGP SIGNATURE-----
