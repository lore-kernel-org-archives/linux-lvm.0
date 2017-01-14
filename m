Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0E5gmbx009417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 00:42:48 -0500
Received: from mail.knebb.de (mail.knebb.de [85.25.100.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C62B3DE3F
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 05:42:46 +0000 (UTC)
Received: from [192.168.0.229] (p5DE005BF.dip0.t-ipconnect.de [93.224.5.191])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: cvoelker)
	by mail.knebb.de (Postfix) with ESMTPSA id 1CA369C0332
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 06:42:41 +0100 (CET)
From: knebb@knebb.de
Message-ID: <3f1173f8-9bd0-34c8-fb44-a799b0db276e@knebb.de>
Date: Sat, 14 Jan 2017 06:41:47 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Again: duplicate PVs - filter rules
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

Hi all,

I thought my filter rules where fine now. But they are not.

I have in /etc/lvm/lvm.conf:

 filter = [ "r|/dev/sdb|","r|/dev/sdc|" ]

I scan my PVs:

[root@backuppc ~]# pvscan --cache
  WARNING: PV AvK0Vn-vAdJ-K4nf-0N1x-u1fR-dlWG-dJezdg on /dev/sdc was
already found on /dev/drbd1.
  WARNING: Disabling lvmetad cache which does not support duplicate PVs.
  WARNING: Not using lvmetad because duplicate PVs were found.
[root@backuppc ~]# pvscan
  WARNING: PV AvK0Vn-vAdJ-K4nf-0N1x-u1fR-dlWG-dJezdg on /dev/sdc was
already found on /dev/drbd1.
  WARNING: Disabling lvmetad cache which does not support duplicate PVs.
  WARNING: Not using lvmetad because duplicate PVs were found.
  PV /dev/sda2    VG cl              lvm2 [15,00 GiB / 0    free]
  PV /dev/drbd1   VG test            lvm2 [3,00 GiB / 0    free]
  Total: 2 [17,99 GiB] / in use: 2 [17,99 GiB] / in no VG: 0 [0   ]

So question again, why does it accept my /dev/sdc as PV discarding
filter rules?


/Greetings


Christian
