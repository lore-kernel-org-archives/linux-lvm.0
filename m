Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13932BF651
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 20:10:49 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04A1823E6E5
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 20:10:35 +0000 (UTC)
References: <61de26b1-0849-e71f-133c-a8357b773ee9@mglug.de>
	<20170515160205.GA15170@redhat.com>
From: Oliver Rath <rath@mglug.de>
Message-ID: <2b7787ad-409b-0322-c446-a1fcf7c8ab2b@mglug.de>
Date: Mon, 15 May 2017 22:10:26 +0200
MIME-Version: 1.0
In-Reply-To: <20170515160205.GA15170@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Howto change cachepolicy on cached thinpool devices?
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
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi David!

On 15.05.2017 18:02, David Teigland wrote:
[..]
> Thanks, this is fixed here
> https://sourceware.org/git/?p=lvm2.git;a=commit;h=5406191cb9112dea6d8a618ae1da815f816291f6
> 

Thanks for fixing this! Ive tried to change now to cleaner policy, which
works fine now:

# lvchange --cachepolicy cleaner /dev/mapper/dmivg-winthinpool_tdata
  Logical volume dmivg/winthinpool_tdata changed.

Also going back to smq works:

# lvchange --cachepolicy smq /dev/mapper/dmivg-winthinpool_tdata
  Logical volume dmivg/winthinpool_tdata changed.

Thank you very much for the quick fix!

Regards,
Oliver
