Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6546C200A4F4
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 12:54:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1112880121C
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 12:54:54 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id u4so5773783ljd.10
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2020 05:54:51 -0700 (PDT)
Received: from [100.87.223.46] (host-78-77-203-243.mobileonline.telia.com.
	[78.77.203.243]) by smtp.gmail.com with ESMTPSA id
	b14sm4529190lfp.176.2020.09.16.05.54.48 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 16 Sep 2020 05:54:49 -0700 (PDT)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 16 Sep 2020 14:54:47 +0200
Message-Id: <B152A186-F5DD-4E14-A04D-A6D1FD0E41B7@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] metadata size question
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

hi 
if I create a VG using one single PV and having one ‘thick’ LV
What size would be needed for the LVM metadata?
need to know where my actual real data starts at in the disk device

thanks in advance 

Sent from my iPhone
