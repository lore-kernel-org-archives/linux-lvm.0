Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB1JCHwI016082
	for <linux-lvm@redhat.com>; Mon, 1 Dec 2014 14:12:17 -0500
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB1JCFqJ024030
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 1 Dec 2014 14:12:16 -0500
Received: by mail-qa0-f52.google.com with SMTP id dc16so7512145qab.25
	for <linux-lvm@redhat.com>; Mon, 01 Dec 2014 11:12:15 -0800 (PST)
Received: from [10.1.1.236] (fl-67-77-88-12.sta.embarqhsd.net. [67.77.88.12])
	by mx.google.com with ESMTPSA id
	w75sm18109360qgd.14.2014.12.01.11.12.14 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 11:12:14 -0800 (PST)
Sender: Phillip Susi <phillsusi@gmail.com>
Message-ID: <547CBD81.4070907@ubuntu.com>
Date: Mon, 01 Dec 2014 14:12:01 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] flakey target isn't flaking
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

Ubuntu's linux kernel version 3.13.0-39-generic, lvm 2.02.98.

Table:

flakey: 0 20480 flakey 7:0 0 10 1 0

That should be throwing IO errors for one out of every 11 seconds, but
I run:

while :; do sudo dd bs=65536 count=1 if=/dev/mapper/flakey
of=/dev/null iflag=direct ; sleep 0.2 ; done

And it never sees any errors.  What gives?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQEcBAEBAgAGBQJUfL2BAAoJENRVrw2cjl5RIlkH/1qJzuopgKUzQRcSQcB9wivc
XHv+Hl6hCQj2ToxH9atzdTB2xaab9ZCx/oWvH0ATeXKE5b/q9cJbeVoreKYTYxoY
0o8Kw/7LuCdQE1G5HCnO9MVXbQbDRlt9Fo9mzXDFI70jU+X0b0k/XDPLbBxcARPS
FYiGA+TA1OdMmAMo24Yo7vHoz20dTczioyKRvR6CcRfFEEX1oK1SOvjegx+DC7fi
N1myxRzFQDfXVm0wZNOpwt8qpoSs3sN96BglSifP/038LqqDL+4PcJGft6V+ogjA
X+5Mvtmbxs65/bUbrVlnimkxneo3e6oqdWD7GKswmLZGhUg86I+DgppKMoSpGq0=
=c/hc
-----END PGP SIGNATURE-----
