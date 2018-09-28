Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB61660920
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 12:57:49 +0000 (UTC)
Received: from 9livesdata.com (mailhub.9livesdata.com [194.181.36.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0817AE8B0E
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 12:57:48 +0000 (UTC)
Received: from [192.168.6.176] (ic516 [192.168.6.176])
	by mailhub.9livesdata.com (Postfix) with ESMTP id B04CC34648EE
	for <linux-lvm@redhat.com>; Fri, 28 Sep 2018 14:57:43 +0200 (CEST)
From: Zbigniew Kostrzewa <kostrzewa@9livesdata.com>
Message-ID: <aeb589e0-e70d-44bd-a74c-bc59202f7e50@9livesdata.com>
Date: Fri, 28 Sep 2018 14:57:44 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [linux-lvm] snapshot looses origin when other snapshot is merged to
 the same origin
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

Hi,

I have a question related to multiple snapshots of the same thin volume. 
My scenario is that I create a thin pool, a thin volume and two 
snapshots of that thin volume. Both snapshots have the thin volume set 
as the origin volume. However, after I merge one of the snapshots to the 
origin then the second snapshot looses information about the origin.

The question is if that is an expected behavior or if I am doing 
something wrong? Is there a way to make the second snapshot keep having 
the origin with merged first snapshot as its origin?

Regards,
Zbigniew Kostrzewa
