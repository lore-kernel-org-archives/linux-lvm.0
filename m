Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u39NJtWh007742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 9 Apr 2016 19:19:55 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1ap2AU-0005Jr-GG
	for linux-lvm@redhat.com; Sun, 10 Apr 2016 00:19:54 +0100
Date: Sun, 10 Apr 2016 00:19:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20160409231954.GH9081@agk-dp.fab.redhat.com>
References: <20160409101245.GB31040@nicku.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160409101245.GB31040@nicku.org>
Subject: Re: [linux-lvm] Shrinking LVM partition at beginning
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Outline of the process:

Work out the new layout as best you can.

vgcfgbackup the metadata into a text file.

Update partition table moving the start of the partition, being careful to
respect any alignment restrictions.

Edit the text file based on the new partition start location so that all the
data will be in the same place (so all extent numbers will be smaller by
the same fixed amount, and dev_size and pe_start values will change).

pvcreate with --restorefile and -Zn to format the "new" partition for LVM's
use based on the edited file.

vgcfgrestore from that file.

Alasdair
