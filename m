Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6Q5BfdC017998
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2010 01:11:41 -0400
Received: from smtp4.pacifier.net (smtp4.pacifier.net [64.255.237.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6Q5BUtu005202
	for <linux-lvm@redhat.com>; Mon, 26 Jul 2010 01:11:30 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp4.pacifier.net (Postfix) with ESMTP id 28B716A441
	for <linux-lvm@redhat.com>; Sun, 25 Jul 2010 22:11:30 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Sun, 25 Jul 2010 22:11:25 -0700
References: <AANLkTiljnm5auaxJhW2-BgHhsYYjOh79z6fxu2daMinE@mail.gmail.com>
In-Reply-To: <AANLkTiljnm5auaxJhW2-BgHhsYYjOh79z6fxu2daMinE@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201007252211.25422.benscott@nwlink.com>
Subject: Re: [linux-lvm] How to use liblvm
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
Content-Type: Text/Plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Monday, July 19, 2010 02:18:47 am chen wrote:
> Hi,
> 
> I am new to lvm API programming and want to use API instead of CLI,
> 
> I have scanned all functions in lvm2app.h of liblvm,
> 
> but I couldn't find one function that can match the command "pvcreate" and
> I don't know how to create snapshots using liblvm

The pvcreate function is part of vgextend now. First liblvm is used to create 
a group then to extend it with the devices you want to include. Finally you 
can write the changes. 

> 
> Could you give me an example about how to build a  logical volume and its
> snapshot using "liblvm"?
> 
> Thank you very much!

I don't think snapshots can be done with the library yet. Only simple linear 
volumes. 
