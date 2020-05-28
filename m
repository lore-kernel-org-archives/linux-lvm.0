Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B139DBB17
	for <linux-lvm@redhat.com>; Thu, 28 May 2020 07:36:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C5DB801036
	for <linux-lvm@redhat.com>; Thu, 28 May 2020 07:36:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 82so16003418lfh.2
	for <linux-lvm@redhat.com>; Thu, 28 May 2020 00:36:01 -0700 (PDT)
MIME-Version: 1.0
From: lampahome <pahome.chen@mirlab.org>
Date: Thu, 28 May 2020 15:35:46 +0800
Message-ID: <CAB3eZfsY6hLzJD_AgP+zMKJm-coM134MehCU9me80ePt05-iRw@mail.gmail.com>
Subject: [linux-lvm] How to repair superblock is corrupt
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

I create a vg1 on one SSD and create a lv1 in vg1.
Then I run:
sudo thin_check /dev/mapper/vg1-lv1

It shows:
examining superblock
  superblock is corrupt
    bad checksum in superblock

Can someone teach me how to fix corrupted superblock?
