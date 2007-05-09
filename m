Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l49ITCa8024889
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 14:29:12 -0400
Received: from mail.opendreams.net (mail.opendreams.net [69.88.106.142])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l49IT2EQ024319
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 14:29:04 -0400
Date: Wed, 9 May 2007 11:28:50 -0700
From: Jesse Molina <jesse@opendreams.net>
Subject: Re: [linux-lvm] Can't use LVM1 VG/LVs under LVM2;
	LV xxx: inconsistent LE count 32 != 64
Message-ID: <20070509182848.GA20114@sorrows.opendreams.net>
References: <4641541D.2010709@opendreams.net> <4641970A.8000606@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <4641970A.8000606@redhat.com>
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


Thanks for the replies.  I see that Debian has a lvm2 package version 2.02.24-6 out, and I'll try to install that.  However, I'll have to force the install, as 2.4 kernels are completely dead on Debian Unstable now, due to recent versions of libc6 requiring NPTL.  Hopefully I won't get into a critical dependency problem.



On Wed, May 09, 2007 at 10:40:26AM +0100, Bryn M. Reeves wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Jesse Molina wrote:
> > 
> > I'm having a problem getting a Debian system from Linux kernel 2.4 to
> > 2.6 due to LVM.  On the 2.4 kernel/LVM1, the VGs and LVs work fine,
> > mount up, and show absolutely no sign of any problem.  However, I can't
> > get the 2.6 kernel/LVM2 to activate the VGs at all.
> > 
> > I've filed a Debian bug, which has additional information, here;
> >     http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=422963
> > 
> > 
> > 
> > The interesting error messages under 2.6 include;
> > 
> >     "LV tmp: inconsistent LE count 32 != 64"
> >     
> >     "System ID sorrows1107837513 on /dev/sdd3 differs from
> > sorrows1107837515 for volume group"
> 
> Hi Jesse,
> 
> This sounds like:
> 
> https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=232397
> 
> This is fixed upstream in versions from v2_02_24:
> - --------
> /cvs/lvm2/LVM2/WHATS_NEW:
> revision 1.586
> date: 2007/03/15 13:38:27;  author: agk;  state: Exp;  lines: +2 -2
> Try to fix reading in of lvm1 striped LVs.
> There are two fixes other than improving variable names and updating
> code layout etc.
> 
> The loop counter is incremented by area_len instead of area_len * stripes;
> 
> the 3rd _check_stripe parameter is no longer multiplied by number of
> stripes.
> - --------
> 
> Kind regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
> 
> iD8DBQFGQZcK6YSQoMYUY94RAqenAKCLdOcbDCJSFqvDUwZsUx/yZXQebgCfTdXu
> Nwz6xK1mCHIiiPVpHp6h0Ss=
> =fBTO
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.602.323.7608
# Web  = http://www.opendreams.net/jesse/
 
 
