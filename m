Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E1C92166B44
	for <linux-lvm@redhat.com>; Sat, 10 Oct 2020 16:52:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 043961823606
	for <linux-lvm@redhat.com>; Sat, 10 Oct 2020 16:52:40 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <269f632e-591e-56c3-a3be-31ac6060f73f@yahoo.co.uk>
Date: Sat, 10 Oct 2020 17:52:32 +0100
MIME-Version: 1.0
References: <269f632e-591e-56c3-a3be-31ac6060f73f.ref@yahoo.co.uk>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] raid0 - no performance increase??
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi guys,

I have a simple raid0 lvm comprising of two NVME devices.
I'd expect performance of such a volume to be higher than a
"regular" volume ran of a single NVME, but simple dbench
shows such raid0 volume to the same "slow" as a single NVME
volume.
The system is a Centos 8 with 5.8.14-1.el8.elrepo.x86_64 and
default kernels.

raid0:
  #Str #DStr Stripe Type   Devices                   
     2     2 64.00k raid0  0_rimage_0(0),0_rimage_1(0)
     1     1     0  linear /dev/nvme0n1(0)           
     1     1     0  linear /dev/nvme1n1(0)

Care to share your thoughts? I'll be grateful.
many thanks, L
