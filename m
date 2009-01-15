Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0F5CFVe029765
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 00:12:15 -0500
Received: from blu0-omc3-s36.blu0.hotmail.com (blu0-omc3-s36.blu0.hotmail.com
	[65.55.116.111])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0F5BuxC018788
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 00:11:57 -0500
Message-ID: <BLU117-W79642B8D450FB4DA68AF6FAD70@phx.gbl>
From: Bob Smith <simon_seys@hotmail.com>
Subject: RE: [linux-lvm] Can no longer mount logical volume after a kernal
	panic. HELP!
Date: Thu, 15 Jan 2009 00:11:56 -0500
In-Reply-To: <BLU117-W51CBAE0430A271DF3DC52FFAD70@phx.gbl>
References: <BLU117-W51CBAE0430A271DF3DC52FFAD70@phx.gbl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@redhat.com



I figured out my own problem so I am posting the 'solution' back to the list so that it might help someone else.

I noticed when booting my system was complaining about not being able to run fsck.jfs.  So since I run Ubuntu Hardy I installed the jfsutils using apt-get install jfsutils.  Then I rebooted again and it fsck'ed the jfs partition on my LVM VG and eveything mounted as per usual.  

Whew.

Simon

----------------------------------------
> From: simon_seys@hotmail.com
> To: linux-lvm@redhat.com
> Date: Wed, 14 Jan 2009 22:55:30 -0500
> Subject: [linux-lvm] Can no longer mount logical volume after a kernal panic. HELP!


_________________________________________________________________
