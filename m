Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GFgvXx025037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 11:42:57 -0400
Received: from mailrelay1.lanline.com (mailrelay1.lanline.com [216.187.10.17])
	by mx1.redhat.com (Postfix) with ESMTPS id C08E11E27
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 15:42:55 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay1.lanline.com (8.14.5/8.14.5) with ESMTP id u2GFdkHA012033
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 11:39:46 -0400 (EDT)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id u2GFP4tj028476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 11:25:04 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22249.32509.637353.254269@quad.stoffel.home>
Date: Wed, 16 Mar 2016 11:42:53 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <f32b76594fa14b509a7a196f0e626ebc@XCH-ALN-006.cisco.com>
References: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
	<56E89311.1030408@gmail.com> <D30DED20.19EAC%stdake@cisco.com>
	<56E913F2.60702@gmail.com> <D30EAF21.19F62%stdake@cisco.com>
	<56E97633.10009@gmail.com>
	<f32b76594fa14b509a7a196f0e626ebc@XCH-ALN-006.cisco.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


So what's to keep a docker container from deleting all your other LVs
that it shouldn't know about?

If I have a VG called coontainers, with a bunch of LVs called c1, c2,
... , cN.

What is to keep c1 from nuking the LV in c2?

John
