Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8AD38eh030572
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 09:03:09 -0400
Received: from hathor.ankh.org (hathor.ankh.org [149.255.109.145])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8AD35A4032353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 09:03:07 -0400
Received: from apple.ocado.com ([91.206.0.43] helo=[10.252.24.87])
	by hathor.ankh.org with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.82) (envelope-from <oolon@ankh.org>) id 1XRhY9-0003wx-C5
	for linux-lvm@redhat.com; Wed, 10 Sep 2014 14:03:05 +0100
Message-ID: <54104C04.7060405@ankh.org>
Date: Wed, 10 Sep 2014 14:03:00 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <5410138C.9010603@cemery.org.uk> <20140910093922.GA4722@debian>
	<CAD+pdNeD-waiZwurw3niih1BPk6fBf9HOannBH6EiLGyYnn3DQ@mail.gmail.com>
In-Reply-To: <CAD+pdNeD-waiZwurw3niih1BPk6fBf9HOannBH6EiLGyYnn3DQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Replace small drive with bigger, using LVM?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/09/14 13:35, Fran Garcia wrote:
>
> Also note you should be using parted rather than fdisk for sdb.
> You'll need to enable GPT support to partition anything larger than
> 2Tb.
>
>
Very good point.

James
