Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MGlNLJ007528
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:47:23 -0400
Received: from pretender.frop.net (pretender.frop.net [70.85.16.90])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MGlDf6006653
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:47:13 -0400
Date: Tue, 22 Apr 2008 12:47:12 -0400
From: dave@frop.net
Subject: Re: [linux-lvm] Snapshot question...
Message-ID: <20080422164712.GA22544@pretender.frop.net>
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<480E121A.7020100@Media-Brokers.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <480E121A.7020100@Media-Brokers.com>
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

> Seriously... if the snapshot volume that I'm creating is a front end to 
> BOTH, when I back it up, I guess LVM just 'knows' that I mean to backup 
> the 'original'?

The snapshot *looks like* a copy of the original volume for all intents and purposes.  You can ignore the fact that it really only saves the difference between the two volumes.  As far as you are concerned, the snapshot is identical to the volume it was created from at the time of the snapshot.  

All the COW stuff happens behind the scenes.  LVM knows which blocks to get from the origin, and which blocks to get from the snapshot, because it knows which blocks have changed since the snapshot was created.

if you want to get more confused check out this google image search
http://images.google.com/images?hl=en&q=copy+on+write&btnG=Search+Images&gbv=2
