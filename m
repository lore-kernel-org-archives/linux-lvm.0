Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6KJvha28288
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2004 15:57:43 -0400
Received: from mail.ncsa.uiuc.edu (mail.ncsa.uiuc.edu [141.142.2.28])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6KJvcXn001890
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2004 15:57:38 -0400
Received: from gship4.ncsa.uiuc.edu (gship4.ncsa.uiuc.edu [141.142.98.127])
	by mail.ncsa.uiuc.edu (8.11.7/8.11.7) with ESMTP id i6KJvZd02943
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2004 14:57:35 -0500
Message-Id: <5.1.0.14.2.20040720145206.038b4008@pop.ncsa.uiuc.edu>
Date: Tue, 20 Jul 2004 14:57:39 -0500
From: Guochun Shi <gshi@ncsa.uiuc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] scripts/clvmd_fix_conf.sh
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

hi,

in this script line 47-48
SCRIPTFILE=`mktemp -t lvmscript.XXXXXXXXXX`
TMPFILE=`mktemp -t lvmtmp.XXXXXXXXXX`

but mktemp does not have -t option. It complains when I run the script

[LVM2]#  scripts/clvmd_fix_conf.sh  /lib
mktemp: invalid option -- t
Usage: mktemp [-d] [-q] [-u] template
mktemp: invalid option -- t
Usage: mktemp [-d] [-q] [-u] template
scripts/clvmd_fix_conf.sh: line 127: $SCRIPTFILE: ambiguous redirect
scripts/clvmd_fix_conf.sh: line 128: $TMPFILE: ambiguous redirect
sed failed, /etc/lvm/lvm.conf not updated

please help, thanks
-Guochun
