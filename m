Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6B7wKSs027151
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2013 03:58:21 -0400
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6B7wJ4v021289
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2013 03:58:19 -0400
Received: by mail-ee0-f43.google.com with SMTP id l10so5323744eei.2
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2013 00:58:18 -0700 (PDT)
Message-ID: <51DE6597.20705@gmail.com>
Date: Thu, 11 Jul 2013 09:58:15 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <13d9860ff7a6b54efeecea353ecd6b98.squirrel@mail.mohawksoft.com>
In-Reply-To: <13d9860ff7a6b54efeecea353ecd6b98.squirrel@mail.mohawksoft.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Building thin-provisioning tools > 1.4 on RHEL 6.4
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
Cc: markw@mohawksoft.com

Dne 11.7.2013 02:12, markw@mohawksoft.com napsal(a):
> This is half request half rant.
>
> Is there a way to compile the latest thin-provisioning tools on RHEL 6.4?
> The introduction of C++11 and Boost currently makes this impossible with
> standard development tool chain in the release.
>
> Are there any plans to support the RHEL tool chain? I dread building a new
> gcc and all that involves.
>

For now I'd suggest to stay with tagged version  v0.1.4.

Zdenek
