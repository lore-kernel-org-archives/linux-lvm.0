Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9JCYRt4000986
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 08:34:28 -0400
Received: from mail-gx0-f174.google.com (mail-gx0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9JCYRmZ028940
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 08:34:27 -0400
Received: by ggnb1 with SMTP id b1so2056923ggn.33
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 05:34:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E9EB305.4070503@libertytrek.org>
References: <3389678474F1634EA260EC27A3C10968025C381E00A1@EXCHMBXSVR.corp.ad>
	<4E9EB305.4070503@libertytrek.org>
Date: Wed, 19 Oct 2011 08:34:26 -0400
Message-ID: <CAEhu1-6rT8r1+TWA6O0yDZv3w4N1cy5ETZhRua4Osdk1c6X2=Q@mail.gmail.com>
From: John Drescher <drescherjm@gmail.com>
Subject: Re: [linux-lvm] Attempting to salvage data from a PV on a damaged
	disk
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

>> The system would not boot from the "live disk" due to what appears to be a
>> minor (but not minor enough) disk failure (SMART and other tests pass, but I
>> get some I/O errors before operations work).
>
> What filesystem is on the disk? Maybe you could try something like spinrite?
> I have used it successfully countless times with drives that have developed
> some bad sectors but are otherwise ok...
>

I also recommend ddrescue for this task.

http://www.forensicswiki.org/wiki/Ddrescue

It will first copy around problem areas of the disk then it will try
to recover the sectors around the problem. This is assuming the
problem with the disk is unreadable sectors.

SMART id # 197 and 198.

http://en.wikipedia.org/wiki/S.M.A.R.T.

John
