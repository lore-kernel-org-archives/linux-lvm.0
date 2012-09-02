Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q82346Zo013252
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 23:04:06 -0400
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q82344TK031815
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 23:04:05 -0400
Received: by lagy9 with SMTP id y9so3301048lag.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 20:04:04 -0700 (PDT)
Received: by lbbgj3 with SMTP id gj3so2101547lbb.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 20:04:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+ZVM8syy6u06HzpNs+MXzeYAuDn1hr03eMCyDYmSiE-O6q55Q@mail.gmail.com>
References: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
	<14v9h9x123.ln2@goaway.wombat.san-francisco.ca.us>
	<CA+ZVM8vAABAuLF7DOJQ0gu1wdbdzGhBOeC1qZ=veM1pSZDFuRA@mail.gmail.com>
	<CA+ZVM8tGb8FQegEb3PE+rnCsV+T-RZXvPoGGMoNBD8znmdUWaQ@mail.gmail.com>
	<CANN7Ug28r40pLLwnajBrtjPJ0LeqR3+5PBNcWQpTE36kT-cZeA@mail.gmail.com>
	<CA+ZVM8syy6u06HzpNs+MXzeYAuDn1hr03eMCyDYmSiE-O6q55Q@mail.gmail.com>
From: Scott Merrilees <scott@merrilees.net>
Date: Sun, 2 Sep 2012 13:03:41 +1000
Message-ID: <CANN7Ug2XPpZJb=bv3okxsCpYwuEf0E0mqogN35_SDWe1EHxqww@mail.gmail.com>
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

Reboot would clean all currently loaded state from the kernel / processes.
Wouldn't clean any state stored on disk.

I am not 100% sure what state is stored where for lvm.
I guess that since vg04 was self contained on one disk,
and since we can't see anything about vg04,
that the vg information in saved on the pv in some form,
and that importing the vg loads the information and is used to setup
the device mapper.

If that is the case, then a reboot should clear things up, but also
the dmsetup remove should clear things up.

If the current state is stored in more than the device mapper, then
just a dmsetup remove may be insufficient.

If you have the vgs spread over more than 1 pv, then I expect lvm
would be telling you that it can't find
various pvs with certain pv_uuids, which is what I've more often seen
when I've done things myself in the
wrong sequence.
--
Scott Merrilees


On Sun, Sep 2, 2012 at 12:41 PM, Rene C. <openvz@dokbua.com> wrote:
> What difference would it make rebooting the server?
>
> To recreate the missing drive/PV I'd need a blank drive right?  I
> don't have that, the drive was replace with another drive that I just
> called pv05 and is now active and being used.
