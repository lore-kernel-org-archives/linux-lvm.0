Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37D825C1B2
	for <linux-lvm@redhat.com>; Sat, 18 Aug 2018 22:36:17 +0000 (UTC)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5398636809
	for <linux-lvm@redhat.com>; Sat, 18 Aug 2018 22:36:16 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l2-v6so4134547wme.1
	for <linux-lvm@redhat.com>; Sat, 18 Aug 2018 15:36:16 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Donnelly <kundarsa@gmail.com>
Date: Sat, 18 Aug 2018 15:36:09 -0700
Message-ID: <CAD=erBDKwJABON6wfw3L3SDarZvBrL9ZHTbAC53aL79zpuujrQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ccc1070573bd4d1f"
Subject: [linux-lvm] corruption on lvconvert --stripes N vg/lv on lv type
	raid5
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
To: linux-lvm@redhat.com

--000000000000ccc1070573bd4d1f
Content-Type: text/plain; charset="UTF-8"

 After creating a new LV --type raid5, mkfs.ext4 and rsync the backup the
filesystem will corrupt if i extend the lv using lvconvert --stripes N
vg/lv. I monitor the cpy%sync with lvs and reboot well after 100%, but the
fs wont mount and file -s /dev/dm-N says "data"

--000000000000ccc1070573bd4d1f
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">
After creating a new LV --type raid5, mkfs.ext4 and rsync the backup the
 filesystem will corrupt if i extend the lv using lvconvert --stripes N 
vg/lv. I monitor the cpy%sync with lvs and reboot well after 100%, but 
the fs wont mount and file -s /dev/dm-N says &quot;data&quot;

</div>

--000000000000ccc1070573bd4d1f--
