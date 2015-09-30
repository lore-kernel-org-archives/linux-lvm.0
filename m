Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8UFSHQa026509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 30 Sep 2015 11:28:17 -0400
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mx1.redhat.com (Postfix) with ESMTPS id 1E5772CAF02
	for <linux-lvm@redhat.com>; Wed, 30 Sep 2015 15:28:16 +0000 (UTC)
Received: by laclj5 with SMTP id lj5so50787072lac.3
	for <linux-lvm@redhat.com>; Wed, 30 Sep 2015 08:28:14 -0700 (PDT)
Received: from [192.168.43.226] ([78.25.121.155])
	by smtp.gmail.com with ESMTPSA id
	ca11sm123245lad.48.2015.09.30.08.28.12 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Sep 2015 08:28:13 -0700 (PDT)
From: Timofey Koolin <timofey@koolin.ru>
Message-ID: <560BFF8B.7030006@koolin.ru>
Date: Wed, 30 Sep 2015 18:28:11 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Usable space in PV
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

Task: calc usable space of PV before create PV and before create 
partition for PV.

In my experiments usable space in PV = PVSize / ExtentSize * ExtentSize 
with integer operations.
But when Metadata may be large - when LVM have a lot of logical volumes 
and it can take more space.

I found in /etc/lvm/lvm.conf parameter pvmetadatasize = 255 secotors 
(default).
What will if metadata will grow to more then 255 sectors?

-- 
Timofey Koolin
