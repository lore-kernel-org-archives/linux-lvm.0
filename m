Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8ECtpr13003
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 08:55:51 -0400
Received: from copilotconsulting.com (ip-66-181-5-46.cust.i2bnetworks.com
	[66.181.5.46])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8ECteav018963
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 08:55:50 -0400
Received: from localhost (copilotconsulting.com [127.0.0.1])
	by copilotconsulting.com (Postfix) with ESMTP id 51F7BA90E1
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 05:45:42 -0700 (PDT)
Received: from copilotconsulting.com ([127.0.0.1])
	by localhost (copilotconsulting.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 13752-05 for <linux-lvm@redhat.com>;
	Tue, 14 Sep 2004 05:45:40 -0700 (PDT)
Date: Tue, 14 Sep 2004 05:45:40 -0700
From: Tracy R Reed <treed@copilotconsulting.com>
Subject: Re: [linux-lvm] massive LV corruption
Message-ID: <20040914124540.GA13649@copilotconsulting.com>
References: <20040914004607.GB9253@copilotconsulting.com>
	<58B212CA-0611-11D9-BB02-000A95730E92@spamaps.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <58B212CA-0611-11D9-BB02-000A95730E92@spamaps.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2004 at 10:45:55PM -0700, Clint Byrum spake thusly:
> I've never used resize_reiserfs, but I do know that a lot of people I=20
> talk to won't use ReiserFS because of past problems that have since=20
> been fixed. The tools that come with ReiserFS are generally very good.=20

I'm pretty sure it can't possibly be reiserfs because the actual lv's were
hosed. The LVM/block layer should prevent resize_reiserfs or any part of
reiserfs from damaging the lv's. I love reiser and have used it with great
success for years. I find it sad that people still pan reiserfs after all
this time. I am really looking forward to reiser4 (released already but I
want to see it get some more time behind it) and some cool plugins for it.
I have a feeling it is going to do for Linux what MS claims WinFS will
(someday) do for their OS.

> If I had to blame one thing, I'd blame the heavily hacked 2.4 kernel=20
> that came with Fedora. :-P

I suspect this is the case. I am using Fedora Core 2 with a 2.6.something
(exact kernel version in the typescript file from my original posting)
kernel and that seems to be the most likely culprit. However, I doubt
anyone from RedHat is going to take an interest because this isn't
reproduceable. That is to say, I am not going to trash my box again to
reproduce it.

--=20
Tracy Reed                     The attachment is a digital signature.
http://copilotconsulting.com   More info: http://copilotconsulting.com/sig

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBRuf09PIYKZYVAq0RAijuAJ9ZJJcRkREJaEmdOgOjoBpqs40kbwCffVCx
FBAtF5iKiN0Sw4uCpQ8dbX8=
=TwT6
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
