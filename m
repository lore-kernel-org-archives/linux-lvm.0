Message-Id: <4.1.19990217215840.0096c480@mail.msy.bellsouth.net>
Date: Wed, 17 Feb 1999 22:03:42 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: Re: [linux-lvm] Re: your mail
In-Reply-To: <199902180316.AA16171@mailgate1b.telekom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

>LILO is able to deal with sectors scattered over a boot disk limited
>by the 1024 cylinder BIOS rsstriction.
>This implies no need for a special boot area _if_ we lay all
>sectors LILO needs into the LV parts on that one disk.
>Or did you mean that with voot area?
>
>If LILO would be able to deal with sectors scattered over many disks,
>why to have a special boot area anyway?

Okay.  Let me make sure I understand this.  I think that what you're saying
is that at this point, LILO should be able handle an LV like any other
partition as far as booting is concerned?  If so, then the real problem
lies in getting the LVM turned on early enough that we can finish the boot
process, correct?  And if that were the case, we should be able to treat
the LVM like any other necessary kernel driver and install it with an
initrd.  Sorry to repeat things, but I want to make sure that I have a firm
understanding of what you're saying.

--Daniel
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
