Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t58DXnEB022560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 8 Jun 2015 09:33:50 -0400
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mx1.redhat.com (Postfix) with ESMTPS id 70C268F27B
	for <linux-lvm@redhat.com>; Mon,  8 Jun 2015 13:33:48 +0000 (UTC)
Received: by wgv5 with SMTP id 5so103604533wgv.1
	for <linux-lvm@redhat.com>; Mon, 08 Jun 2015 06:33:47 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Mon, 8 Jun 2015 16:33:31 +0300
Message-ID: <CACaajQvSK0tgLjCCy5Fu-pWFMCWtGUBSnNZFA=NjECRPwBQCgg@mail.gmail.com>
Subject: [linux-lvm] lvm raid1
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
To: linux-lvm <linux-lvm@redhat.com>

Hi. I have such hardware:
/dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf (500Gb ssd)

1) i want to create raid1 using lvm raid1 personalities with 100Mb
size on top of this disk
2) i want to create lv and format it to ext4/xfs of free space on each disk

If this is not possible with only lvm, how i can do this ? ( simple
create two lv on each disk and create via mdadm raid1? )

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
