Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j44Dl3O26618
	for <linux-lvm@redhat.com>; Wed, 4 May 2005 09:47:03 -0400
Received: from kokytos.rz.ifi.lmu.de (kokytos.rz.ifi.lmu.de [141.84.214.13])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j44Dl1Gp018430
	for <linux-lvm@redhat.com>; Wed, 4 May 2005 09:47:01 -0400
Received: from iod.cip.ifi.lmu.de (iod.cip.ifi.lmu.de [141.84.214.220])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by kokytos.rz.ifi.lmu.de (Postfix) with ESMTP id D1E2A436DF
	for <linux-lvm@redhat.com>; Wed,  4 May 2005 15:46:55 +0200 (CEST)
From: Michael =?iso-8859-1?q?St=FCbiger?= <stuebiger-lvm@cip.ifi.lmu.de>
Subject: Re: [linux-lvm] Shared library liblvm2clusterlock.so does not contain
	locking functions
Date: Wed, 4 May 2005 15:46:53 +0200
References: <Pine.LNX.4.44.0505030212030.27177-100000@algiers.clic.cs.columbia.edu>
In-Reply-To: <Pine.LNX.4.44.0505030212030.27177-100000@algiers.clic.cs.columbia.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200505041546.53509.stuebiger-lvm@cip.ifi.lmu.de>
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

Hello

did you run ./configure with=20
--with-clvmd=3DTYPE       =09

where TYPE is one of the following values:  cman/gulm/none/all
Default value is none. That would leave you without clvmd.
Which you need when using GFS.

Hope this helps
Michael
--=20
| Dipl. Inf. Michael St=EF=BF=BDbiger                   Michael.Stuebiger a=
t rz.ifi.lmu.de |
| Ludwig-Maximilians-Universitaet Muenchen                                 =
        |
| Institut fuer Informatik                Zimmer Z 9      Tel: 2180-9137   =
        |
