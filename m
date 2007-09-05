Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l85F6Tak021296
	for <linux-lvm@redhat.com>; Wed, 5 Sep 2007 11:06:30 -0400
Message-ID: <46DEC568.2050500@redhat.com>
Date: Wed, 05 Sep 2007 16:04:08 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
References: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>	<46D9B8B2.3070104@theendofthetunnel.de>	<d00698fb0709011605h25edefbep1c989c23effe5c55@mail.gmail.com>	<d00698fb0709050257y220be827ybc88fd680b14f1d4@mail.gmail.com>	<46DE7FB6.3090203@redhat.com>	<d00698fb0709050442w3f98f7baueeb3550022ce4186@mail.gmail.com>	<46DEA19C.9000207@redhat.com>
	<d00698fb0709050637p6d239d78l71b3ad932d290744@mail.gmail.com>
In-Reply-To: <d00698fb0709050637p6d239d78l71b3ad932d290744@mail.gmail.com>
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

noah wrote:
> aes-root: 0 6291456 linear 9:2 384
> aes-root: 6291456 2097152 linear 9:2 887095680
> aes-root: 8388608 2097152 linear 9:2 897941888
> raidB: 0 586113528 crypt aes-cbc-essiv:sha256
> 00000000000000000000000000000000 0 9:1 1032
> raidA: 0 976771960 crypt aes-cbc-essiv:sha256
> 00000000000000000000000000000000 0 9:0 1032

Yep - that all looks normal, the devices with "linear" in the 4th field
are your regular logical volumes, then there are two crypts as well.

During a pvmove, the linear mappings will change to mirror mappings.
E.g. on a test box here, I have a VG named "t1" with an LV named "l0"
backed by two loop devices (only one is in use initially):

t1-l0: 0 4194304 linear

During a pvmove, the LV being moved would have its linear status line
replaced with a status line like this:

t1-pvmove0: 0 4194304 mirror 2 7:0 7:1 720/4096 1 AA 1 core

The 720/4096 is the progress - we've sync'ed 720 out of 4096 mirror
regions on the device. Running status repeatedly I see:

t1-pvmove0: 0 4194304 mirror 2 7:0 7:1 904/4096 1 AA 1 core
[...]
t1-pvmove0: 0 4194304 mirror 2 7:0 7:1 2557/4096 1 AA 1 core

Etc. If you are still able to reproduce the pvmove problem you can use
this to see if it's the status line bug in 2.6.22.

If not, as you describe the pvmove as hanging, a set of sysrq-t data
would be helpful to see where it's getting stuck. You can trigger this
from the keyboard or via /proc/sysrq-trigger.

The output will be sent to dmesg/syslog - it's likely to be very large,
so better to put it on something like pastebin than send it to the list.

It's most useful if you collect two sets, 5-10 seconds apart as this
allows to see if things are really stuck.

> Check.
> Is this list the correct place for bug reports or should I resend my
> mail to dm-devel@ or even lkml?

Yes - definitely the right place!

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFG3sVo6YSQoMYUY94RAskyAKCmmLYWDwSSQ+i0rG5H6W0qgoEEAwCfUnje
MDfXUHIXwT7dVmshka6AOAM=
=RAhk
-----END PGP SIGNATURE-----
