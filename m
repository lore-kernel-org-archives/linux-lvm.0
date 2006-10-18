Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9ICgN2Z013128
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 08:42:23 -0400
Received: from svc.anykey.de (service.anykey.de [213.168.80.18])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9ICgLDJ008753
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 08:42:21 -0400
Received: from eu.main.anykey (unknown [192.168.200.17])
	by svc.anykey.de (anykey GmbH) with ESMTP id 330A95C99F
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 14:41:59 +0200 (CEST)
Received: from eu.main.anykey (localhost [127.0.0.1])
	by eu.main.anykey (Postfix) with ESMTP id 803011282F
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 14:42:20 +0200 (CEST)
Message-ID: <3673884.1161175340523.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
Date: Wed, 18 Oct 2006 14:42:20 +0200 (CEST)
From: Andreas Octav <Andreas.Octav@anykey.de>
In-Reply-To: <1591887.1161167319269.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
Mime-Version: 1.0
References: <1591887.1161167319269.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "System ID" entry missing in metadata (LVM2) ?!
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi again,

It seems that my Volume Groups are missing the "System ID" entry. Is
this a known bug in my version? (lvm2-2.01.14-3.6)
So all nodes have full access to the VG. Does not seem correct to me ...


Best regards,
Andreas Octav

Am Mi 18.10.2006 12:28 schrieb Andreas Octav <Andreas.Octav@anykey.de>:

> Hi,
> 
> i´m new to LVM2 and wondering if it´s possible to restrict access to a
> Volume Group to a single server (e.g. like under vxvm (vxdg
> import/deport)).
> If I import a VG by using vgimport it is still possible to access the
> VG
> on another node in a shared SAN environment. Can I prevent this
> somehow?
> 
> I´m using lvm2-2.01.14-3.6 on servers running SuSE SLES9 SP3 x86_64.
> 
> Kind regards,
> Andreas Octav
> Consultant
> 
> anykey GmbH
> Koenigswinterer Strasse 418
> D-53227 Bonn
> http://www.anykey.de
> 	



Andreas Octav
Consultant

anykey GmbH
Koenigswinterer Strasse 418
D-53227 Bonn
http://www.anykey.de
	
