Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2695768C6B
	for <linux-lvm@redhat.com>; Fri,  5 Jul 2019 09:22:02 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45D7D3092661
	for <linux-lvm@redhat.com>; Fri,  5 Jul 2019 09:21:31 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Fri,  5 Jul 2019 09:21:34 +0000
From: Gang He <GHe@suse.com>
Date: Fri, 5 Jul 2019 09:20:06 +0000
Message-ID: <CH2PR18MB3206304CD1B8DB908666342FCFF50@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "Unknown feature in status" message when running
 lvs/lvdisplay against cached LVs
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi Guys,

I uses lvm2-2.02.180, I got an error message when running lvs/lvdisplay against cached LVs.
e.g. 
linux-v5ay:~ # lvs
  Unknown feature in status: 8 1324/8192 128 341/654272 129 151 225 1644 0 341 0 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 smq 0 rw -
  LV   VG     Attr       LSize  Pool       Origin       Data%  Meta%  Move Log Cpy%Sync Convert
  home system -wi-ao---- 17.99g
  root system Cwi-aoC--- 20.00g [lvc_root] [root_corig] 0.05   16.16           0.00
  swap system -wi-ao----  2.00g

The bug can be reproduced stably with the below steps.
Have a (virtual) machine with 2 disk drives
Install os with LVM as root volume
Then, add the second disk after os is installed.
# pvcreate /dev/sdb
# vgextend system /dev/sdb
# lvcreate --type cache-pool -l 100%FREE -n lvc_root system /dev/sdb
# lvconvert --type cache --cachepool system/lvc_root system/root
then run `lvs` or `lvdisplay` command to trigger the issue


Thanks
Gang
