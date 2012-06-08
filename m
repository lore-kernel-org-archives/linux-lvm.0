Received: from bmr.usersys.redhat.com (dhcp-1-199.fab.redhat.com [10.33.1.199])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q58AUCCL013662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 8 Jun 2012 06:30:13 -0400
Message-ID: <4FD1D433.7040307@redhat.com>
Date: Fri, 08 Jun 2012 11:30:11 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <SNT112-W389A6F910219E90B5BBD1790F20@phx.gbl>
In-Reply-To: <SNT112-W389A6F910219E90B5BBD1790F20@phx.gbl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM download.
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

On 06/08/2012 11:16 AM, Veruca Salt wrote:
> Username and password for Redhat LVM source ftp?(I've tried the
> usual suspects).

Works fine via anonymous ftp here:

$ lftp sources.redhat.com
lftp sources.redhat.com:~> cd pub/lvm2
cd ok, cwd=/pub/lvm2
lftp sources.redhat.com:/pub/lvm2> ls
drwxrwsr-x   5 ftp      ftp          4096 Mar  6 03:47 .
drwxrwsr-x  51 ftp      ftp          4096 Jun  8 09:34 ..
drwxrwsr-x   2 ftp      ftp          4096 Feb 16  2004 CVS
- -r--r--r--   2 ftp      ftp        466225 Oct 16  2005 LVM2.2.01.15.tgz
- -r--r--r--   2 ftp      ftp           189 Oct 16  2005
LVM2.2.01.15.tgz.asc
- -r--r--r--   2 ftp      ftp        531905 Aug 24  2007 LVM2.2.02.28.tgz
- -r--r--r--   2 ftp      ftp           189 Aug 24  2007
LVM2.2.02.28.tgz.asc
[...]

You can also access it from a browser via
ftp://sources.redhat.com/pub/lvm2/ which is linked from the LVM2
resources page here:

http://sourceware.org/lvm2/

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/R1DMACgkQ6YSQoMYUY96fhwCgnssXLDHLMVj9RgmcNlvbrLVi
NlIAoN4dxa8/yXiEyixWMKOUVHC+TTRq
=y2pw
-----END PGP SIGNATURE-----
