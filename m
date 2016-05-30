Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4UJrKtB027616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 30 May 2016 15:53:20 -0400
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.231])
	by mx1.redhat.com (Postfix) with ESMTP id F38AA63154
	for <linux-lvm@redhat.com>; Mon, 30 May 2016 19:53:19 +0000 (UTC)
References: <574B1DC9.2090700@ubuntu.com>
	<db139f28-5020-31b2-abc6-80c94daf7bdb@redhat.com>
From: Phillip Susi <psusi@ubuntu.com>
Message-ID: <574C9A2E.1080109@ubuntu.com>
Date: Mon, 30 May 2016 15:53:18 -0400
MIME-Version: 1.0
In-Reply-To: <db139f28-5020-31b2-abc6-80c94daf7bdb@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM says physical volumes are missing,
	but they are not
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
To: Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 05/30/2016 04:15 AM, Zdenek Kabelac wrote:
> Hi
> 
> Please provide full 'vgchage -ay -vvvv' trace of such activation
> command.
> 
> Also specify which version of lvm2 is in use by your distro.

2.02.133-1ubuntu10.  I ended up fixing it by doing a vgcfgbackup,
manually editing the text file to remove the MISSING flags, and then
vgcfgrestore.  My guess is that when I initially installed 16.04, I
forgot to install mdadm, and so the init scripts must have forced a
partial activation without the raid pvs present, and that set the
MISSING flag on those pvs in the metadata on the remaining drive.
Once set, there appears to be no way to remedy this other than what I
ended up doing.  It seems to me that having the volume actually
present should override the MISSING flag in the metadata, or at least
you should be able to clear the flag with pvchange.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCgAGBQJXTJooAAoJEBB5UWFcu6UWfoEH/iYx2giltU+WiJO382qWCzy7
g73itTdrC9oTsQVtYaMqHNtnZQfjxBIzCilpSMfMU7xpvmWGA8rCgNBpc6CNx/29
YB4T4nEEvFgklGPfq6PLDrBwxgOWkiBgwbDtjxwrFAC2mDerx/Y5SXZHYZmne08t
aKT6noyDAaepMlxxzFg3YpD0zI4brcvQZ2WPlZy0T2KxfxDriwwcD6U2pyRla6Gf
7KMO5orF6lSqzDXogfWb4AEjSgiFAkTYsgV49gouunWsyJIsur7BFVtV9MmrEgOP
3CQmAdhVowefe3K2OSxZ3luBLT0aWD4yGo285w+/IhfTzeAC3b9srmFC2eU9Szo=
=mNGi
-----END PGP SIGNATURE-----
