Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q29Gepf1005947
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2012 11:40:51 -0500
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q29GeoTl030403
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2012 11:40:50 -0500
Received: from c-66-30-139-20.hsd1.nh.comcast.net ([66.30.139.20]
	helo=[192.168.1.128]) by youngberry.canonical.com with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.71)
	(envelope-from <peter.petrakis@canonical.com>) id 1S62s5-0001rU-Th
	for linux-lvm@redhat.com; Fri, 09 Mar 2012 16:40:50 +0000
Message-ID: <4F5A328C.9060309@canonical.com>
Date: Fri, 09 Mar 2012 11:40:44 -0500
From: "Peter M. Petrakis" <peter.petrakis@canonical.com>
MIME-Version: 1.0
References: <CANiW5cFpy8a+dYPEXxzb-zjS+jYJH61P=jKKZV_N=tkSneHjmA@mail.gmail.com>
In-Reply-To: <CANiW5cFpy8a+dYPEXxzb-zjS+jYJH61P=jKKZV_N=tkSneHjmA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Does a striped LV honor the order of specified PVs
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
To: linux-lvm@redhat.com



On 03/08/2012 01:41 PM, John Anthony wrote:
> All:
>
> This is situation where the number of LUNS - spindles - are many with the
> LV striping across all of them.
>
> To avoid hotspots - the idea is to control the order in which the LUNs are
> written to by the LVs. It would appear the specifying the underlying PV -
> LUN - order would achieve this goal. Is that correct ? Is there any value
> to going through that trouble ? any experiences ?

Well striping in general is a "good thing" for performance it's just a matter
of how you want to implement it. Yes, LVM can create striped volumes, you could
also create a software RAID array [1] to act as your physical volume and
achieve the same goal. There's copious material available on the topic of RAID
striping.

Peter

1. or buy a HW RAID, or a SAN.

>
> TIA,
>
> -JAC
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
