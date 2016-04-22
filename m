Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3M0FehJ014206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2016 20:15:40 -0400
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C566881108
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2016 00:15:39 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id e185so117657600vkb.1
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2016 17:15:39 -0700 (PDT)
MIME-Version: 1.0
From: shankha <shankhabanerjee@gmail.com>
Date: Thu, 21 Apr 2016 20:14:59 -0400
Message-ID: <CAO_L6qHfpQsEdnMRBrMf7Ghz4Q=s6KgTK-mG+gfmStH-0=Wspg@mail.gmail.com>
Subject: [linux-lvm] thin_ls: dump the blocks along with aggregate
	information
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

I was able to use thin_ls and it nicely dumped the aggregate level
statistics for each block.

Will it be possible to dump the individual blocks themselves with
similar headings.
Like: LIST_MAPPED_BLOCKS LIST_EXCLUSIVE_BLOCKS LIST_SHARED_BLOCKS

The tool thin_dump dumps the individual blocks but does not provide
the information if they are shared or exclusive. One could write a
tool on top of thin_dump to parse the information but it is
not that simple especially if there are huge no of entries.

Thank you once again for the tool.

Thanks
Shankha Banerjee
