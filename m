Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BB165D9D3
	for <linux-lvm@redhat.com>; Mon, 27 May 2019 18:01:07 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3630DC05FF80
	for <linux-lvm@redhat.com>; Mon, 27 May 2019 18:00:54 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id i2so15463346otr.9
	for <linux-lvm@redhat.com>; Mon, 27 May 2019 11:00:54 -0700 (PDT)
MIME-Version: 1.0
From: Indivar Nair <indivar.nair@techterra.in>
Date: Mon, 27 May 2019 23:30:17 +0530
Message-ID: <CALuPYL0-UgSsV+HVGN-2JgHh6FjLe2aFpDzM+jSpuFpZvW9GVQ@mail.gmail.com>
Subject: [linux-lvm] Local Cache on CLVM
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi ...,

I have a query on Caching on CLVM.

Consider a clustered storage system with one common RAID Array and 2
Servers. The servers are configured in an active-passive configuration
using Pacemaker and CLVM.

Each server has a PCIe NVMe Card in it.
Is there any way I could use the PCIe NVMe card for caching?

I understand that if failover happens, the cache may be empty or the
content different on the failed-over server. But that would only mean
that it would take some time to refresh the cache again. I am okay
with that.

But is there any way to make it look like its the same cache drive on
both the primary and failover servers?

Regards,


Indivar Nair
