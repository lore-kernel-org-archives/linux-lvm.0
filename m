Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2DDi12S026676
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 09:44:01 -0400
Received: from sender-01.it.helsinki.fi (sender-01.it.helsinki.fi
	[128.214.205.139])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2DDhSYT029872
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 09:43:29 -0400
Received: from widch.it.helsinki.fi (widch.it.helsinki.fi [128.214.0.47])
	by sender-01.it.helsinki.fi (8.13.8/8.13.8) with ESMTP id
	m2DDhMWk025037
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 15:43:23 +0200
Received: from trkr by widch.it.helsinki.fi with local (Exim 4.63)
	(envelope-from <janne.peltonen@helsinki.fi>) id 1JZniN-0003vN-07
	for linux-lvm@redhat.com; Thu, 13 Mar 2008 15:43:23 +0200
Date: Thu, 13 Mar 2008 15:43:22 +0200
From: Janne Peltonen <janne.peltonen@helsinki.fi>
Subject: Re: [linux-lvm] Trouble pvmoving lv's out of a metadatacopies=0 pv
Message-ID: <20080313134322.GB25620@helsinki.fi>
References: <20070808143454.GE12798@helsinki.fi>
	<20080313132806.GA25620@helsinki.fi>
	<20080313133919.GW1788@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080313133919.GW1788@agk.fab.redhat.com>
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
To: linux-lvm@redhat.com

On Thu, Mar 13, 2008 at 01:39:19PM +0000, Alasdair G Kergon wrote:
> On Thu, Mar 13, 2008 at 03:28:06PM +0200, Janne Peltonen wrote:
> > On Wed, Aug 08, 2007 at 05:34:54PM +0300, Janne Peltonen wrote:
> > (See bug #252150 in bugzilla.redhat.com. I submitted the bug report last
> > August, but this doesn't appear to be a trivial bug to squash - so I'm
> > asking here for ways to work around it.)
>  
> You'll see that bug was fixed in lvm2-2.02.30-1.el5 and so the fix will be
> included in 5.2, which is currently going through its testing phases.

Oh! I'm sorry. I took the comment #8 to mean that the bug is still
present in lvm2-2.02.30-1.el5.

Thanks for clarifying things. :)


--Janne
-- 
Janne Peltonen <janne.peltonen@helsinki.fi>
