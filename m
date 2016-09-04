Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u84CgcTV011045
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 4 Sep 2016 08:42:38 -0400
Received: from mail-it0-f72.google.com (mail-it0-f72.google.com
	[209.85.214.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB8E461E54
	for <linux-lvm@redhat.com>; Sun,  4 Sep 2016 12:42:38 +0000 (UTC)
Received: by mail-it0-f72.google.com with SMTP id g185so54007480ith.3
	for <linux-lvm@redhat.com>; Sun, 04 Sep 2016 05:42:38 -0700 (PDT)
MIME-Version: 1.0
From: Liron Aravot <laravot@redhat.com>
Date: Sun, 4 Sep 2016 15:42:37 +0300
Message-ID: <CAAHA9vup5eTrQExUxZq0NFFCVAZ9dHY1M7qus7P4MkJXK_F=HA@mail.gmail.com>
Subject: [linux-lvm] pvmove related questions
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
To: linux-lvm@redhat.com

Hi,
We started to work on adding support to RHV/oVirt to reduce a device
from a vg, I have a few related pvmove questions-

1. is there a plan to add support to pvmove --abort for a specific
device? i saw a related comment in the code but haven't found a BZ for
that.

2. When there's no data to move on the source device, pvmove fails
with "No data to move" (rc = 5), if i want to check it myself prior to
the execution, is checking if pv_pe_count = pv_pe_alloc_count is
sufficient?

3. if pvmove is interrupted (by a machine reboot) - i'm left with a
temp pvmove lv with one active mirrored segment which is used by some
LV.
is it allowed to run pvmove on the temp pvmove lv device at this
point? does lvm knows to to handle that?

thanks,
Liron.
