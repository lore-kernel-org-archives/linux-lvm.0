Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4VEpQMu022704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 31 May 2015 10:51:26 -0400
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mx1.redhat.com (Postfix) with ESMTPS id E87FA39EC65
	for <linux-lvm@redhat.com>; Sun, 31 May 2015 14:51:24 +0000 (UTC)
Received: by wifw1 with SMTP id w1so76188202wif.0
	for <linux-lvm@redhat.com>; Sun, 31 May 2015 07:51:23 -0700 (PDT)
Received: from bluebook.bluescreen303.nl (bluebook.bluescreen303.nl.
	[2a01:7c8:aaad:310::b10e:b00c])
	by mx.google.com with ESMTPSA id n1sm12290560wix.0.2015.05.31.07.51.22
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 May 2015 07:51:22 -0700 (PDT)
From: Mathijs Kwik <mathijs@bluescreen303.nl>
Date: Sun, 31 May 2015 16:51:21 +0200
Message-ID: <877frou7fa.fsf@bluescreen303.nl>
MIME-Version: 1.0
Subject: [linux-lvm] Cpy%Sync column - high disk activity after reboots
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

Hi all,

I'm trying lvmcache and it seems to work ok. However, after every
reboot, I notice quite a long period of disk activity. lvs gives me this
output:

% lvs
  LV            VG       Attr       LSize   Pool    Origin                Data%  Meta%  Move Log Cpy%Sync Convert
  btrfs-spinner bluebook Cwi-aoC--- 582,19g [cache] [btrfs-spinner_corig] 70,11  11,34           82,55           

The % gets lower over time and when it reaches 0 the disk activity goes
back to normal.

Is this to be expected/normal?
It seems to me the entire cache is checked as if it wasn't cleanly
closed on shutdown. I'm currently using writethrough and would like to
make sure everything is ok before enabling writeback.

Thanks,
Mathijs
