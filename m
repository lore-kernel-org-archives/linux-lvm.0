Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBB3Cj9C007175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2016 22:12:45 -0500
Received: from mail2.openmailbox.org (mail2.openmailbox.org [62.4.1.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0BCB7F7B1
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2016 03:12:43 +0000 (UTC)
Received: from www.openmailbox.org (unknown [10.91.130.51])
	by mail2.openmailbox.org (Postfix) with ESMTP id 763B9107686
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2016 04:12:36 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 10 Dec 2016 22:12:36 -0500
From: veleiro@openmailbox.org
In-Reply-To: <f82ba791c980a1d65f6943888f088b79@openmailbox.org>
References: <f82ba791c980a1d65f6943888f088b79@openmailbox.org>
Message-ID: <4cd9f8f50271ad956b6f0668bf186787@openmailbox.org>
Subject: Re: [linux-lvm]
 =?utf-8?q?lvreduce_used_before_resizing_file_system?=
 =?utf-8?q?=2C_what_now=3F?=
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
To: linux-lvm@redhat.com

Nevermind. Figured it out.  resizing to max available did the trick. I 
was lucky!

  sudo lvresize -l +100%FREE /dev/ubuntu-vg/root

On 2016-12-10 21:38, veleiro@openmailbox.org wrote:
> Hello,
> 
> I was following this guide
> https://help.ubuntu.com/community/ResizeEncryptedPartitions#Detailed_resizing_.2BAH4_Reducing_an_encrypted_partition
> on how to reduce the size of an lvm partition.  Its kind of confusing,
> so going from a ext4 420G partition to 390G partition, I did the steps
> in the wrong order:
> 
> sudo e2fsck -f /dev/mapper/ubuntu--vg-root
> # worked
> sudo lvreduce -L -30G /dev/ubuntu--vg/root
> # data warning
> sudo resize2fs -p /dev/mapper/ubuntu--vg-root 390g
> 
> i tried to undo this by
> sudo resize2fs -p /dev/mapper/ubuntu--vg-root 420g # doesnt do
> anything, not enough blocks
> sudo lvresize -l +30G /dev/ubuntu-vg/root #clearly didnt do anything
> or work either
> 
> Is there any procedures to get back to where i started at 420g OR to
> fix it for 390g?
> 
> Thanks!
> veleiro
