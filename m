Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l499kObP020491
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 10:46:25 +0100
Message-ID: <4641970A.8000606@redhat.com>
Date: Wed, 09 May 2007 10:40:26 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't use LVM1 VG/LVs under LVM2; LV xxx: inconsistent
	LE count 32 != 64
References: <4641541D.2010709@opendreams.net>
In-Reply-To: <4641541D.2010709@opendreams.net>
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

Jesse Molina wrote:
> 
> I'm having a problem getting a Debian system from Linux kernel 2.4 to
> 2.6 due to LVM.  On the 2.4 kernel/LVM1, the VGs and LVs work fine,
> mount up, and show absolutely no sign of any problem.  However, I can't
> get the 2.6 kernel/LVM2 to activate the VGs at all.
> 
> I've filed a Debian bug, which has additional information, here;
>     http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=422963
> 
> 
> 
> The interesting error messages under 2.6 include;
> 
>     "LV tmp: inconsistent LE count 32 != 64"
>     
>     "System ID sorrows1107837513 on /dev/sdd3 differs from
> sorrows1107837515 for volume group"

Hi Jesse,

This sounds like:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=232397

This is fixed upstream in versions from v2_02_24:
- --------
/cvs/lvm2/LVM2/WHATS_NEW:
revision 1.586
date: 2007/03/15 13:38:27;  author: agk;  state: Exp;  lines: +2 -2
Try to fix reading in of lvm1 striped LVs.
There are two fixes other than improving variable names and updating
code layout etc.

The loop counter is incremented by area_len instead of area_len * stripes;

the 3rd _check_stripe parameter is no longer multiplied by number of
stripes.
- --------

Kind regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGQZcK6YSQoMYUY94RAqenAKCLdOcbDCJSFqvDUwZsUx/yZXQebgCfTdXu
Nwz6xK1mCHIiiPVpHp6h0Ss=
=fBTO
-----END PGP SIGNATURE-----
