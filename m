Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5A38PQK018649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 9 Jun 2016 23:08:26 -0400
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4782AC04D29B
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 03:08:25 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n184so248949282wmn.1
	for <linux-lvm@redhat.com>; Thu, 09 Jun 2016 20:08:25 -0700 (PDT)
Received: from [192.168.0.76] (cpe-70-123-244-133.satx.res.rr.com.
	[70.123.244.133])
	by smtp.gmail.com with ESMTPSA id m5sm987041wmm.10.2016.06.09.20.08.22
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jun 2016 20:08:23 -0700 (PDT)
From: Bruce Dubbs <bruce.dubbs@gmail.com>
Message-ID: <575A2F24.2020906@gmail.com>
Date: Thu, 9 Jun 2016 22:08:20 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Running lvm2 regression tests
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I am having a problem with building LVM2.2.02.155 from source.

Actually, the build is OK:

./configure --prefix=/usr       \
             --exec-prefix=      \
             --enable-applib     \
             --enable-cmdlib     \
             --enable-pkgconfig  \
             --enable-udev_sync

make
sudo make install

My problem comes when I try to run some checks:

sudo make -k check_local

In this case every test times out.  I killed the tests after two hours. 
The journal shows things like:

ndev-vanilla:api/dbustest.sh started
ndev-vanilla:api/dbustest.sh timeout

I have the following kernel settings in linux-4.4.2:

CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
CONFIG_MD_RAID456=y
# CONFIG_MD_MULTIPATH is not set
# CONFIG_MD_FAULTY is not set
CONFIG_BCACHE=m
CONFIG_BCACHE_DEBUG=y
CONFIG_BCACHE_CLOSURES_DEBUG=y
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_MQ_DEFAULT=y
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
CONFIG_DM_DEBUG_BLOCK_STACK_TRACING=y
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_MQ=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_CACHE_CLEANER=m
CONFIG_DM_ERA=m
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
# CONFIG_DM_MULTIPATH is not set
# CONFIG_DM_DELAY is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
# CONFIG_DM_VERITY is not set
# CONFIG_DM_SWITCH is not set
# CONFIG_DM_LOG_WRITES is not set
...
# CONFIG_MAGIC_SYSRQ is not set

I do not have thin-provisioning-tools installed but I thought that was 
optional.

What am I missing?

   -- Bruce Dubbs
      linuxfromscratch.org
