Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9E3F9FDDA
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 12:41:51 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5034B7F7AF
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 12:41:47 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id 7C8057244E
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 14:41:45 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Apr 2017 14:41:45 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
Message-ID: <2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Gionatan Danti schreef op 13-04-2017 12:20:

> Hi,
> anyone with other thoughts on the matter?

I wondered why a single thin LV does work for you in terms of not 
wasting space or being able to make more efficient use of "volumes" or 
client volumes or whatever.

But a multitude of thin volumes won't.

See, you only compared multiple non-thin with a single-thin.

So my question is:

did you consider multiple thin volumes?
