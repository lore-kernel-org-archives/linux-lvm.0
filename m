Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.2])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IDqscO005072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 09:52:55 -0400
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id 73C217CBA9
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 13:52:39 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr001msb.fastweb.it
	(8.5.140.04) id 572A172300CDF15B for linux-lvm@redhat.com;
	Wed, 18 May 2016 15:47:29 +0200
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <573B1812.3080802@assyoma.it>
	<573B213E.7060807@redhat.com>
From: Gionatan Danti <assistenza@assyoma.it>
Message-ID: <573C726B.6020209@assyoma.it>
Date: Wed, 18 May 2016 15:47:23 +0200
MIME-Version: 1.0
In-Reply-To: <573B213E.7060807@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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
Cc: 'Gionatan Danti' <assistenza@assyoma.it>

On 17/05/2016 15:48, Zdenek Kabelac wrote:
>
> Yes - in general - you've witnessed  general tool failure,
> and dmeventd is not 'smart' to recognize the reason of failure.
>
> Normally this 'error' should not happen.
>
> And while I'd even say there could have been a 'shortcut'
> without even reading VG 'metadata' - since there is profile support,
> it can't be known (100% threshold) without actually reading metadata
> (so it's quite tricky case anyway)
>

One question: I did some test (on another machine), deliberately 
killing/stopping the lvmetad service/socket. When the pool was almost 
full, the following entry was logged in /var/log/messages

WARNING: Failed to connect to lvmetad. Falling back to internal scanning.

So it appears than when lvmetad is gracefully stopped/not running, 
dmeventd correctly resort to device scanning. On the other hand, in the 
previous case, lvmetad was running but returned "Connection refused". 
Should/could dmeventd resort to device scanning in this case also?

>
>
> Assuming you've been bitten by this one:
>
> https://bugzilla.redhat.com/1334063
>
> possibly? targeted by this commit:
>
> https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=7ef152c07290c79f47a64b0fc81975ae52554919
>

Very probable. So, after a LVM update, is best practice to restart the 
machine or at least the dmeventd/lvmetad services?

One more, somewhat related thing: when thin pool goes full, is a good 
thing to remount an ext3/4 in readonly mode (error=remount-ro). But what 
to do with XFS which, AFAIK, does not support a similar 
readonly-on-error policy?

It is my understanding that upstream XFS has some improvements to 
auto-shutdown in case of write errors. Did these improvements already 
tickle to production kernels (eg: RHEL6 and 7)?

Thanks.


-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
