Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98DD61001903
	for <linux-lvm@redhat.com>; Sat, 12 May 2018 11:30:45 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1267816C380
	for <linux-lvm@redhat.com>; Sat, 12 May 2018 11:30:44 +0000 (UTC)
Received: from monk.localnet ([46.5.19.123]) by mail.gmx.com (mrgmx003
	[212.227.17.190]) with ESMTPSA (Nemesis) id 0MUILK-1eqTv14AUM-00R4s5
	for <linux-lvm@redhat.com>; Sat, 12 May 2018 13:30:42 +0200
From: Dennis Schridde <devurandom@gmx.net>
Date: Sat, 12 May 2018 13:30:36 +0200
Message-ID: <2496144.kxeQXG1iRO@monk>
In-Reply-To: <1973783.dFIIZJkBNM@monk>
References: <1973783.dFIIZJkBNM@monk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1870438.9bDCGThkuQ";
	micalg="pgp-sha256"; protocol="application/pgp-signature"
Subject: Re: [linux-lvm] Check of pool ernie/cache failed (status:1). Manual
	repair required!
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
To: linux-lvm@redhat.com

--nextPart1870438.9bDCGThkuQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 11 May 2018 19:34:42 CEST Dennis Schridde wrote:
> Hello!
> 
> I have an issue re-gaining access to my data.  The error messages are:
> # lvchange -ay ernie/system
>   Check of pool ernie/cache failed (status:1). Manual repair required!
> # lvconvert --repair ernie/system
> bad checksum in superblock
>   Repair of cache metadata volume of cache ernie/system failed (status:1).
> Manual repair required!
> 
> How do I recover from this situation and repair the volume group?
> 
> For a full log, including the output of pvdisplay, vgdisplay and lvdisplay
> -a, please see attached log file.  If more information is necessary, please
> ask.
> 
> What led to this situation:
> I am using one of the infamous AMD Ryzen 2400G with an AMD B350 chipset,
> which suffers from random lockups related to CPU C-states [1].  With the
> recent AGESA 1.0.0.2a firmware update and the introduction of the "Power
> Supply Idle Control = Typical Current Idle" setting, the system is stable,
> if it boots at all.  But it often takes several attempts to boot -- the
> failed attempts ending in weird firmware / EFI or CPU / idle related Linux
> kernel stack traces, which sometimes even require a hard reset, since
> soft-reboot (ctrl+alt +del) sometimes has no effect, because init dies. 
> This was such a situation, where I had to reboot (ctrl+alt+del) and reset
> (hard) the system several times, at the end of which everything seemed
> fine, except that dracut was timing out when activating the disks. 
> Debugging the situation using a Fedora 28 live system resulted in the
> attached log file.
> 
> --Dennis
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=196683

P.S. I already found older posts [2,3] describing a similar scenario.  At the 
time a recovery was impossible for the user, but it seems that the situation 
improved somewhat since then.  However, I am still stick, with `lvconvert --
repair` asking me to repair "manually" (whatever that means), `cache_dump --
repair` not being able to operate on non-active LVs and LVM refusing to 
activate the LV as long as it has not been repaired.

[2]: https://www.redhat.com/archives/linux-lvm/2016-December/msg00013.html
[3]: https://www.redhat.com/archives/linux-lvm/2015-August/msg00008.html
--nextPart1870438.9bDCGThkuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlr20FwACgkQz+h/M161
qdw/Sgv/VfSMDA/z1aclc5GB2sBJoJaWPN1DvpW3XMFTyP9rn2Ldn1kS1t1o/vZI
N1n3ubT1/J5nQpm0x3x1NZopnJBbXgbpUtPQtFKwpOAh/uNUsRxGh8z/r+7Wdqm8
2jTJRYFChwUwWX6JmY9nsItCJX7evrPSCNMFlgc3OkkFbL20JWnaEEUtpcZYMl3v
+mvIeXrOILMQTTjrmBvZHiqaIoYI/zgoy6PX3kNrW9RBm6R0/lTDIy84v3pwIVjH
LPxq9QSX6Y2V449gfRM2fXEkO30SiNQct8suM7qHQIP14zHbxtpdLvoesnW2w5eM
9zAi7Xzmty6kmQDIrNriacno6kY9dVCrSX5F0iu+8i2GuHm1RiSJxDDvG8dmuW8j
/T6Ik7a+CooZ02rjHIpJNNdU7n2GQlYVQbbMuGkJDfTYIDMpZRRrVNA9YUpr4Mwv
rP5i4JjSZEGQWWqr/TsaK0YzCNft9nbmsFVFBZW40xceYNf6givTmsnRU4X2sO3C
z+NbdlM4
=zOsb
-----END PGP SIGNATURE-----

--nextPart1870438.9bDCGThkuQ--
