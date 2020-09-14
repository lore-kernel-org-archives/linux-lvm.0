Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A3932156A23
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 06:03:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A890906384
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 06:03:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x77so12081039lfa.0
	for <linux-lvm@redhat.com>; Sun, 13 Sep 2020 23:03:51 -0700 (PDT)
Received: from [192.168.1.103] (m83-187-161-157.cust.tele2.se.
	[83.187.161.157]) by smtp.gmail.com with ESMTPSA id
	e17sm3882314ljn.18.2020.09.13.23.03.48 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 13 Sep 2020 23:03:49 -0700 (PDT)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 14 Sep 2020 08:03:47 +0200
Message-Id: <33B5E9F1-BE08-41DE-9721-C32671DEEC6E@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm limitations
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

I am trying to find the limitations of lvm2

1. how many logical volumes can be created on a single volume group?
- is there more limitations such as minor,major nr, ..

I do understand that increasing metadata is needed to allow more volumes.

regards Tomas

Sent from my iPhone
