Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8Kijr22776
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:44:45 -0500
Received: from snark.apl.washington.edu (postfix@snark.apl.washington.edu
	[128.208.78.3])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iA8Kiddr005290
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:44:39 -0500
Received: from pcaxel (dhcp-96-42.apl.washington.edu [128.95.96.42])
	by snark.apl.washington.edu (Postfix) with ESMTP id 36BB897903
	for <linux-lvm@redhat.com>; Mon,  8 Nov 2004 10:40:18 -0800 (PST)
From: "Axel Schweiger" <axel@apl.washington.edu>
Subject: Re: [linux-lvm] Backup/Recovery Strategies
Date: Mon, 8 Nov 2004 10:40:18 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20041108184018.36BB897903@snark.apl.washington.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Heinz,
Thanks for your reply. Couple of clarification questions:
Lets say the disk that holds the the lvm metadata (and system files) dies
and I have to rebuild from scratch:

1) I restore the system disk
2) restore the /etc/lvm* files from backup ?
3) Am I done? 
 
Lets say I have another a couple of other LVs that don't include PVs from
the crashed disk. Lets say the data on 
the filesystem have changed. since the last backup of the /etc/lvm* data.
Will those filesystems be OK after the
restore of the /etc/lvm* data?

Besten Dank
Axel

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen RedHat com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
