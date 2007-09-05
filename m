Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l85A97Y0002540
	for <linux-lvm@redhat.com>; Wed, 5 Sep 2007 06:09:07 -0400
Message-ID: <46DE7FB6.3090203@redhat.com>
Date: Wed, 05 Sep 2007 11:06:46 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
References: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>	<46D9B8B2.3070104@theendofthetunnel.de>	<d00698fb0709011605h25edefbep1c989c23effe5c55@mail.gmail.com>
	<d00698fb0709050257y220be827ybc88fd680b14f1d4@mail.gmail.com>
In-Reply-To: <d00698fb0709050257y220be827ybc88fd680b14f1d4@mail.gmail.com>
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
> 2007/9/2, noah <noah123@gmail.com>:
>> 2007/9/1, Hannes Dorbath <light@theendofthetunnel.de>:
>>> noah wrote:
>>>> Pvmove hung and now all commands that access the filesystem hang too,
>>>> possibly in uninterruptible sleep.
>>>> Is this a bug or did I do something forbidden, somehow? ;)
>>> To my knowledge pvmove is broken on 2.6.22. I'd go back to 2.6.21 until
>>> there is a fix. Maybe there is already a fix, I haven't followed it.
>> Thanks for a quick reply.
>> Has this problem been documented elsewhere?
>> Just curious what the problem is and whether anybody is working on a fix.
> 
> I'm still curious what the problem is, when it happend, why and
> whether or not somebody is working on it.
> Is this a problem with dm, lvm, barriers, userland utilities or something else?

The fix was merged in 2.6.22.2 - file a bug with your distribution to
have it included.

The patch is here:

http://lkml.org/lkml/2007/8/7/401

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFG3n+26YSQoMYUY94RAtk5AKCAGLOnNed1kXmR7zhP86NKK0ufGQCcDfFo
aF9pK74vakanyaf4VzKzJ1o=
=iHq+
-----END PGP SIGNATURE-----
