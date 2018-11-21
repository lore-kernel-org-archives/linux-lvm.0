Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F62660A9C
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 09:58:55 +0000 (UTC)
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (Postfix) with ESMTP id F0BC881127
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 09:58:52 +0000 (UTC)
Received: from bubble.minsk.epam.com ([86.57.255.91])
	(authenticated as <bubble>)
	by h01.hoster-ok.com (8.14.3/8.14.3/HOSTER-OK) with ESMTP id
	wAL9wojD019539
	(using TLSv1/SSLv3 with cipher DHE-RSA-AES128-SHA (128 bits) verified
	NO) for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 10:58:51 +0100
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
	<1542382913.30686.3@mail.gathman.org>
	<ae2dff6f425466ed773e8e5330fce33e@cs.uni-dortmund.de>
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Message-ID: <7cfd30ab-f5db-2616-9fd3-983be808d53c@hoster-ok.com>
Date: Wed, 21 Nov 2018 12:58:50 +0300
MIME-Version: 1.0
In-Reply-To: <ae2dff6f425466ed773e8e5330fce33e@cs.uni-dortmund.de>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

On 21.11.2018 12:56, Christoph Pleger wrote:
> Hello,
>=20
> On 2018-11-16 16:41, Stuart D. Gathman wrote:
>> It's not very elegant, but the quick and dirty solution is to use sudo
>=20
> probably you had not yet read that far in this thread, but I already=20
> wrote that sudo does not work when called from pam_exec.
>=20
> To get the stderr and stdout results of sudo, I wrote a shell script=20
> wrapper around it, and the results are (maybe because sudo itself uses=20
> PAM?):
>=20
> sudo: unable to change to root gid: Operation not permitted
> sudo: unable to initialize policy plugin

May be silly question: Do you have selinux or equivalent enabled?

>=20
> Someone wrote that he assumes that pam_exec ignores the setuid-bit in=20
> the file permissions, but that is obviously wrong, as this whole thread=20
> is about why lvcreate, when being called from my setuid-root-binary, has =

> permission problems though all three (real, effective and saved) UIDs=20
> are 0 (and of course I checked that they really are 0).
>=20
> Regards
>  =C2=A0 Christoph
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
