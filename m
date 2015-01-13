Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0D1tDNv010355
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 20:55:13 -0500
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.231])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0D1tChF007754
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 20:55:12 -0500
Message-ID: <54B47AFF.7040304@ubuntu.com>
Date: Mon, 12 Jan 2015 20:55:11 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <549471E8.6060209@ubuntu.com> <54B3662C.4080902@tlinx.org>
In-Reply-To: <54B3662C.4080902@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Renaming volumes and /proc/mounts
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
Hash: SHA512

On 01/12/2015 01:14 AM, Linda A. Walsh wrote:
> Phillip Susi wrote:
>> Is it possible to get /proc/mounts to update to the new name
>> after doing an lvrename of a mounted volume?  It plays hell on
>> update-grub when you rename a mounted volume and /proc/mounts
>> still has the old name.
>> 
> lvrename can rename an actively mounted device?  Is it supposed to
> do that?
> 
> That sounds a bit strange.  I mean if I rename a network device,
> I'd have to take down the interface before renaming it.  I'd think
> with a disk partition unmounting it would be, at least, prudent?
> Is it really not necessary?

Of course; the only problem is that /proc/mounts still lists the old
name so an update-grub still uses the old name in /boot/grub/grub.cfg,
so after a reboot, I have to manually edit the command to point to the
new name to boot, then re-run update-grub so subsequent boots work right.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCgAGBQJUtHr/AAoJENRVrw2cjl5RzUAH/0T7snlgVK287JCh8lwoWXLr
SWif87Si5DxliTxMpkxaCbxtLfv8WgajJa49wbDCuHRdA9YR1LpcZXMzJZxrstBZ
AyJg+iMkUM2+VgfC6QpuCEDbN7C43jONSHiiEuWT+bcPfY9kqmsUted6/SspV2tq
dltiKPrFgsktQYZVIynEZZwKvbX/jV13zbusdQJDE8nqRtOO0grYApi1qwEvxdvd
MdBZXUeJZahCMFu0UE3MCdIznLFUFLgAbS5J2Mld8KB3hJV9I55Eoo6K6IIeq77+
wiq/8aCcODYjqClw6LEl1uRRPgPBJFLyeZ8/cbc6EUZke3pfK9adVCU2Vqbqg6E=
=fsnN
-----END PGP SIGNATURE-----
