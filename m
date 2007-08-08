Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l78EZAtE026205
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 10:35:10 -0400
Received: from sender-02.it.helsinki.fi (sender-02.it.helsinki.fi
	[128.214.205.137])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l78EZ0Tw015826
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 10:35:00 -0400
Received: from widch.it.helsinki.fi (widch.it.helsinki.fi [128.214.0.47])
	by sender-02.it.helsinki.fi (8.13.8/8.13.8) with ESMTP id
	l78EYsm9013802
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 17:34:54 +0300
Received: from trkr by widch.it.helsinki.fi with local (Exim 4.63)
	(envelope-from <janne.peltonen@helsinki.fi>) id 1IImcg-000410-HI
	for linux-lvm@redhat.com; Wed, 08 Aug 2007 17:34:54 +0300
Date: Wed, 8 Aug 2007 17:34:54 +0300
From: Janne Peltonen <janne.peltonen@helsinki.fi>
Message-ID: <20070808143454.GE12798@helsinki.fi>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Trouble pvmoving lv's out of a metadatacopies=0 pv
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

Hi!

If I try to pvmove lv's out of a pv I created using the metadatacopies 0
option, pvmove concludes that the source physical volume is not in a
volume group and refuses to commence with the move.

Any ideas? Thanks.


--Janne Peltonen
Univ. of Helsinki
-- 
Janne Peltonen <janne.peltonen@helsinki.fi>
