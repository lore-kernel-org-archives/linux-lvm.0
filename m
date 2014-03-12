Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2CLLho3009615
	for <linux-lvm@redhat.com>; Wed, 12 Mar 2014 17:21:43 -0400
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2CLLg7g003333
	for <linux-lvm@redhat.com>; Wed, 12 Mar 2014 17:21:42 -0400
Received: by mail-pb0-f47.google.com with SMTP id up15so99928pbc.6
	for <linux-lvm@redhat.com>; Wed, 12 Mar 2014 14:21:42 -0700 (PDT)
Received: from leela (host-134-71-248-24.allocated.csupomona.edu.
	[134.71.248.24])
	by mx.google.com with ESMTPSA id q7sm209886pbc.20.2014.03.12.14.21.40
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Mar 2014 14:21:41 -0700 (PDT)
Sender: Paul Henson <paul.b.henson@gmail.com>
From: "Paul B. Henson" <henson@acm.org>
Date: Wed, 12 Mar 2014 14:21:36 -0700
Message-ID: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: [linux-lvm] thinpool metadata size
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

While researching thinpool provisioning, it seems one of the issues is that
the size of the metadata is fixed as of creation, and that if the metadata
allocation fills up, your pool is corrupted? In many of the places that
concern was mentioned, it was also said that extending the size of the
metadata lv was a feature coming soon, but I didn't find anything confirming
whether or not that functionality had been released. Is the size of the
metadata lv still fixed?

My intention is to have a 4TB PV (4 x 2TB RAID10), allocated completely to a
thin pool, with the metadata stored separately on a 256G RAID1 of a couple
SSD's (the rest of the SSD mirror will eventually be used for dm-cache when
lvm support for that is released). This storage will be used for
virtualization, with fairly heavy snapshots, where there will be half a
dozen or so template volumes which will be snapshotted when a new vm is
created, then each of those will have some number of snapshots for backup
purposes (although those snapshots will never be written to). Given such a
usage pattern, is there a best practice recommendation for sizing the
metadata lv? It looks like going with the defaults would result in
approximately 3.6G allocated for metadata.

Thanks.
