Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBBEH83p020941
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2014 09:17:08 -0500
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBBEH6IX004001
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2014 09:17:07 -0500
Received: by mail-qc0-f173.google.com with SMTP id i17so3851318qcy.4
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2014 06:17:06 -0800 (PST)
Sender: Phillip Susi <phillsusi@gmail.com>
Message-ID: <5489A75F.6040307@ubuntu.com>
Date: Thu, 11 Dec 2014 09:17:03 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <5480E939.3070702@ubuntu.com>
	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
	<5484C5A7.8080601@ubuntu.com>
	<CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
	<op.xqkhx9gjae9kta@comodus> <5488F019.80805@ubuntu.com>
	<op.xqokpwo4ae9kta@comodus>
In-Reply-To: <op.xqokpwo4ae9kta@comodus>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
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
To: Jason Warr <jason@warr.net>, LVM general discussion and development <linux-lvm@redhat.com>, Anatoly Pugachev <matorola@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/10/2014 8:50 PM, Jason Warr wrote:
> It ignores the name because what it does with "--trackchanges" is
> rename the mirror leg to a visible & read only version of the meta.
> Sample:

You mean it changes the flags to visible and read only.  I don't see
why it can't rename it as well.

> You can't track changes and rename the "backup" leg at the same
> time. If you wanted to keep the backup leg after making sure the in
> use one was good you would need to issue a new "--splitmirror" 
> command with a new volume name and *no* "--trackchanges" option.

Why not?  A name is just a name; it does not *have* to be called
origin_rimage_0.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQEcBAEBAgAGBQJUiadfAAoJENRVrw2cjl5Rt+kH/2edRv5pygm91ULcpZ9ehRuW
9bB0CpjyrLEp/f8bdqkcoyR2cpcuM2kUXBstvn7YLgyJnBdm8JNt6gZnanJLQ0gr
CXx6Tu2OQfp87NTbUDqJOLku6EaAQ053zQAoBgnIctFaCUGU+hC1L3iwdkYGnVwZ
uTdY0C3/t7ShPDvXqTrIqNugqOj7NFAptpENzxBavrkaIp5w47fvVHpWwFpwO3sU
CheSV+gpqHKlc6T6DfZlDCcCnZHKmMhXzs4EigNZIZFzM8INhn01mJ64tUJKNET7
eLvqIH8labOqAp4PVFido6Kgl6K/BKvGbzGJcqE9IR2V23yvzRHjretAGnFwed4=
=sGDQ
-----END PGP SIGNATURE-----
