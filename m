Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u22C2H73002963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 2 Mar 2016 07:02:17 -0500
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mx1.redhat.com (Postfix) with ESMTPS id 3ED348E3CA
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2016 12:02:17 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id u110so37453016qge.3
	for <linux-lvm@redhat.com>; Wed, 02 Mar 2016 04:02:17 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 2 Mar 2016 12:02:16 +0000
Message-ID: <CAM2wQBu2SJigDa8xdaE+40cikUAMAEHaqNJ6pj3xOrY_Nhd8ow@mail.gmail.com>
From: Thanos Makatos <thanos.makatos@onapp.com>
Subject: [linux-lvm] extract sparseness information from a lvmthin logical
	volume
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

I'm trying to see if it's possible to extract sparseness information
from a thinly-provisioned logical volume. Is it possible to reliably
access this information from user space? Is there such a tool already?
If not, can you point me to relevant source code so I can start
looking into it?

-- 
Thanos Makatos
