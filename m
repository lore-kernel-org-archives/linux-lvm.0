Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o955XcDC032752
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 01:33:38 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o955XQgT005562
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 01:33:26 -0400
Received: by iwn5 with SMTP id 5so10204833iwn.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 22:33:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1286249478.12105.27@raydesk1.bettercgi.com>
References: <AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
	<1286249478.12105.27@raydesk1.bettercgi.com>
Date: Tue, 5 Oct 2010 11:03:25 +0530
Message-ID: <AANLkTimSuJmsruAbN5K+s8=DcrcVqB6BAbcyFhdTauF+@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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

On Tue, Oct 5, 2010 at 9:01 AM, Ray Morris <support@bettercgi.com> wrote:
>
> partitions, just like any other block device.
> Preferably use parted as opposed to fdisk, as
> fdisk can support only up to 2 TB.

You mean to say within the LVM if I use parted that way I will be able
to create two different filesystems existing together.
Until now what ever I came across internet is mkfs.ext3 and mkswapfs but
they work on two different LVM and will convert those LVM into ext3
and swap respectively.
I want to break one LVM into 2 one of which I want to populate with a
root filesystem
and another with swap.
