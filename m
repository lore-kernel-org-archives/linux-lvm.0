Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7BDAF5681
	for <linux-lvm@redhat.com>; Sun,  9 Aug 2020 23:19:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C106800052
	for <linux-lvm@redhat.com>; Sun,  9 Aug 2020 23:19:07 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id v4so7654370ljd.0
	for <linux-lvm@redhat.com>; Sun, 09 Aug 2020 16:19:04 -0700 (PDT)
Received: from [192.168.1.103] (m83-185-94-61.cust.tele2.se. [83.185.94.61])
	by smtp.gmail.com with ESMTPSA id h7sm8552244ljc.75.2020.08.09.16.19.01
	for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 09 Aug 2020 16:19:01 -0700 (PDT)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 10 Aug 2020 01:19:00 +0200
Message-Id: <A71F734D-C071-4CC7-A381-6FC11171B94C@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] what will happen with lvconvert merge after reboot?
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

If a user starts a 
# lvconvert --merge -b snaplv 

and reboots the server before the convert/merge has completed 

will the merge/converting process continue after reboot?
or will the volume be stale?

if the merge/convert is restarted, can it resume where it was?

regards Tomas

Sent from my iPhone
