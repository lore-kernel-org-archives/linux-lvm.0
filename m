Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8F40f3G029153
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2016 00:00:41 -0400
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DB14C01BCB5
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2016 04:00:40 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id u14so23796937lfd.1
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2016 21:00:40 -0700 (PDT)
Received: from [192.168.1.100] ([109.63.170.92])
	by smtp.gmail.com with ESMTPSA id s70sm386538lfi.23.2016.09.14.21.00.37
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 21:00:38 -0700 (PDT)
From: =?UTF-8?B?0KHQtdGA0LPQtdC5INCf0YDQvtGG0LXRgNC+0LIgKFNlcmdleSBQcm90c2Vy?=
	=?UTF-8?B?b3Yp?= <protserovsd@gmail.com>
Message-ID: <4c5fc2ba-339c-48c6-1039-1e238fda2321@gmail.com>
Date: Thu, 15 Sep 2016 07:00:37 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "lvmetad: Failed to accept connection" on poweroff
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hello! I am using Debian Unstable, systemd, full-disk encryption and lvm 
(version 2.02.164). On poweroff that's what I see in journal:
сен 12 22:36:51 debian systemd[1]: Stopping LVM2 metadata daemon...
сен 12 22:36:51 debian lvmetad[332]: Failed to accept connection.
сен 12 22:36:51 debian systemd[1]: Stopped LVM2 metadata daemon.
Could you please tell me, if this error signalizes something bad, and if 
this error should be fixed? If it has to be fixed, then how can I do it? 
Thanks in advance.

Sergey.
