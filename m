Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9IG2vFW005325
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 12:02:57 -0400
Received: from svc.anykey.de (service.anykey.de [213.168.80.18])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9IG2o7A021446
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 12:02:50 -0400
Received: from eu.main.anykey (unknown [192.168.200.17])
	by svc.anykey.de (anykey GmbH) with ESMTP id 9DCEC5C6B5
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 18:02:27 +0200 (CEST)
Received: from [127.0.0.1] (service.anykey.de [213.168.80.18])
	by eu.main.anykey (Postfix) with ESMTP id 78FF51281E
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 18:02:47 +0200 (CEST)
Message-ID: <45365026.90006@anykey.de>
Date: Wed, 18 Oct 2006 18:02:46 +0200
From: Andreas Octav <andreas.octav@anykey.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "System ID" entry missing in metadata (LVM2) ?!
References: <1591887.1161167319269.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>	<3673884.1161175340523.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
	<de2c187f9caa97b59d590fc079a61702@redhat.com>
In-Reply-To: <de2c187f9caa97b59d590fc079a61702@redhat.com>
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

Hi,

thanks for your response Jonathan, but I want to share the VGs between 
the hosts. So I hoped that there is something like this functionality:
-> "vgimport VG" writes some kind of hostid (system_id?) in the metadata
-> other hosts can�t access the VG
-> "vgdeport VG" removes the ID, so anyone else can import the VG

My C knowledge isn�t very good, but the sources seem to include a 
functionality like the one mentioned above.


Kind regards,
Andreas

Jonathan E Brassow schrieb:
>
>>> Hi,
>>>
>>> i�m new to LVM2 and wondering if it�s possible to restrict access to a
>>> Volume Group to a single server (e.g. like under vxvm (vxdg
>>> import/deport)).
>>> If I import a VG by using vgimport it is still possible to access the
>>> VG
>>> on another node in a shared SAN environment. Can I prevent this
>>> somehow?
>>>
>>> I�m using lvm2-2.01.14-3.6 on servers running SuSE SLES9 SP3 x86_64.
>>>
>
> You can use tags to achieve this, or you can specify specific volume 
> groups and logical volumes in lvm.conf under "volume_list".
>
>  brassow
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
