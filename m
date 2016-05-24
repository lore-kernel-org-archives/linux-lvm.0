MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 24 May 2016 16:28:24 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <323a1fe9-b750-51f3-2967-a2bdf53e259c@redhat.com>
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <573B1812.3080802@assyoma.it>
	<573B213E.7060807@redhat.com> <573C726B.6020209@assyoma.it>
	<4d91c4c59b86f043d6a83772d8a8a2aa@assyoma.it>
	<323a1fe9-b750-51f3-2967-a2bdf53e259c@redhat.com>
Message-ID: <1d48e462516f2836fd7ea96af5c9bb33@assyoma.it>
Subject: Re: [linux-lvm]
	=?utf-8?q?Unexptected_filesytem_unmount_with_thin_pro?=
	=?utf-8?q?vision__and_autoextend_disabled_-_lvmetad_crashed=3F?=
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
Cc: Zdenek Kabelac <zkabelac@redhat.com>

Il 24-05-2016 16:17 Zdenek Kabelac ha scritto:
> 
> 
> Dmeventd should not talk to lvmetad at all - I'm saying this for 
> years....
> 
> There are some very very hard to fix (IMHO) design issues - and
> locking lvmetad in memory would be just one of wrong (IMHO) ways
> forward....
> 
> Anyway - let's see how it evolves here as there are further troubles
> with lvmetad & dmeventd - see i.e. here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1339210

I'll follow it ;)

> One more, somewhat related thing: when thin pool goes full, is a good
> thing to remount an ext3/4 in readonly mode (error=remount-ro). But
> what to do with XFS which, AFAIK, does not support a similar
> readonly-on-error policy?
> 
> It is my understanding that upstream XFS has some improvements to
> auto-shutdown in case of write errors. Did these improvements already
> tickle to production kernels (eg: RHEL6 and 7)?

Any thoughts/suggestions on that?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
