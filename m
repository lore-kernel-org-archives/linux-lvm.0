Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50AC85D9C6
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:58:24 +0000 (UTC)
Received: from egamorf.bogon.ca (egamorf.bogon.ca [149.56.143.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 316D6356C5
	for <linux-lvm@redhat.com>; Wed, 18 Jul 2018 14:58:13 +0000 (UTC)
Received: from atlas.bogon.ca ([2001:470:b358:0:2c9d:79ff:fe07:eeb0])
	by egamorf.bogon.ca with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <doug@bogon.ca>) id 1ffnu7-0008Ml-I1
	for linux-lvm@redhat.com; Wed, 18 Jul 2018 14:58:11 +0000
Received: from doug by atlas.bogon.ca with local (Exim 4.90_1)
	(envelope-from <doug@bogon.ca>) id 1ffnu6-00080Z-Dh
	for linux-lvm@redhat.com; Wed, 18 Jul 2018 10:58:10 -0400
Date: Wed, 18 Jul 2018 10:58:10 -0400
From: Douglas Paul <doug@bogon.ca>
Message-ID: <20180718145810.GF12563@bogon.ca>
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
	<326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
	<c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
	<CAG+REr=gFS_3YMo_6s5K32w=ibntEshE7VBOy-7Vt2c7Psi_kQ@mail.gmail.com>
	<213e498ea447f141c7a975c13416281e@assyoma.it>
	<CAG+RErkPfHbBGS9p90nu_mFErMsPQanPwEYz24DP5Yh3jQUBKg@mail.gmail.com>
	<880611df631d8ad243b8c2974102bce8@assyoma.it>
	<6946bbe9-3073-da99-b7d1-bceb978344a3@magenta.tv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6946bbe9-3073-da99-b7d1-bceb978344a3@magenta.tv>
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
 is over 1MiB
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

On Wed, Jul 18, 2018 at 03:25:10PM +0100, Ryan Launchbury wrote:
> Does anyone have any other ideas or potential workarounds for this issue?
> 
> Please let me know if you require more info.

I didn't see this in the previous messages, but have you tried temporarily
remounting the filesystems read-only if you can't unmount them?

Also, earlier you mentioned looking at /var/log/dmesg for write errors.  On
my systems, that only contains a snapshot at boot. I have to run dmesg to
see the latest updates. It seems suspicious to have nothing in the dmesg
during 61 days past 10 seconds after system boot ...

-- 
Douglas Paul
