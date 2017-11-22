Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F91C5FFFE
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 09:16:53 +0000 (UTC)
Received: from sonic316-10.consmr.mail.gq1.yahoo.com
	(sonic316-10.consmr.mail.gq1.yahoo.com [98.137.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 747E28553D
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 09:16:52 +0000 (UTC)
Date: Wed, 22 Nov 2017 09:16:48 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <181942124.99954.1511342208833@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <181942124.99954.1511342208833.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Reattach cache
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

by definition when you detach a cache it is now entirely invalid and will (should) be treated as empty.
