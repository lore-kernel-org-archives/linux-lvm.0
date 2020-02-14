Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E24C2063209
	for <linux-lvm@redhat.com>; Fri, 14 Feb 2020 19:34:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53C72802E66
	for <linux-lvm@redhat.com>; Fri, 14 Feb 2020 19:34:24 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 14 Feb 2020 20:34:19 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <20200214191115.GA20792@redhat.com>
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
Message-ID: <1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
Cc: heming.zhao@suse.com

Il 2020-02-14 20:11 David Teigland ha scritto:
> Hi, it looks like a bug led to an incorrect filter configuration 
> actually
> working for a period of time.  When the bug was later fixed, the 
> incorrect
> filter became apparent.  In summary, the correct way to exclude devs 
> from
> lvmetad (and to handle duplicate PVs) is to set global_filter; filter 
> is
> not meant to work for that.

Hi David, being filters one of the most asked questions, can I ask why 
we have so many different filters, leading to such complex interactions 
and behaviors?

Don't get me wrong: I am sure you (the lvm team) have very good reasons 
to do that, and I am surely missing something? But what, precisely? How 
should we (end users) consider filters? Should we only use 
global_filter?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
