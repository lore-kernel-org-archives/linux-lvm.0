Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GGHaqj019995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 12:17:36 -0400
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mx1.redhat.com (Postfix) with ESMTPS id CD1E1255B
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 16:17:35 +0000 (UTC)
Received: from XCH-ALN-009.cisco.com (xch-aln-009.cisco.com [173.36.7.19])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id u2GGHYi7023459
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 16:17:35 GMT
From: "Serguei Bezverkhi (sbezverk)" <sbezverk@cisco.com>
Date: Wed, 16 Mar 2016 16:17:33 +0000
Message-ID: <2bc132f8b3b94d41aaedec98332a4675@XCH-ALN-006.cisco.com>
References: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
	<56E89311.1030408@gmail.com> <D30DED20.19EAC%stdake@cisco.com>
	<56E913F2.60702@gmail.com> <D30EAF21.19F62%stdake@cisco.com>
	<56E97633.10009@gmail.com>
	<f32b76594fa14b509a7a196f0e626ebc@XCH-ALN-006.cisco.com>
	<22249.32509.637353.254269@quad.stoffel.home>
In-Reply-To: <22249.32509.637353.254269@quad.stoffel.home>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] disabling udev_sync and udev_rules
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi John,

At least in our situation, Dockers do not own LV and nothing prevents in theory LV created by a process in one container, to be removed by another process in another container. It is exactly the same if two processed are trying to do the same thing.  In both cases if a volume is busy no process will be able to remove it.

In our case, dockers are more like process wrapper, it does not holds any resources other than it needs to run this one process.

I hope it clarifies a bit the approach we took.

Thank you

Serguei
  
-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of John Stoffel
Sent: Wednesday, March 16, 2016 11:43 AM
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] disabling udev_sync and udev_rules


So what's to keep a docker container from deleting all your other LVs that it shouldn't know about?

If I have a VG called coontainers, with a bunch of LVs called c1, c2, ... , cN.

What is to keep c1 from nuking the LV in c2?

John

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
