Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FD1C100194E
	for <linux-lvm@redhat.com>; Mon, 14 Oct 2019 08:00:46 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2CC7F859FB
	for <linux-lvm@redhat.com>; Mon, 14 Oct 2019 08:00:44 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Mon, 14 Oct 2019 08:00:06 +0000
From: Gang He <GHe@suse.com>
Date: Mon, 14 Oct 2019 08:00:21 +0000
Message-ID: <CH2PR18MB32066B47726171588477EAC1CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] devices/dir configuration option in /etc/lvm/lvm.conf
	can be edited?
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

Hello List,

By default, devices/dir configuration option in /etc/lvm/lvm.conf is "=/dev".
But, if I edit this configuration option, e.g. dir = "/dev/lvm", then lvcreate command will fail.

sles12sp4-node:/dev # lvcreate -L2G -ay -n testlv vgdata
  /dev/lvm/vgdata/testlv: not found: device not cleared
  Aborting. Failed to wipe start of new LV.

I am using lvm 2.02.183(or 180), this option can be edit individually? 
or any other option will affect this option, then lead to lvcreate failure.

Thanks
Gang
