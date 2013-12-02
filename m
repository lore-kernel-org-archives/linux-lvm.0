Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rB2BfYda014667
	for <linux-lvm@redhat.com>; Mon, 2 Dec 2013 06:41:34 -0500
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB2BfWbY026057
	for <linux-lvm@redhat.com>; Mon, 2 Dec 2013 06:41:32 -0500
Received: by mail-wi0-f170.google.com with SMTP id hq4so4583693wib.3
	for <linux-lvm@redhat.com>; Mon, 02 Dec 2013 03:41:32 -0800 (PST)
MIME-Version: 1.0
From: Guilherme Moro <guilherme.moro@gmail.com>
Date: Mon, 2 Dec 2013 11:41:11 +0000
Message-ID: <CADsoVx80SzPEnyyzmEFRppTHqBSsyuOuvN+q-eQAOxPd_VHgYg@mail.gmail.com>
Subject: [linux-lvm] LVM snapshot merge and corrupted file
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

Hi,

I know that is a too broad question, but please be kind ;)
The scenario:
RHEL 6.2 - snapshot a disk mounted over multipath device mapper
Upgrade system to RHEL 6.4
Merge the snapshot to return the system to previous state.
System get unstable and rebooting cyclic (not reaching user-level, at
least the logs don't show it)
Spot a file that got more or less 1200 bytes corrupted (mostly turned to 0).

Sadly, I got called to the machine too late to recover the console
output of the reboot (it's a blade and no console logs was
configured), and could figure out if some hardware failure happened.

As I don't have proper logs to further investigate my questions is:

- There are any know issues around snapshotting in this conditions
(RHEL 6.2 -> RHEL 6.4, multipath)?
- There's any chance of this being a software failure (bug?) and do
the restore procedure warn me in the logs (/var/log/message?) about
any failure during the restore (even if hardware related).

My main suspicion for now is a hardware failure somewhere, but I was
kindly asked to be sure that this can't be a bug.

Any thoughts or pointers (docs, pieces of code, testing reports) would
be appreciate, so don't be shy :)

Regards,

Guilherme Moro

PS: Do Red Hat, or somebody else do any kind of continuous integration
tests on LVM?
