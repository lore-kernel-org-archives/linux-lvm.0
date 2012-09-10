Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8AFnikU003307
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 11:49:44 -0400
Received: from mail.zipman.it (mail.zipman.it [188.40.73.118])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8AFngWt025600
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 11:49:42 -0400
Received: from [172.28.16.155] (unknown [213.21.147.71])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.zipman.it (Postfix) with ESMTPSA id 421C02F616
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 17:49:41 +0200 (CEST)
Message-ID: <504E0C13.3050703@zipman.it>
Date: Mon, 10 Sep 2012 17:49:39 +0200
From: flavio-redhat@zipman.it
MIME-Version: 1.0
References: <CAGQjrKa5_w0haG9YYDSxYF9XeFT0V4805bC2aLvnzDwkrr5kUg@mail.gmail.com>
In-Reply-To: <CAGQjrKa5_w0haG9YYDSxYF9XeFT0V4805bC2aLvnzDwkrr5kUg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] merge two lvms on same VG
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

On 09/05/2012 02:16 PM, tariq wali wrote:
> Hi, I had a situation to combine two LVM's on the same VG , other than
> wiping the existing ones and recreating a new one is there a way to
> merge the two on same VG ? 

No. You must delete one of the 2 and extend the remaining one.
If you don't have enough space to save all the data in the LV that you
want to delete, you can manually shrink the filesystem on it, shrink the
LV, extend the other LV, extend the filesystem and move data. Then
restart shrinking and extending until all the data is moved.


-- 
Flavio Visentin

A computer is like an air conditioner,
it stops working when you open Windows
