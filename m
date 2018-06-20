Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CD01608F8
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 09:19:11 +0000 (UTC)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14BC5308403A
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 09:19:00 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id j15-v6so5515032wme.0
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 02:19:00 -0700 (PDT)
Received: from RL-MBPRO001.local (host81-150-47-5.in-addr.btopenworld.com.
	[81.150.47.5]) by smtp.gmail.com with ESMTPSA id
	d102-v6sm3500980wma.10.2018.06.20.02.18.57 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 02:18:58 -0700 (PDT)
From: Ryan Launchbury <ryan@magenta.tv>
Message-ID: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
Date: Wed, 20 Jun 2018 10:18:56 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------50CCAB564061EB7F1A610472"
Content-Language: en-GB
Subject: [linux-lvm] Unable to un-cache logical volume when chunk size is
	over 1MiB
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

This is a multi-part message in MIME format.
--------------50CCAB564061EB7F1A610472
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm having a problem uncaching logical volumes when the cache data 
chunck size is over 1MiB.
The process I'm using to uncache is: lvconvert --uncache vg/lv


The issue occurs across multiple systems with different hardware and 
different versions of LVM.

Steps to reproduce:

 1. Create origin VG & LV
 2. Add cache device over 1TB to the origin VG
 3. Create the cache data lv:
    lvcreate -n cachedata -L 1770GB cached_vg /dev/nvme0n1
 4. Create the cache metadata lv:
    lvcreate -n cachemeta -L 1770MB cached_vg /dev/nvme0n1
 5. Convert to a cache pool:
    lvconvert --type cache-pool --cachemode writethrough --poolmetadata
    cached_vg/cachemeta cached_vg/cachedata
 6. Enable caching on the origin LVM:
    lvconvert --type cache --cachepool cached_vg/cachedata
    cached_vg/filestore01
 7. Write some data to the main LV so as the cache device is used:
    dd if=/dev/zero of=/mnt/filestore01/test.dat bs=1M count=10000
 8. Check the cache stats:
    lvs -a -o +cache_total_blocks,cache_used_blocks,cache_dirty_blocks
 9. Repeating step 8 over time will show that the dirty blocks are not
    being written back at all
10. Try to uncache the device:
    lvconvert --uncache cached_vg/filestore01
11. You will get a repeating message. This will loop indefinitely and
    not decrease or complete:
    Flushing x blocks for cache cached_vg/filestore01.

After testing multiple times, the issue seems to be tied to the chunk 
size selected in step 5. The LVM man page mentions that the chunk must 
be a multiple of 32KiB, however the next chunk size automatically 
assigned over 1MiB is usually 1.03MiB. With a chunk size of 1.03MiB or 
higher, the cache is not able to flush. Creating a cache device with a 
chunk size of 1MiB or less, the cache is flushable.

Now knowing how to avoid the issue, I just need to be able to safely 
un-cache systems with do have a cache that will not flush.

Details:

Version info from lvm version:

LVM version:     2.02.171(2)-RHEL7 (2017-05-03)
   Library version: 1.02.140-RHEL7 (2017-05-03)
   Driver version:  4.35.0
   Configuration:   ./configure --build=x86_64-redhat-linux-gnu 
--host=x86_64-redhat-linux-gnu --program-prefix= 
--disable-dependency-tracking --prefix=/usr --exec-prefix=/usr 
--bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc 
--datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 
--libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib 
--mandir=/usr/share/man --infodir=/usr/share/info 
--with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm 
--with-default-pid-dir=/run --with-default-locking-dir=/run/lock/lvm 
--with-usrlibdir=/usr/lib64 --enable-lvm1_fallback --enable-fsadm 
--with-pool=internal --enable-write_install --with-user= --with-group= 
--with-device-uid=0 --with-device-gid=6 --with-device-mode=0660 
--enable-pkgconfig --enable-applib --enable-cmdlib --enable-dmeventd 
--enable-blkid_wiping --enable-python2-bindings --with-cluster=internal 
--with-clvmd=corosync --enable-cmirrord 
--with-udevdir=/usr/lib/udev/rules.d --enable-udev_sync 
--with-thin=internal --enable-lvmetad --with-cache=internal 
--enable-lvmpolld --enable-lvmlockd-dlm --enable-lvmlockd-sanlock 
--enable-dmfilemapd

System info:
System 1,2,3:
- Dell R730XD server
- 12x disk in RAID 6 to onboard PERC/Megaraid controller

System 4:
-Dell R630 server
-60x Disk (6 luns) in RAID 6 to PCI megaraid controller

The systems are currently in production, so it's quite hard for me to 
change the configuration to enable logging.

Any assistance would be much appreciated! If any more info is needed 
please let me know.
Best regards,
Ryan


--------------50CCAB564061EB7F1A610472
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body
 text="#000000" bgcolor="#FFFFFF">
Hello,<br>
<br>
I'm having a problem uncaching logical volumes when the cache data 
chunck size is over 1MiB.<br>
The process I'm using to uncache is: <span style="font-style: italic;">lvconvert
 --uncache vg/lv<br>
  <br>
  <br>
</span>The issue occurs across multiple systems with different hardware 
and different versions of LVM.<br>
<br>
Steps to reproduce:<br>
<ol>
  <li>Create origin VG &amp; LV<br>
  </li>
  <li>Add cache device over 1TB to the origin VG</li>
  <li>Create the cache data lv: <span style="font-style: italic;"><br>
lvcreate -n cachedata -L 1770GB cached_vg /dev/nvme0n1</span></li>
  <li><span style="font-style: italic;"></span>Create the cache metadata
 lv: <br>
    <span style="font-style: italic;">lvcreate -n cachemeta -L 1770MB 
cached_vg /dev/nvme0n1</span></li>
  <li><span style="font-style: italic;"></span>Convert to a cache pool: <br>
    <span style="font-style: italic;">lvconvert --type cache-pool 
--cachemode writethrough --poolmetadata cached_vg/cachemeta 
cached_vg/cachedata</span></li>
  <li>Enable caching on the origin LVM: <br>
    <span style="font-style: italic;">lvconvert --type cache --cachepool
 cached_vg/cachedata cached_vg/filestore01</span></li>
  <li>Write some data to the main LV so as the cache device is used: <span
 style="font-style: italic;"><br>
dd if=/dev/zero of=/mnt/filestore01/test.dat bs=1M count=10000</span></li>
  <li>Check the cache stats: <br>
    <span style="font-style: italic;">lvs -a -o 
+cache_total_blocks,cache_used_blocks,cache_dirty_blocks</span></li>
  <li>Repeating step 8 over time will show that the dirty blocks are not
 being written back at all</li>
  <li>Try to uncache the device:<br>
    <span style="font-style: italic;">lvconvert --uncache cached_vg/</span><span
 style="font-style: italic;">filestore01</span></li>
  <li><span style="font-style: italic;"></span>You will get a repeating 
message. This will loop indefinitely and not decrease or complete:<br>
    <span style="font-style: italic;">Flushing x blocks for cache 
cached_vg/filestore01.</span>
  </li>
 </ol>After testing multiple times, the issue seems to be tied to the 
chunk size selected in step 5. The LVM man page mentions that the chunk 
must be a multiple of 32KiB, however the next chunk size automatically 
assigned over 1MiB is usually 1.03MiB. With a chunk size of 1.03MiB or 
higher, the cache is not able to flush. Creating a cache device with a 
chunk size of 1MiB or less, the cache is flushable.<br>
  <br>
Now knowing how to avoid the issue, I just need to be able to safely 
un-cache systems with do have a cache that will not flush.<br>


<p>Details:<br>
</p>Version info from <span style="font-style: italic;">lvm version</span>:<br>
<p>
LVM version:     2.02.171(2)-RHEL7 (2017-05-03)<br>
  Library version: 1.02.140-RHEL7 (2017-05-03)<br>
  Driver version:  4.35.0<br>
  Configuration:   ./configure 
--build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu 
--program-prefix= --disable-dependency-tracking --prefix=/usr 
--exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin 
--sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include 
--libdir=/usr/lib64 --libexecdir=/usr/libexec --localstatedir=/var 
--sharedstatedir=/var/lib --mandir=/usr/share/man 
--infodir=/usr/share/info --with-default-dm-run-dir=/run 
--with-default-run-dir=/run/lvm --with-default-pid-dir=/run 
--with-default-locking-dir=/run/lock/lvm --with-usrlibdir=/usr/lib64 
--enable-lvm1_fallback --enable-fsadm --with-pool=internal 
--enable-write_install --with-user= --with-group= --with-device-uid=0 
--with-device-gid=6 --with-device-mode=0660 --enable-pkgconfig 
--enable-applib --enable-cmdlib --enable-dmeventd --enable-blkid_wiping 
--enable-python2-bindings --with-cluster=internal --with-clvmd=corosync 
--enable-cmirrord --with-udevdir=/usr/lib/udev/rules.d 
--enable-udev_sync --with-thin=internal --enable-lvmetad 
--with-cache=internal --enable-lvmpolld --enable-lvmlockd-dlm 
--enable-lvmlockd-sanlock --enable-dmfilemapd<br>
</p>
  <p>System info:<br>
System 1,2,3:<br>
- Dell R730XD server<br>
- 12x disk in RAID 6 to onboard PERC/Megaraid controller<br>
  </p>
  <p>System 4:<br>
-Dell R630 server<br>
-60x Disk (6 luns) in RAID 6 to PCI megaraid controller<br>
  </p>
  <p>The systems are currently in production, so it's quite hard for me 
to change the configuration to enable logging.<br>
  </p>
  <p> Any assistance would be much appreciated! If any more info is 
needed please let me know.<br>
Best regards,<br>
Ryan<br>
  </p>

<span style="color: rgb(80, 80, 80);"></span>
</body>
</html>

--------------50CCAB564061EB7F1A610472--
