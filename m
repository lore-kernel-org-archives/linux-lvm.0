Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9ELRMr06689
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 17:27:22 -0400
Received: from server6.hostpoint.ch (server6.hostpoint.ch [217.26.52.16])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9ELRFri020612
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 17:27:15 -0400
Received: from 217-119-145-4.sefanet.ch ([217.119.145.4] helo=[192.168.15.41])
	by server6.hostpoint.ch with asmtp (Exim 4.34) id 1CID7x-0000hO-8W
	for linux-lvm@redhat.com; Thu, 14 Oct 2004 23:27:13 +0200
Message-ID: <416EEF2B.7070203@markus.org>
Date: Thu, 14 Oct 2004 23:27:07 +0200
From: Markus Baertschi <markus@markus.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How can I restripe LVs on addition of extra PVs?
References: <20041014011250.CF9EC164005@ws1-4.us4.outblaze.com>
In-Reply-To: <20041014011250.CF9EC164005@ws1-4.us4.outblaze.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Daniel . wrote:

>Hi,=20
>=20
>[I'm only familiar with LVM1, so that's what I'm referring to in the rest =
of the mail.  I probably could move to LVM2 if it solves my problems.]
>
Why do you want to stripe ?

If it is for performance you'll have to pay the price in form of inflexibil=
ity. If it is for other reasons, do you have to stripe ?

Markus
--=20
  Markus Baertschi             Phone: ++41 (21) 807 1677
  Bas du Ross=EF=BF=BD 14b             Fax  : ++41 (21) 807 1678
  CH-1163, Etoy                Email: markus@markus.org
  Switzerland                  Homepage: www.markus.org
