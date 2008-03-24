Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2OEa7xg018918
	for <linux-lvm@redhat.com>; Mon, 24 Mar 2008 10:36:07 -0400
Received: from scan.5ninesdata.com (scan.5ninesdata.com [208.66.134.12])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2OEZZLB029426
	for <linux-lvm@redhat.com>; Mon, 24 Mar 2008 10:35:35 -0400
Received: from 5ninesdata.com (localhost [127.0.0.1])
	by scan.5ninesdata.com (Spam Firewall) with ESMTP id B999B2BB151
	for <linux-lvm@redhat.com>; Mon, 24 Mar 2008 09:35:34 -0500 (CDT)
Received: from 5ninesdata.com (mail.5ninesdata.com [208.66.134.10]) by
	scan.5ninesdata.com with ESMTP id a0El1ptcTVKMVsAB
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=NO) for
	<linux-lvm@redhat.com>; Mon, 24 Mar 2008 09:35:34 -0500 (CDT)
Message-ID: <47E7ACFA.5050102@stthomasepc.org>
Date: Mon, 24 Mar 2008 09:30:34 -0400
From: Tod <tod@stthomasepc.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Duplicate VG
References: <20080313170928.p624q5xqo844kc0w@www.destar.net>
	<20080314013838.GB1788@agk.fab.redhat.com>
In-Reply-To: <20080314013838.GB1788@agk.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> As long as you're not using an old version of lvm2, use vgrename
> with the uuid before a normal vgremove.
> 


What if you are using an old version of lvm2?  Are there other options?


Thanks,

Tod
