Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAA7D26F009581
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2016 02:13:02 -0500
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC8008F4EC
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2016 07:12:59 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id d128so85565234ybh.2
	for <linux-lvm@redhat.com>; Wed, 09 Nov 2016 23:12:59 -0800 (PST)
MIME-Version: 1.0
From: Kevin Wilson <wkevils@gmail.com>
Date: Thu, 10 Nov 2016 09:12:58 +0200
Message-ID: <CAGXs5wWNcNf0mSW5bwYhc_xXyRcpmrJOD2m4Gg5wjS-EBvmMYw@mail.gmail.com>
Subject: [linux-lvm] Is it considered safe to resize a mounted partition
 (root filesystem) with lvextend
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

Hello,

Is it safe to extend a mounted partition ?
For example,
lvextend --size +9G --resizefs /dev/mapper/vg_paeiserver5-lv_my_partition

when
/dev/mapper/vg_paeiserver5-lv_my_partition is mounted ?

I cannot simply unmount that partition as it is the root filesystem
"/" is hosted on it. I can reboot to a second partition as this
is a dual boot machine, and from there run that lvextend, as
/dev/mapper/vg_paeiserver5-lv_my_partition is not mounted there. But I
prefer doing it without boot if it is considered safe
to perform this on a booted partition.

If I try it I get:
"on-line resizing required" message, which I am not sure what it means.
and "df -h" show that the partition was indeed increased by 20GB.

lvextend --size +20G --resizefs /dev/mapper/vg_paeiserver5-lv_my_partition
  Extending logical volume lv_ubuntu to 34.00 GiB
  Logical volume lv_ubuntu successfully resized
resize2fs 1.42.9 (4-Feb-2014)
Filesystem at /dev/mapper/vg_paeiserver5-lv_my_partition is mounted on
/; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 3
The filesystem on /dev/mapper/vg_paeiserver5-lv_my_partition is now
8912896 blocks long.

Regards,
Kevin
