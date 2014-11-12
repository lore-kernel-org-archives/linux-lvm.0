Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sACNBvaO003053
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2014 18:11:57 -0500
Received: from pulsar.caosdigital.com (pulsar.caosdigital.com [208.78.102.203])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sACNBuL2003323
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2014 18:11:56 -0500
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by pulsar.caosdigital.com (Postfix) with ESMTP id AC7234986F
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 00:43:09 +0100 (CET)
Received: by mail-la0-f52.google.com with SMTP id pv20so11960868lab.25
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2014 15:11:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5463DC2D.5020305@ttux.net>
References: <5463DC2D.5020305@ttux.net>
From: Fran Garcia <fran@caosdigital.com>
Date: Thu, 13 Nov 2014 00:11:23 +0100
Message-ID: <CAD+pdNfniQEczbEO1aP+f2E-XhqjvnYrPSf+ig+OQzO6G+Gtbw@mail.gmail.com>
Subject: Re: [linux-lvm] broken fs after removing disk from group
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

On Wed, Nov 12, 2014 at 11:16 PM, Marc des Garets wrote:
> Hi,
>[...]
> Now the problem is that I can't mount my volume because it says:
> wrong fs type, bad option, bad superblock
>
> Which makes sense as the size of the partition is supposed to be 2.4Tb but
> now has only 2.2Tb. Now the question is how do I fix this? Should I use a
> tool like testdisk or should I be able to somehow create a new physical
> volume / volume group where I can add my logical volumes which consist of 2
> physical disks and somehow get the file system right (file system is ext4)?

So you basically need a tool that will "invent" about 200 *Gb* of
missing filesystem? :-)

I think you better start grabbing your tapes for a restore...

~f
