Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m2E1cdA7022823
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 21:38:39 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JZysY-0006SV-VF
	for linux-lvm@redhat.com; Fri, 14 Mar 2008 01:38:38 +0000
Date: Fri, 14 Mar 2008 01:38:38 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Duplicate VG
Message-ID: <20080314013838.GB1788@agk.fab.redhat.com>
References: <20080313170928.p624q5xqo844kc0w@www.destar.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080313170928.p624q5xqo844kc0w@www.destar.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

As long as you're not using an old version of lvm2, use vgrename
with the uuid before a normal vgremove.

Alasdair
-- 
agk@redhat.com
