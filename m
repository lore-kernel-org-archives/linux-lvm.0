Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2DDSjtq015971
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 09:28:45 -0400
Received: from sender-02.it.helsinki.fi (sender-02.it.helsinki.fi
	[128.214.205.137])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2DDSCEL017288
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 09:28:13 -0400
Received: from widch.it.helsinki.fi (widch.it.helsinki.fi [128.214.0.47])
	by sender-02.it.helsinki.fi (8.13.8/8.13.8) with ESMTP id
	m2DDS6gj028219
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 15:28:07 +0200
Received: from trkr by widch.it.helsinki.fi with local (Exim 4.63)
	(envelope-from <janne.peltonen@helsinki.fi>) id 1JZnTa-0003Vy-Uh
	for linux-lvm@redhat.com; Thu, 13 Mar 2008 15:28:06 +0200
Date: Thu, 13 Mar 2008 15:28:06 +0200
From: Janne Peltonen <janne.peltonen@helsinki.fi>
Subject: Re: [linux-lvm] Trouble pvmoving lv's out of a metadatacopies=0 pv
Message-ID: <20080313132806.GA25620@helsinki.fi>
References: <20070808143454.GE12798@helsinki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070808143454.GE12798@helsinki.fi>
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

Hi.

On Wed, Aug 08, 2007 at 05:34:54PM +0300, Janne Peltonen wrote:
> If I try to pvmove lv's out of a pv I created using the metadatacopies 0
> option, pvmove concludes that the source physical volume is not in a
> volume group and refuses to commence with the move.

Is there really no way around this bug? It's a bit annoying to have 28
physical volumes more than I actually need... This being a production
system, I haven't (at least yet) wanted to take the system off line for
as long as it'd take to sync the contents of the lv into another lv.
(After which I could run my app on the new lvs and remove the old lvs
and the old pvs.)

(See bug #252150 in bugzilla.redhat.com. I submitted the bug report last
August, but this doesn't appear to be a trivial bug to squash - so I'm
asking here for ways to work around it.)

Thanks for any ideas.


--Janne Peltonen
Univ. of Helsinki
-- 
Janne Peltonen <janne.peltonen@helsinki.fi>
