Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4B80RAk032756
	for <linux-lvm@redhat.com>; Thu, 11 May 2006 04:00:27 -0400
Received: from sarajevo.idealx.com (sarajevo.idealx.com [213.41.87.90])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4B80PjX027327
	for <linux-lvm@redhat.com>; Thu, 11 May 2006 04:00:25 -0400
Received: from localhost (sarajevo [127.0.0.1])
	by sarajevo.idealx.com (IDEALX S.A.S Mail Daemon) with ESMTP id
	160EB11DFF7
	for <linux-lvm@redhat.com>; Thu, 11 May 2006 10:00:34 +0200 (CEST)
Received: from sarajevo.idealx.com ([127.0.0.1])
	by localhost (sarajevo.idealx.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16999-26 for <linux-lvm@redhat.com>;
	Thu, 11 May 2006 10:00:29 +0200 (CEST)
Message-ID: <4462EDD7.8060409@idealx.com>
Date: Thu, 11 May 2006 09:55:03 +0200
From: Dominique Quatravaux <dom@idealx.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [BUG] Spaces in LVM1 LV names => *deep trouble* when
	converting to LVM2
References: <44624C66.4050600@idealx.com>	<20060510203626.GW16180@agk.surrey.redhat.com>
	<20060510204038.GX16180@agk.surrey.redhat.com>
In-Reply-To: <20060510204038.GX16180@agk.surrey.redhat.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: pierre.machard@idealx.com, Benoit Picaud <benoit@idealx.com>, 'Mathias BROSSARD' <mbrossard@idealx.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alasdair G Kergon wrote:

>
> I should add that what you should do is extract the metadata you've
> retrieved off disk directly into a file, fix it in the file
> (differences in whitespace & comments don't matter) then use
> vgcfgrestore -f.

I tried that and it works - strange, I tried vgcfgrestore yesterday to
no avail... But then I was using Ubuntu 5.10's lvm2 package as a
rescue so apparently it's a different (and solved) issue. Thanks!

Knowing this, and still for the record: after any LVM operation it
seems wise to try a vgchange -a y *before* rebooting to see if
everything went well. Reverting a pickled LVM situation is much easier
with the original toolset handy (same LVM binary and metadata backups
in /etc/lvm/) than using a rescue CD!


I wrote, and you replied:

>> * there should be a mechanism for dealing with corrupt LVM
>> metadata, at the minimum a global command-line switch to
>> temporarily disable checksum verifications.
>
> Nope.
>

I seem to have pushed your button, apologies for doing so. I was
trying to be humorous, not disparaging: *of course* I concur that
checksums are a good idea! I guess it means that humor is too slippery
for us non-native speakers, oh well...

- --
Dominique QUATRAVAUX                           Ing=EF=BF=BDnieur senior
01 44 42 00 08                                 IDEALX

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEYu3XMJAKAU3mjcsRAugqAKC2KK88j/+w30xd6pxcn/5Juu7tuACdExXi
R2b4HLcvmPmWHl+uxhbvGi0=3D
=3DtWX0
-----END PGP SIGNATURE-----
