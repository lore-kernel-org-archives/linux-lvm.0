Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2068917497
	for <linux-lvm@redhat.com>; Wed, 31 May 2017 09:23:49 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A8B280B20
	for <linux-lvm@redhat.com>; Wed, 31 May 2017 09:23:46 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 8ADCF40D25DF
	for <linux-lvm@redhat.com>; Wed, 31 May 2017 11:23:43 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 31 May 2017 11:23:43 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <8c9d2725-d8f9-ca2c-1679-f1fdc9570373@free.fr>
References: <2dad6517-22f4-032d-6d7d-44641c4b871f@free.fr>
	<f099a6aefe6b25997971d1cbbed7dfeb@assyoma.it>
	<8c9d2725-d8f9-ca2c-1679-f1fdc9570373@free.fr>
Message-ID: <2997d3781c9564557a93104af8cf3db0@xenhideout.nl>
Subject: Re: [linux-lvm] Question on mixing technologies
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

Georges Giralt schreef op 31-05-2017 8:53:

> The only remaining question is how to trim the device as it is not
> "mounted". Is there a special pvcreate or LVM option to have this
> device trimmed when it should be ?

It is definitely mounted if your root is on it.

Regards.
