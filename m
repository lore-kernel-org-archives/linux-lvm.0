Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4ODjB55029292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 24 May 2016 09:45:11 -0400
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id DCAC478228
	for <linux-lvm@redhat.com>; Tue, 24 May 2016 13:45:08 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr001msb.fastweb.it
	(8.5.140.04) id 572A17230127DFA6 for linux-lvm@redhat.com;
	Tue, 24 May 2016 15:45:07 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 24 May 2016 15:45:06 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <573C726B.6020209@assyoma.it>
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <573B1812.3080802@assyoma.it>
	<573B213E.7060807@redhat.com> <573C726B.6020209@assyoma.it>
Message-ID: <4d91c4c59b86f043d6a83772d8a8a2aa@assyoma.it>
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

Il 18-05-2016 15:47 Gionatan Danti ha scritto:
> 
> One question: I did some test (on another machine), deliberately
> killing/stopping the lvmetad service/socket. When the pool was almost
> full, the following entry was logged in /var/log/messages
> 
> WARNING: Failed to connect to lvmetad. Falling back to internal 
> scanning.
> 
> So it appears than when lvmetad is gracefully stopped/not running,
> dmeventd correctly resort to device scanning. On the other hand, in
> the previous case, lvmetad was running but returned "Connection
> refused". Should/could dmeventd resort to device scanning in this case
> also?
> 
> ...
> 
> Very probable. So, after a LVM update, is best practice to restart the
> machine or at least the dmeventd/lvmetad services?
> 
> One more, somewhat related thing: when thin pool goes full, is a good
> thing to remount an ext3/4 in readonly mode (error=remount-ro). But
> what to do with XFS which, AFAIK, does not support a similar
> readonly-on-error policy?
> 
> It is my understanding that upstream XFS has some improvements to
> auto-shutdown in case of write errors. Did these improvements already
> tickle to production kernels (eg: RHEL6 and 7)?
> 
> Thanks.

Sorry for the bump, I would really like to know your opinions on the 
above remarks.
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
