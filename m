Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q822fBc4019490
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:41:11 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q822fARN022387
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 22:41:11 -0400
Received: by iahk25 with SMTP id k25so3245348iah.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 19:41:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANN7Ug28r40pLLwnajBrtjPJ0LeqR3+5PBNcWQpTE36kT-cZeA@mail.gmail.com>
References: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
	<14v9h9x123.ln2@goaway.wombat.san-francisco.ca.us>
	<CA+ZVM8vAABAuLF7DOJQ0gu1wdbdzGhBOeC1qZ=veM1pSZDFuRA@mail.gmail.com>
	<CA+ZVM8tGb8FQegEb3PE+rnCsV+T-RZXvPoGGMoNBD8znmdUWaQ@mail.gmail.com>
	<CANN7Ug28r40pLLwnajBrtjPJ0LeqR3+5PBNcWQpTE36kT-cZeA@mail.gmail.com>
Date: Sun, 2 Sep 2012 09:41:10 +0700
Message-ID: <CA+ZVM8syy6u06HzpNs+MXzeYAuDn1hr03eMCyDYmSiE-O6q55Q@mail.gmail.com>
From: "Rene C." <openvz@dokbua.com>
Subject: Re: [linux-lvm] Removing vg and lv after physical drive has been
	removed
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

What difference would it make rebooting the server?

To recreate the missing drive/PV I'd need a blank drive right?  I
don't have that, the drive was replace with another drive that I just
called pv05 and is now active and being used.




On Sun, Sep 2, 2012 at 9:31 AM, Scott Merrilees <scott@merrilees.net> wrote:
> If you have a running production on the machine, and don't want to
> reboot, or otherwise break it, then it might be a good idea to spin up
> a virtual machine and break it in a similar way, and use that to test.
>
> It seems like lvm just uses the device mapper to maintain current
> state, so dmsetup is probably ok, but ... YMMV.
>
> I would try dmsetup remove
>
> then make sure the vgscan etal work ok without problems.
>
> If you get pv not found errors, then you might have to try re-creating
> pvs with the correct uuids.
> --
> Scott Merrilees
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
