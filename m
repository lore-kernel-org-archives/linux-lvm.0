Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8278S331701
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 03:08:28 -0400
Received: from pegasus.siol.net (pegasus.siol.net [193.189.160.40])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i8278QS0014557
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 03:08:27 -0400
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with ESMTP id <20040902070815.NNT11799.pegasus@kudu.siol.net>
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:08:15 +0200
Received: from brane ([193.95.199.9]) by kudu.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with SMTP id <20040902070815.JEKZ1008.kudu@brane>
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:08:15 +0200
Message-ID: <000701c490aa$ba434f70$0a00a8c0@brane>
From: "Branko" <brankob@avtomatika.com>
References: <1094106922.10860.82.camel@akira2.nro.au.com>
Subject: Re: [linux-lvm] lvm and blockdev --setra
Date: Thu, 2 Sep 2004 07:07:20 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> Hi Guys,
>
> Should one set blockdev --setra on the lvm device, on the individual
> block devices making up the lvm device or both?
>
>

Interesting question. Answer to that IMHO depends on the internal kernel
structures.

Isn't the easisest aproach to try and see what happens ?

Regards,

Branko
