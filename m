Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JH7euS027712
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:07:40 -0400
Received: from mail-gx0-f216.google.com (mail-gx0-f216.google.com
	[209.85.217.216])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JH7Tnw025305
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:07:29 -0400
Received: by gxk8 with SMTP id 8so4205623gxk.9
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 10:07:28 -0700 (PDT)
From: "kevin" <k@kevinkevin.com>
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>
	<20100519162601.GA18162@us.ibm.com>	<05c901caf771$a3161920$e9424b60$@com>
	<Pine.LNX.4.64.1005191246520.28122@bmsred.bmsi.com>
	<4BF41884.4080000@alteeve.com>
In-Reply-To: <4BF41884.4080000@alteeve.com>
Date: Wed, 19 May 2010 13:07:17 -0400
Message-ID: <05cf01caf775$bdf90b90$39eb22b0$@com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

> I would only recommend this if the drive is permanently attached to your
> server.  If there is any possibility of it getting moved to another
system,
> especially another OS, it is likely to appear "unformatted" and the other
> OS will offer to create a partition table, etc, destroying the data.
> The partition table, although otherwise useless for LVM (and a pain when
> trying to align PPs to some lower lever boundary), does serve the purpose
> of telling other PC operating systems that there is something there.

This drive is to be permanently attached to the system so I don't think I
need to worry about marking it as 8e in fdisk. Thanks all for your help.
This clarifies a lot of things for me.


~k
