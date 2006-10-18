Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9IFUnre019772
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 11:30:49 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <3673884.1161175340523.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
References: <1591887.1161167319269.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
	<3673884.1161175340523.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
Message-Id: <de2c187f9caa97b59d590fc079a61702@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] "System ID" entry missing in metadata (LVM2) ?!
Date: Wed, 18 Oct 2006 10:33:16 -0500
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


>> Hi,
>>
>> i�m new to LVM2 and wondering if it�s possible to restrict access to a
>> Volume Group to a single server (e.g. like under vxvm (vxdg
>> import/deport)).
>> If I import a VG by using vgimport it is still possible to access the
>> VG
>> on another node in a shared SAN environment. Can I prevent this
>> somehow?
>>
>> I�m using lvm2-2.01.14-3.6 on servers running SuSE SLES9 SP3 x86_64.
>>

You can use tags to achieve this, or you can specify specific volume 
groups and logical volumes in lvm.conf under "volume_list".

  brassow
