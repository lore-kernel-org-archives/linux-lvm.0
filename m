Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k57I4cTu021574
	for <linux-lvm@redhat.com>; Wed, 7 Jun 2006 14:04:38 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.185])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k57I4Wpq023416
	for <linux-lvm@redhat.com>; Wed, 7 Jun 2006 14:04:32 -0400
Received: by nf-out-0910.google.com with SMTP id p46so189782nfa
	for <linux-lvm@redhat.com>; Wed, 07 Jun 2006 11:04:26 -0700 (PDT)
Message-ID: <5485940d0606071038h7c823b7do58e95a486618d643@mail.gmail.com>
Date: Wed, 7 Jun 2006 18:38:49 +0100
From: "C'est Pierre" <cestpierre@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] lvm and duplicates...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Greetings,

I'm trying to setup a cluster with ServiceGuard but I am going through
a lot of hassles doing so. I did a mistake initially by trying to
pvcreate the 2 luns of the same physical disk from our storage (fiber
channel) and now, while trying to create a new logical volume, I get
this weird error, for the record the sda and sdb are the 2 luns coming
from different paths (cards):

# lvcreate -L1 -n quorum clusterfs
  Found duplicate PV TJs3i47MkmyqU4KFCzdmp8N78w4C76mB: using /dev/sdb1
not /dev/sda1
  Rounding up size to full physical extent 4.00 MB
  Failed to activate new LV.

Even if I lvchange -a y clusterfs, it does seem to work (although the
"Found duplicate" message always shows up), but it doesn't, in fact,
solve the problerm when I try to lvcreate again, the same errors as
the one above, show up.

Any hints on how to fix this? I've already done pvremove /dev/sdb1 and
a pvinit /dev/sda1 again and tried to create the clusterfs again, as
when I do the pvremove -ff /dev/sdb1, the vg clusterfs disappears!

Please, help me out :)
Thank you!
