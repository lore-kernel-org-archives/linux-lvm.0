Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6B7g9Gc010881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Jul 2016 03:42:09 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FA067F6CF
	for <linux-lvm@redhat.com>; Mon, 11 Jul 2016 07:42:08 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id 2175F40B23B4
	for <linux-lvm@redhat.com>; Mon, 11 Jul 2016 09:32:16 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Jul 2016 09:32:12 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <CAE7pJ3ARBWgFmuHKCm+pMO+K2=20bcps6P-T_RL7-rwbEgHKKQ@mail.gmail.com>
References: <20160708155231.GA27423@bdmcc-us.com>
	<fc811677-56eb-ca28-d8a3-605ee72fe287@alteeve.ca>
	<CAEmTpZGkbJQ9-j8k2rMqTw0JKiuAiOz4JvioK4H6keUJkO-BTw@mail.gmail.com>
	<CAE7pJ3ARBWgFmuHKCm+pMO+K2=20bcps6P-T_RL7-rwbEgHKKQ@mail.gmail.com>
Message-ID: <de4e7a649085f2de3c96d4c3113bade9@dds.nl>
Subject: Re: [linux-lvm] Copying a raw disk image to LVM2
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

emmanuel segura schreef op 11-07-2016 0:02:

> the lvm metadata is stored in the begining of the physical volume, the
> logical volume is simple block device, so using dd you don't overwrite
> any lvm header.

I must say I did experience something weird when copying a LUKS 
partition (encrypted).

Apparently LUKS stores information about the device it is on (or was 
one) because I coudln't get it to re-adjust to a larger volume.

cryptsetup resize is supposed to resize to the size of the underlying 
block device.

I had to recreate my LUKS container before it would recognise the new 
size.

E.g. I copied from 2GB volume to 3GB volume using dd.

LUKS kept thinking it was still on a 2GB volume.

So resize didn't work and I could manually resize it to 3GB but 
automatic resize would resize it back to 2GB.
