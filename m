Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 921055D71D
	for <linux-lvm@redhat.com>; Wed, 19 Jun 2019 09:27:14 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D453A3092674
	for <linux-lvm@redhat.com>; Wed, 19 Jun 2019 09:26:40 +0000 (UTC)
Message-Id: <5D09FFC9020000F90006D3D6@prv1-mh.provo.novell.com>
Date: Wed, 19 Jun 2019 03:26:33 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm snapshot cannot be removed with the error "Failed
 to refresh without snapshot"
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

Hello List,

Our user is using lvm2-2.02.180, he attempted to remove a snapshot LV, but failed with the below error,
lvremove /dev/evg00/snap_var
  WARNING: Failed to connect to lvmetad. Falling back to device scanning.
Do you really want to remove active logical volume evg00/snap_var? [y/n]: y
  device-mapper: reload ioctl on  (254:36) failed: Invalid argument
  Failed to refresh var without snapshot.

But I can not reproduce in local, how do I find the root cause behind this problem?
I also can see one related error message in /var/log/messages
Jun 12 09:00:22 gtunxlnb04864 sudo:   buss18 : TTY=pts/0 ; PWD=/PZIR/users/buss18 ; USER=root ; COMMAND=/sbin/lvremove /dev/evg00/snap_opt
Jun 12 09:00:22 gtunxlnb04864 sudo[25821]: pam_unix(sudo:session): session opened for user root by buss18(uid=0)
Jun 12 09:00:22 gtunxlnb04864 kernel: [1492631.077551] device-mapper: ioctl: can't change device type after initial table load.  <<== here
Jun 12 09:00:22 gtunxlnb04864 sudo[25821]: pam_unix(sudo:session): session closed for user root
Jun 12 09:01:01 gtunxlnb04864 cron[25932]: pam_unix(crond:session): session opened for user ggmonux1 by (uid=0)

Thanks
Gang
