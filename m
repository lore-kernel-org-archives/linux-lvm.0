Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34B7A2063FE5
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2020 11:58:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F3B7800646
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2020 11:58:45 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id dc14so2177835qvb.9
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2020 03:58:42 -0800 (PST)
Received: from [10.10.77.145] ([64.235.96.30])
	by smtp.gmail.com with ESMTPSA id
	c25sm2929431qkc.12.2020.02.22.03.58.40 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 22 Feb 2020 03:58:41 -0800 (PST)
Sender: Evil Eric <ewtoombs@gmail.com>
From: Eric Toombs <ewtoombs@uwaterloo.ca>
Message-ID: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
Date: Sat, 22 Feb 2020 06:58:53 -0500
MIME-Version: 1.0
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] faster snapshot creation?
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

Snapshot creation is already pretty fast:

> $ time sudo lvcreate --size 512M --snapshot --name snap /dev/testdbs/template 
>   Logical volume "snap" created.
> 0.03user 0.05system 0:00.46elapsed 18%CPU (0avgtext+0avgdata 28916maxresident)k
> 768inputs+9828outputs (0major+6315minor)pagefaults 0swaps

That's about half a second in real time. But I have a scenario that
would benefit from it being even faster. I'm doing many small unit tests
starting from a template filesystem. I do the snapshot, run the unit
test on the snapshot, then delete the snapshot afterwards using
lvremove. Each unit test, though, takes much less than a second to run
(often on the order of 10ms), so most of the time is being spent making
these snapshots.

So, is there a sort of "dumber" way of making these snapshots, maybe by
changing the allocation algorithm or something?
