Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2FNDVFX018105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 19:13:31 -0400
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mx1.redhat.com (Postfix) with ESMTPS id F1C4F7F080
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 23:13:30 +0000 (UTC)
Received: from XCH-ALN-006.cisco.com (xch-aln-006.cisco.com [173.36.7.16])
	by rcdn-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id u2FNDUJt003242
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 23:13:30 GMT
From: "Serguei Bezverkhi (sbezverk)" <sbezverk@cisco.com>
Date: Tue, 15 Mar 2016 23:13:22 +0000
Message-ID: <611f9d0010954c508bfb05a4b53f2c40@XCH-ALN-006.cisco.com>
References: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
	<56E89311.1030408@gmail.com>
In-Reply-To: <56E89311.1030408@gmail.com>
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

Hello Zdenek,

Thank you very much for your prompt reply. I am running RH 7.2 with the latest RH kernel update and LVM2 that came out with recent RH update. This issue is 100% reproducible, if you want I can setup a debugging session where you could access my server and take a look at the issue.

BTW running  this 'dmsetup udevcomplete_all' command did not help me and it cannot be a permanent fix.

Please let me know if you are ok for live debugging.

Thank you

Serguei 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Zdenek Kabelac
Sent: Tuesday, March 15, 2016 6:56 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] disabling udev_sync and udev_rules

Dne 15.3.2016 v 23:31 Serguei Bezverkhi (sbezverk) napsal(a):
> Hello folks,
>
> While trying to make lvm work within a docker container I came across an issue when all lvcreate/lvremove got stuck indefinetly or until control-c. When I checked process I noticed lvm was waiting on one semaphore, I found that other folks hit similar issue and they fixed it by setting  udev_sync and udev_rules to 0. It also helped my case too.
>
> I would greatly appreciate if you could share your thought if this change in future can potentially have any negative impact.
>
> Thank you

Hi


To 'unblock' stuck processes waiting on udev cookie - you could run:

'dmsetup udevcomplete_all'


However the key question is - how you could get stuck.
That may need further debugging.

You would need to expose your OS  version and also version of lvm2 in use.

Non working cookies are bad - and disabling udev sync is even more bad idea...

Regards

Zdenek


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
