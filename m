Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l85CXjWk025434
	for <linux-lvm@redhat.com>; Wed, 5 Sep 2007 08:33:45 -0400
Message-ID: <46DEA19C.9000207@redhat.com>
Date: Wed, 05 Sep 2007 13:31:24 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
References: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>	<46D9B8B2.3070104@theendofthetunnel.de>	<d00698fb0709011605h25edefbep1c989c23effe5c55@mail.gmail.com>	<d00698fb0709050257y220be827ybc88fd680b14f1d4@mail.gmail.com>	<46DE7FB6.3090203@redhat.com>
	<d00698fb0709050442w3f98f7baueeb3550022ce4186@mail.gmail.com>
In-Reply-To: <d00698fb0709050442w3f98f7baueeb3550022ce4186@mail.gmail.com>
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
> This patch is already applied on the kernel i was running.
> Also, I'm not sure I'm using dm-raid at all since I don't have one of
> these lame software (BIOS) RAID cards. 

dm-raid1 is nothing to do with dmraid per-se (it's just one of the
targets dmraid might use to construct a raid set).

It is also used by pvmove - when you pvmove a volume, a temporary mirror
is constructed using dm-raid1, synchronised and then broken. After the
pvmove the newly sync'ed copy is substituted for the original PV.

> I'm using md and dm-crypt straight on top of the harddrives.

I'm not sure I understand - if you're only using md and dm-crypt, why is
pvmove involved?

You can directly view the status of the mirror/pvmoved volume using
"dmsetup status" - the patch I linked to earlier corrected a problem
with the status report that prevented userspace correctly parsing the
status updates.

It does sound from your description like you may have hit a separate
problem since you mention that the pvmove does initially proceed correctly.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFG3qGc6YSQoMYUY94RAo1SAJ0Vwpq5CaOxTw58T6hEPILDBb53CgCgwh8N
zY3ZdCnQKBt42/WrE2+ngVg=
=BAve
-----END PGP SIGNATURE-----
