Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t945wZvA010502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 4 Oct 2015 01:58:35 -0400
Received: from stodi.digitalkingdom.org (mail.digitalkingdom.org
	[173.13.139.236]) by mx1.redhat.com (Postfix) with ESMTPS id B29287A
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2015 05:58:34 +0000 (UTC)
Received: from rlpowell by stodi.digitalkingdom.org with local (Exim 4.85)
	(envelope-from <rlpowell@digitalkingdom.org>) id 1ZicJd-0001xI-OO
	for linux-lvm@redhat.com; Sat, 03 Oct 2015 22:58:33 -0700
Date: Sat, 3 Oct 2015 22:58:33 -0700
From: Robin Lee Powell <rlpowell@digitalkingdom.org>
Message-ID: <20151004055833.GG9081@stodi.digitalkingdom.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: Re: [linux-lvm] Uncache a LV when a cache PV is gone, bug ?
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

(I'm not on this list, so I can't properly followup to the thread in
question, which is at
https://www.redhat.com/archives/linux-lvm/2015-August/msg00008.html
, but: )

I have a not-great-but-it'll-do workaround for the issue of trying
to un-cached an LV.  It's at https://www.dropbox.com/sh/bvyy92wwoe8rcse/AADbgbklYGqrPoWUsLogmavha/computers/stripping_away_lvmcache.txt?dl=0

Just thought I'd share for future searchers.

-Robin
