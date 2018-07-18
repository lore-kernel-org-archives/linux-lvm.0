Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA52E60BEC
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 12:59:53 +0000 (UTC)
Received: from exchange.topicus.nl (exchange.topicus.nl [195.35.227.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 403463A9E2
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 12:59:51 +0000 (UTC)
From: Emond Papegaaij <emond.papegaaij@topicus.nl>
Date: Wed, 18 Jul 2018 14:59:49 +0200
Message-ID: <14592984.mkSHKjXs8G@papegaaij>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] Timeout at shutdown after merging an open snapshot
	volume
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

Hi,

On a CentOS 7.5 based virtual appliance we are developing, I want to use LVM 
snapshots to be able to rollback failed upgrades. Prior to the upgrade, I 
create a snapshot volume with:

  lvcreate -s /dev/tkhsystem01/root -l100%FREE -nroot_snap

On a failed upgrade, I merge this snapshot and reboot with:

  lvconvert -y --merge /dev/tkhsystem01/root_snap
  reboot

This works fine, except it causes a 90 second delay in shutdown where systemd 
waits for lvm2-lvmetad.service to shtudown. This fails and the process is 
killed after which shutdown continues. After boot, the snapshot is restored 
correctly. Reading through some reports, I found that monitoring of the 
snapshot volume might cause lvmetad to not shutdown, so I added the following 
command just prior to lvconvert:

  lvchange --monitor n /dev/tkhsystem01/root_snap

This fixes the 90 second timeout at shutdown, but it is unclear to me what 
possible side effects it may have. To be clear, the lvchange, lvconvert and 
reboot commands are executed in a script in direct succession. Does it pose 
any danger to stop monitoring just before a reboot? Is this a bug in LVM2 or 
CentOS or am I doing something wrong?

Best regards,
Emond Papegaaij
