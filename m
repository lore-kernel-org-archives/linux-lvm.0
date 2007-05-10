Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4AJxJJU016644
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 15:59:19 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.232])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4AJxHQD014161
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 15:59:18 -0400
Received: by wx-out-0506.google.com with SMTP id s11so655191wxc
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 12:59:17 -0700 (PDT)
Message-ID: <aad5bb0705101259t18703524x46dc9f1fa48ecc06@mail.gmail.com>
Date: Thu, 10 May 2007 21:59:17 +0200
From: "Damir Hasakovic" <bosnianx@gmail.com>
Subject: Re: [linux-lvm] How to remove crashed inaccessible harddrive from
	LVM2.
In-Reply-To: <4639D56F.9070802@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <aad5bb0705030448i100ffe37of929baac081535b4@mail.gmail.com>
	<4639D56F.9070802@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 5/3/07, Bryn M. Reeves <breeves@redhat.com> wrote:

>
> LVM2 allows you to activate partial volume groups and to remove missing
> physical volumes via the --partial and --removemissing options to
> vgchange and vgreduce. See the manual pages for full details.
>
> It sounds like your failed drive has not 'gone away' but is throwing I/O
> errors for some sectors and maybe causing system hangs. You might be
> better off disconnecting it and booting the system into a rescue
> environment to perform the recovery of the volume group since it does
> not contain important data you want to recover.
>
> Kind regards,
> Bryn.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFGOdVv6YSQoMYUY94RAkmJAJ9V2faGbFKgpH5CIHLDrzFJL7lazgCfcpfm
> nz6q3j33RKyQuNKzWgPRAC0=
> =OAqy
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
Do u mean rescue env like booting with the rescue cd?

I tried to do like u said but when i disconnect the drive, some other
device take /dev/sdc from the failed drive but LVM complains that UID
is missing and when i check /etc/backup/VG i can see the missing UID
and that is the drive that have failed /dev/sdc

Now i'm afraird to remove the /dev/sdc from the volume group beacuse
some other drive took over /dev/sdc.

Can u please provide some useful commands that i can begin with?

Kind regards
//damir
