Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53BB7F5AEC
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 15:50:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEF059063AC
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 15:50:24 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id u4so6308715ljd.10
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 08:50:18 -0700 (PDT)
Received: from [100.66.48.24] (host-95-199-144-24.mobileonline.telia.com.
	[95.199.144.24]) by smtp.gmail.com with ESMTPSA id
	f25sm4728606lfh.120.2020.09.16.08.50.16 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 16 Sep 2020 08:50:16 -0700 (PDT)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 16 Sep 2020 17:50:15 +0200
Message-Id: <863EB246-CED9-463B-8D52-5A15197A8ABC@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] size of lvm metadata
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
To: linux-lvm@redhat.com

hi

I am trying to understand how big the lvm metadata is

in the vgcfgbackup file, I can see
extent_size = 8192
dev_size = 204800
pe_start = 2048
pe_count 24

pe_count(24) * extent_size(8192) = 196608 bytes usable space of the total dev_size(204800)
metadata size? = dev_size(204800) - 196608 = 8192

but...
pe_start is 2048?
so what is pe_start here? cant be sectors(512)? bytes? well than ther be not aligned

so where starts the actual data?
and where ends the lvm metadata?

regards Tomas
Sent from my iPhone
