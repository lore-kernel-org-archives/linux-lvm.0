Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GM3RUE010321
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 18:03:27 -0400
Received: from mail-ew0-f211.google.com (mail-ew0-f211.google.com
	[209.85.219.211])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GM3GrA013006
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 18:03:17 -0400
Received: by ewy7 with SMTP id 7so3722431ewy.7
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 15:03:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253132553.3243.18.camel@delo.gdit>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
	<1253119669.5326.32.camel@delo.gdit>
	<20090916220353.23932049@fixlaptop.gillibert.homelinux.net>
	<1253132553.3243.18.camel@delo.gdit>
Date: Thu, 17 Sep 2009 00:03:16 +0200
Message-ID: <a2e3dd460909161503t932c236i87ef0726331d5883@mail.gmail.com>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: Kai Stian Olstad <kai.stian.olstad@gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

On Wed, Sep 16, 2009 at 10:22 PM, Ambrogio De Lorenzo
<ambrogio.de.lorenzo@alice.it> wrote:
> The good and most secure way is to mirror disks. In this way all blocks
> are replicated, all I/O are replicated and disks are syncronized when I
> shutdown the OS.

You could use DRBD, then you would have a block to block copy on a
different machine.


-- 
Kai Stian
