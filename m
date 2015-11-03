Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA352BZT024550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 Nov 2015 00:02:11 -0500
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mx1.redhat.com (Postfix) with ESMTPS id 40BEA14BFD9
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2015 05:02:10 +0000 (UTC)
Received: by igpw7 with SMTP id w7so62212537igp.1
	for <linux-lvm@redhat.com>; Mon, 02 Nov 2015 21:02:09 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 3 Nov 2015 13:02:09 +0800
Message-ID: <CAOJ8eeBoEGFSpzP2AB8TF28OYDzNAnx3kkSN7NvFwkEJiiu=_w@mail.gmail.com>
From: Syahrul Sazli Shaharir <sazli@pulasan.my>
Subject: [linux-lvm] dm-cache and snapshots
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

Hi,

In dm-cache, how do you do snapshots on a cached LV?

# lvs
  LV         VG          Attr       LSize   Pool          Origin
      Data%  Meta%  Move Log Cpy%Sync Convert
  LogVol00   vg_server17 -wi-ao---- 117.19g
  LogVol01   vg_server17 -wi-ao----  78.12g
  kvm163_img vg_server17 Cwi-aoC---   1.05t [DataLVcache]
[kvm163_img_corig] 10.14  12.29           0.00

# lvcreate -s -n /dev/vg_server17/kvm163_img_snap -L 10G
/dev/vg_server17/kvm163_img

  Snapshots of cache type volume vg_server17/kvm163_img is not supported.

Thanks.

-- 
--sazli
