Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mALBa1mx024750
	for <linux-lvm@redhat.com>; Fri, 21 Nov 2008 06:36:01 -0500
Received: from fk-out-0910.google.com (fk-out-0910.google.com [209.85.128.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mALBZoOW025528
	for <linux-lvm@redhat.com>; Fri, 21 Nov 2008 06:35:50 -0500
Received: by fk-out-0910.google.com with SMTP id e30so997651fke.3
	for <linux-lvm@redhat.com>; Fri, 21 Nov 2008 03:35:49 -0800 (PST)
Message-ID: <38bdcd1f0811210335l3aa15004v99e76d4dcb7cc71a@mail.gmail.com>
Date: Fri, 21 Nov 2008 20:35:49 +0900
From: "Masanari Iida" <standby24x7@gmail.com>
Subject: Re: [linux-lvm] Share Volume Group between x86-64 and x86.
In-Reply-To: <492696EE.3070709@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <38bdcd1f0811210309k67f7ed36uc45fe0848374739@mail.gmail.com>
	<492696EE.3070709@redhat.com>
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

Thank you !


On Fri, Nov 21, 2008 at 8:09 PM, Bryn M. Reeves <bmr@redhat.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Masanari Iida wrote:
>> Hello list,
>>
>> I have a question about LVM2 compatibility between different CPU architectures.
>>
>> If one create a VG on x86(32bit) and export the VG,
>> then try to import the VG on x86(64bit), what is going to happen?
>> Both systems are RHEL5, in my mind.
>
> It will work just fine - LVM2 metadata is in text format and the binary
> components (labels, metadata area headers) are treated in an
> architecture-neutral way to avoid compatibility problems.
>
> Regards,
> Bryn.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iEYEARECAAYFAkkmlu4ACgkQ6YSQoMYUY96KwgCguVHo5eKjFo5s8YxgFYBAcA8V
> GN8AnRG//aoroZCSEZFlaNioxmg+V4ob
> =dvTs
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
