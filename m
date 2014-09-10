Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8ACZWc8021326
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 08:35:32 -0400
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8ACZRS0026270
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 08:35:28 -0400
Received: by mail-lb0-f173.google.com with SMTP id w7so5726163lbi.4
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 05:35:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140910093922.GA4722@debian>
References: <5410138C.9010603@cemery.org.uk> <20140910093922.GA4722@debian>
From: Fran Garcia <franchu.garcia@gmail.com>
Date: Wed, 10 Sep 2014 14:35:06 +0200
Message-ID: <CAD+pdNeD-waiZwurw3niih1BPk6fBf9HOannBH6EiLGyYnn3DQ@mail.gmail.com>
Subject: Re: [linux-lvm] Replace small drive with bigger, using LVM?
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

On Wed, Sep 10, 2014 at 11:39 AM, Joe Thornber <thornber@redhat> wrote:
> On Wed, Sep 10, 2014 at 10:02:04AM +0100, Craig wrote:
>> So I'd love to do something like
>> * dd /dev/sda1 to /dev/sdb1 or something like that and have my /boot
>> volume set up
>
> Use pvmove to move everything across to the new disk.

Also note you should be using parted rather than fdisk for sdb.
You'll need to enable GPT support to partition anything larger than
2Tb.

HTH

Fran
