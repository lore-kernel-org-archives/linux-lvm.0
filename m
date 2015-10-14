Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9EKIicr017801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Oct 2015 16:18:44 -0400
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mx1.redhat.com (Postfix) with ESMTPS id 204EE67
	for <linux-lvm@redhat.com>; Wed, 14 Oct 2015 20:18:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9EKIhFU005153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 14 Oct 2015 13:18:43 -0700 (PDT)
Message-ID: <561EB8A1.10806@windriver.com>
Date: Wed, 14 Oct 2015 14:18:41 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] unexpected behaviour of "lvresize" with sparse volumes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I'm running the 3.14 kernel with lvm 2.02.98 and I ran into something unexpected 
with lvresize.

I created a sparse volume:

lvcreate -L 25M -V 50M -n sparsevol myvg


This gives output in lvdisplay like this:
   LV Size                52.00 MiB
   Current LE             13
   COW-table size         28.00 MiB
   COW-table LE           7

I then resized the volume with lvresize:

lvresize -L 200M myvg/sparsevol


This seems to resize the COW-table, but not the volume itself.  Now lvdisplay shows:

   LV Size                52.00 MiB
   Current LE             13
   COW-table size         200.00 MiB
   COW-table LE           50


At this point I've got 200MiB of backing store and running "lvs" shows an LSize 
of "200m" but I can only write 52MiB worth of data to the volume before it 
complains.

Is there a way to expand the "LV Size" shown in lvdisplay so that I can write 
the resized amount of data to the volume?

Thanks,
Chris
