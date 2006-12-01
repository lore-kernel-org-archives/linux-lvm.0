Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB19xqL7017080
	for <linux-lvm@redhat.com>; Fri, 1 Dec 2006 04:59:52 -0500
Received: from web50709.mail.yahoo.com (web50709.mail.yahoo.com
	[206.190.38.250])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kB19xmTp002301
	for <linux-lvm@redhat.com>; Fri, 1 Dec 2006 04:59:48 -0500
Message-ID: <20061201095942.41985.qmail@web50709.mail.yahoo.com>
Date: Fri, 1 Dec 2006 01:59:42 -0800 (PST)
From: santhosh fernandes <santhosh_fernandes@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LV creation error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi ,

I am creating volume group on SLES 9 SP3 server. LV
creation is failing with error message �device-mapper
ioctl cmd 9 failed: Invalid argument�

System configuration :

OS: SLES9 SP3 
Hardware: i386
LVM version:     2.01.14 (2005-08-04)
Library version: 1.01.01 (2005-03-29)
Driver version:  4.4.0
Kernel version: 2.6.5-7.244-smp
Device mapper multipath version : 0.4.5-0.11

Any body has come cross similar situation. ? Please
help me to resolve this issue

The screen shot is


HALIN02:~ # lvcreate -L1M -n rsm-part-disk-vg-lv
rsm-part-disk-vg
  Found duplicate PV g8R9DTRugiA5SmfXJ3QWXe3hJhz43GaG:
using /dev/sdc not /dev/sda
  Found duplicate PV YaPhu7JBspihkYXUSskLExtolxt82otV:
using /dev/sdd1 not /dev/sdb1
  Found duplicate PV g8R9DTRugiA5SmfXJ3QWXe3hJhz43GaG:
using /dev/sde not /dev/sda
  Found duplicate PV YaPhu7JBspihkYXUSskLExtolxt82otV:
using /dev/sdf1 not /dev/sdb1
  Found duplicate PV g8R9DTRugiA5SmfXJ3QWXe3hJhz43GaG:
using /dev/sdg not /dev/sda
  Found duplicate PV YaPhu7JBspihkYXUSskLExtolxt82otV:
using /dev/sdh1 not /dev/sdb1
  /dev/sdi: read failed after 0 of 4096 at 0:
Input/output error
  /dev/sdj: read failed after 0 of 4096 at 0:
Input/output error
  /dev/sdk: read failed after 0 of 4096 at 0:
Input/output error
  /dev/sdl: read failed after 0 of 4096 at 0:
Input/output error
  Rounding up size to full physical extent 4.00 MB
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device
'rsm--part--disk--vg-rsm--part--disk--vg--lv'.
  Failed to activate new LV.


Thanks in advance.

Regards
Santhosh







 
____________________________________________________________________________________
Want to start your own business?
Learn how on Yahoo! Small Business.
http://smallbusiness.yahoo.com/r-index
