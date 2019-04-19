Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71DBB600C0
	for <linux-lvm@redhat.com>; Fri, 19 Apr 2019 19:30:40 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD8A630BC642
	for <linux-lvm@redhat.com>; Fri, 19 Apr 2019 19:30:39 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id y84so4626709oia.12
	for <linux-lvm@redhat.com>; Fri, 19 Apr 2019 12:30:39 -0700 (PDT)
Received: from chatter.i7.local (192-0-231-225.cpe.teksavvy.com.
	[192.0.231.225]) by smtp.gmail.com with ESMTPSA id
	g12sm2240348otr.18.2019.04.19.12.30.38 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Apr 2019 12:30:38 -0700 (PDT)
Date: Fri, 19 Apr 2019 15:30:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Message-ID: <20190419193036.GA24986@chatter.i7.local>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Network-attached block storage and local SSDs for
	dm-cache
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi, all:

I know it's possible to set up dm-cache to combine network-attached 
block devices and local SSDs, but I'm having a hard time finding any 
first-hand evidence of this being done anywhere -- so I'm wondering if 
it's because there are reasons why this is a Bad Idea, or merely because 
there aren't many reasons for folks to do that.

The reason why I'm trying to do it, in particular, is for 
mirrors.kernel.org systems where we already rely on dm-cache to combine 
large slow spinning disks with SSDs to a great advantage. Most hits on 
those systems are to the same set of files (latest distro package 
updates), so dm-cache hit-to-miss ratio is very advantageous. However, 
we need to build newest iterations of those systems, and being able to 
use network-attached storage at providers like Packet with local SSD 
drives would remove the need for us to purchase and host huge drive 
arrays.

Thanks for any insights you may offer.

Best,
Konstantin
