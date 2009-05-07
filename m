Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n477f6XH031491
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 03:41:06 -0400
Received: from mail.idrift.no (mail.idrift.no [83.242.12.60])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n477dd1s002853
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 03:39:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.idrift.no (Postfix) with ESMTP id 54DAA314094
	for <linux-lvm@redhat.com>; Thu,  7 May 2009 09:39:38 +0200 (CEST)
Received: from mail.idrift.no ([127.0.0.1])
	by localhost (elros.idrift.no [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 14257-09 for <linux-lvm@redhat.com>;
	Thu, 7 May 2009 09:39:38 +0200 (CEST)
Received: from leyla (unknown [83.242.24.109])
	by mail.idrift.no (Postfix) with ESMTP id 167CF314093
	for <linux-lvm@redhat.com>; Thu,  7 May 2009 09:39:38 +0200 (CEST)
From: "Gaute Lund" <gaute@idrift.no>
References: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>	<4A02268F.8010105@whgl.uni-frankfurt.de>
	<1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
In-Reply-To: <1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
Subject: RE: [linux-lvm] LVM and Truecrypt
Date: Thu, 7 May 2009 09:39:37 +0200
Message-ID: <011d01c9cee6$f9873f00$ec95bd00$@no>
MIME-Version: 1.0
Content-Language: nn-no
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Gordon Fogus wrote Thursday, May 07, 2009 4:20 AM

> On the other hand, if you were asking, "Why use encryption?", then you
might be=20
> interested in Sans news bites:
http://www.sans.org/newsletters/newsbites/.=EF=BF=BD=20
> Sans covers many data leaks.

I might add: You're aware that block-level/disk-level encryption offers only
protection against someone stealing your box/disks, or otherwise compromise
it physically?

Remote "attacks" will be just as effective against a box with
truecrypt/dm-crypt!

-gaute
