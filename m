Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 728F5832A7
	for <linux-lvm@redhat.com>; Wed,  3 Jul 2019 15:45:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE8BCC18B2EE
	for <linux-lvm@redhat.com>; Wed,  3 Jul 2019 15:45:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v14so3391893wrr.4
	for <linux-lvm@redhat.com>; Wed, 03 Jul 2019 08:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <D1D4AF7B-074F-4F13-9A23-23694F162675@globalnoc.iu.edu>
In-Reply-To: <D1D4AF7B-074F-4F13-9A23-23694F162675@globalnoc.iu.edu>
From: Chris Murphy <lists@colorremedies.com>
Date: Wed, 3 Jul 2019 09:45:00 -0600
Message-ID: <CAJCQCtR-5CynVzg3TSbUCr8CcK76H=adQHmvGB8sBK3Oj7LFUg@mail.gmail.com>
Subject: Re: [linux-lvm] Lvm RAID0 vs lvm striping
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

On Wed, Jul 3, 2019 at 2:33 AM John Ratliff <jdratlif@globalnoc.iu.edu> wrote:
>
> What is the difference between these two?
>

If the question is about segment type, raid0 and raid1 use the md
driver code (same kernel code the mdadm raid uses, but is managed with
LVM metadata and user space tools). And striped and mirror use an
internal implementation, although I'm not sure if this is internal to
LVM or device-mapper, and I think are considered legacy at this point.

'man 7 lvmraid' doesn't directly answer your question but contains
quite a lot of information about lvmraid. It does explicitly say to
use raid1 over mirror segment type. It doesn't say that about raid0 vs
stripe segment type, maybe the two implementations aren't all that
different but anyway I would use raid0.



-- 
Chris Murphy
