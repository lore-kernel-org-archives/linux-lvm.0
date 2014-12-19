Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBJIiFrG021285
	for <linux-lvm@redhat.com>; Fri, 19 Dec 2014 13:44:15 -0500
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBJIiEbp008335
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 19 Dec 2014 13:44:14 -0500
Received: by mail-qa0-f42.google.com with SMTP id n8so1022645qaq.1
	for <linux-lvm@redhat.com>; Fri, 19 Dec 2014 10:44:13 -0800 (PST)
Received: from [10.1.1.236] (fl-67-77-88-12.sta.embarqhsd.net. [67.77.88.12])
	by mx.google.com with ESMTPSA id
	n1sm10127987qag.21.2014.12.19.10.44.09 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Dec 2014 10:44:13 -0800 (PST)
Sender: Phillip Susi <phillsusi@gmail.com>
Message-ID: <549471E8.6060209@ubuntu.com>
Date: Fri, 19 Dec 2014 13:43:52 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Renaming volumes and /proc/mounts
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Is it possible to get /proc/mounts to update to the new name after
doing an lvrename of a mounted volume?  It plays hell on update-grub
when you rename a mounted volume and /proc/mounts still has the old name.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQEcBAEBAgAGBQJUlHHoAAoJENRVrw2cjl5RvssIALM5i78HARjbckHLNqzCbzFh
7IwocXHQB8lmo3xhQrR64aAJFSnF8T4iI+ikNICTGI5QWYFc1FZkFW+fm2MRNK56
Kt0H+bEn/dyO0/2mYZlGNcBPPPRH10Ldgh4eFHzxVk8KsVWOACqMBTY2xENBt27D
xVaMICGfI1Nl9nqiLzuiThLxgQ8E19t66qcohGtAw4PG8Ox0WZHiaQjqv/zqXWv1
Qv6jWFMy3/LtCp2K1NeuZ/7RR+HBhQPj4OngrWxb7Wg/TdAyY1d6NasNRRJKoRtD
13awUzomFxaZEm9xz+J90d9+ke4LC+cRyz3OKAHZHsow2LQBeyDh6zNXNezE93A=
=q9Tl
-----END PGP SIGNATURE-----
