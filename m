Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u84CraPv017241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 4 Sep 2016 08:53:36 -0400
Received: from mail-it0-f71.google.com (mail-it0-f71.google.com
	[209.85.214.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F214FC0467CB
	for <linux-lvm@redhat.com>; Sun,  4 Sep 2016 12:53:35 +0000 (UTC)
Received: by mail-it0-f71.google.com with SMTP id e124so55026381ith.0
	for <linux-lvm@redhat.com>; Sun, 04 Sep 2016 05:53:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAHA9vup5eTrQExUxZq0NFFCVAZ9dHY1M7qus7P4MkJXK_F=HA@mail.gmail.com>
References: <CAAHA9vup5eTrQExUxZq0NFFCVAZ9dHY1M7qus7P4MkJXK_F=HA@mail.gmail.com>
From: Liron Aravot <laravot@redhat.com>
Date: Sun, 4 Sep 2016 15:53:34 +0300
Message-ID: <CAAHA9vvV2tLEobT1s5hL+8n5=4-i89Uy5GwDwBoWmDH9Mha9sg@mail.gmail.com>
Subject: Re: [linux-lvm] pvmove related questions
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
To: linux-lvm@redhat.com

On Sun, Sep 4, 2016 at 3:42 PM, Liron Aravot <laravot@redhat.com> wrote:
> Hi,
> We started to work on adding support to RHV/oVirt to reduce a device
> from a vg, I have a few related pvmove questions-
>
> 1. is there a plan to add support to pvmove --abort for a specific
> device? i saw a related comment in the code but haven't found a BZ for
> that.
>
> 2. When there's no data to move on the source device, pvmove fails
> with "No data to move" (rc = 5), if i want to check it myself prior to
> the execution, is checking if pv_pe_count = pv_pe_alloc_count is
> sufficient?
sorry, meant to pv_pe_alloc_count = 0
>
> 3. if pvmove is interrupted (by a machine reboot) - i'm left with a
> temp pvmove lv with one active mirrored segment which is used by some
> LV.
> is it allowed to run pvmove on the temp pvmove lv device at this
> point? does lvm knows to to handle that?
>
> thanks,
> Liron.
