Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iAFEFAvZ001773
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 14:15:10 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CThdO-0002eb-CL
	for linux-lvm@redhat.com; Mon, 15 Nov 2004 14:15:10 +0000
Date: Mon, 15 Nov 2004 14:15:10 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] recover lost VG (VG data differs between PVs)
Message-ID: <20041115141510.GI24229@agk.surrey.redhat.com>
References: <20041114225853.GB20425@hotwire.nl>
	<20041114232126.GH24229@agk.surrey.redhat.com>
	<20041115102400.GA19918@hotwire.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041115102400.GA19918@hotwire.nl>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 15, 2004 at 11:24:00AM +0100, Jelle Herold wrote:
> Just a question out of curiosity, what does "VG data differs..." mean,
LVM2 checks its metadata is consistent on disk every time you access
a VG.   LVM1 caches its metadata and has less-stringent checks.

That message means it found an anomaly that it couldn't
fix - the metadata on 3 of your devices formed a consistent VG
after you restored the backup, but the metadata on the 4th device hdf3 
still said it was part of the VG.

Filtering tells LVM2 to ignore hdf3 completely, then
pvremove hdf3 wipes LVM metadata from it.

Alasdair
-- 
agk@redhat.com
