Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 302A270132
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 10:23:26 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32C43C02833E
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 10:23:25 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	wALANNEm023176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 11:23:23 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Nov 2018 11:23:23 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <7cfd30ab-f5db-2616-9fd3-983be808d53c@hoster-ok.com>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
	<1542382913.30686.3@mail.gathman.org>
	<ae2dff6f425466ed773e8e5330fce33e@cs.uni-dortmund.de>
	<7cfd30ab-f5db-2616-9fd3-983be808d53c@hoster-ok.com>
Message-ID: <bc9aa21f87b34dc7753db8113ae93401@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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

Hello,

> May be silly question: Do you have selinux or equivalent enabled?

I HAD apparmor enabled, but after the first failures (like described 
here) had occurred, I also suspected apparmor as a possible reason and 
disabled it. Unfortunately, that did not help.

Regards
   Christoph
