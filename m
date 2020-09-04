Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 517F7202450E
	for <linux-lvm@redhat.com>; Fri,  4 Sep 2020 23:41:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07EAC80118B
	for <linux-lvm@redhat.com>; Fri,  4 Sep 2020 23:41:01 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id u27so4653796lfm.13
	for <linux-lvm@redhat.com>; Fri, 04 Sep 2020 16:40:58 -0700 (PDT)
Received: from [192.168.1.101] (m83-185-82-139.cust.tele2.se. [83.185.82.139])
	by smtp.gmail.com with ESMTPSA id
	h17sm388361ljj.4.2020.09.04.16.40.55 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 04 Sep 2020 16:40:56 -0700 (PDT)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 5 Sep 2020 01:40:54 +0200
Message-Id: <EAC6FBD7-7972-460E-A18E-D6DF2ACAF5EC@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvcreate to memory
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
is there a way to create vgda information to memory?

I want to create a virtual LVM disk
We have all the cow data on a disk, but 
# lvconvert -s vg/lv /dev/mydisk
doesn’t accept the path to the disk device
and if I create a symbolic disk in /dev/vg/mydisk of in /dev/mapper/vg—mydisk pointing to /dev/mydisk
the ‘lvconvert’ command doesnt accept the cow data on the disk
so I guess that the VGDA data has to be present on the disk in order for the lvconvert command to accept the data
what do you think could be missing?
is it the vgda meta data on the disk?

if so, how can I create and emulate the vgda data so that the lvconvert command works?

thanks in advance 
regards Tomas

Sent from my iPhone
