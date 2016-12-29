Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBTDqRju013703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2016 08:52:27 -0500
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE662C0567A2
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2016 13:52:26 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id o141so190708407itc.0
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2016 05:52:26 -0800 (PST)
Received: from [192.168.1.6] (d24-150-100-81.home.cgocable.net.
	[24.150.100.81]) by smtp.googlemail.com with ESMTPSA id
	81sm23931400itj.6.2016.12.29.05.52.25 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Dec 2016 05:52:25 -0800 (PST)
From: Raman Gupta <rocketraman@gmail.com>
Message-ID: <fa65ab01-440c-99a2-a13b-807d302c14e6@gmail.com>
Date: Thu, 29 Dec 2016 08:52:24 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Two questions about lvm-cache
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

I am trying out the lvmcache functionality. So far, everything looks
great. I have two questions:

1) The man page of lvmcache states "With the --cachemode option, the
cache mode can be set when creating a cache LV, or changed on an
existing cache LV." However, I can't figure out the right command to
change the cache mode on an existing LV.

# lvs -a -o +devices
(see https://paste.fedoraproject.org/514698/83019352/raw/)

# lvs -o cache_mode vg_raid10/lv_var
CacheMode
writethrough

# lvconvert --verbose --cachemode writeback vg_raid10/lv_var
(no output)

# lvs -o cache_mode vg_raid10/lv_var
CacheMode
writethrough

# lvconvert --verbose --type cache \
 --cachepool vg_raid10/lv_cache_pool_var \
 --cachemode writeback vg_raid10/lv_var
Executing: /usr/sbin/modprobe dm-cache-mq
Executing: /usr/sbin/modprobe dm-cache-smq
Cache is not supported with cache segment type of the original
logical volume vg_raid10/lv_var.


2) Does lvm manage TRIM on the cache device? Normally I set up SSD
volumes with a weekly fstrim, but that only works for mounted filesystems.


Thanks!
Raman
