Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1SHosK16851
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 12:50:54 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.199])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1SHonBO010320
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 12:50:49 -0500
Received: by rproxy.gmail.com with SMTP id j1so915258rnf
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 09:50:48 -0800 (PST)
Message-ID: <dff3752705022809504cadf1fc@mail.gmail.com>
Date: Mon, 28 Feb 2005 12:50:48 -0500
From: Kristina Clair <kclair@gmail.com>
In-Reply-To: <dff3752705022809087fe560f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <dff3752705022809087fe560f3@mail.gmail.com>
Subject: [linux-lvm] lvremove locked up
Reply-To: Kristina Clair <kclair@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, dm-devel@redhat.com

Hi All,

Today I had a first:  I was using lvremove to remove a snapshot, and
lvremove locked up trying to suspend the filesystem.  Between the time
when I made the snapshot and when I ran lvremove, we copied about 87G
of data over to the drive.  Is it possible that that was just too much
change for snapshots to deal with?

Mostly what I'm concerned about is that we were using snapshots
successfully up to this point, albeit conservatively.   Should I
consider this a fluke due to this one-time addition of so much data,
or should I expect this to happen again now that the volume has so
much data on it?

Thanks,
Kristina
