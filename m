Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t527ZBoB001055
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 2 Jun 2015 03:35:11 -0400
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mx1.redhat.com (Postfix) with ESMTPS id 41FA23812AB
	for <linux-lvm@redhat.com>; Tue,  2 Jun 2015 07:35:09 +0000 (UTC)
Received: by wgez8 with SMTP id z8so132525377wge.0
	for <linux-lvm@redhat.com>; Tue, 02 Jun 2015 00:35:08 -0700 (PDT)
From: Mathijs Kwik <mathijs@bluescreen303.nl>
Date: Tue, 02 Jun 2015 09:35:06 +0200
Message-ID: <87r3puv9zp.fsf@bluescreen303.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Cpy%Sync column - high disk activity after reboots
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
To: zkabelac@redhat.com, linux-lvm@redhat.com

I'm sorry if I was unclear. But I'm not using writeback mode yet.
The period of disk activity after reboots occurs with writethrough mode.


> Hi
> 
> Cache is always flushing it's content to disk - so if you have the
> 'writeback' variant and there were some unwritten data which sits only
> in cache, they are automatically pushed to origin (cached) device -
> which is likely your disk activity.
> 
> Zdenek
