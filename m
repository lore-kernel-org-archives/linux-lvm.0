Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iAENLQjY011575
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 23:21:26 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CTTgU-00025P-TB
	for linux-lvm@redhat.com; Sun, 14 Nov 2004 23:21:26 +0000
Date: Sun, 14 Nov 2004 23:21:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] recover lost VG (VG data differs between PVs)
Message-ID: <20041114232126.GH24229@agk.surrey.redhat.com>
References: <20041114225853.GB20425@hotwire.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041114225853.GB20425@hotwire.nl>
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

On Sun, Nov 14, 2004 at 11:58:53PM +0100, Jelle Herold wrote:
>  VG data differs between PVs /dev/hde and /dev/hdf3
>  Volume group "datavg" doesn't exist
 
So hde should be in the VG at the moment, but not hdf3?
Add a filter to lvm.conf so lvm only looks at hde.
Run vgscan and see check if things look OK
eg vgcfgbackup and read the text backup file.
If things *are* OK like that, then pvremove hdf3,
remove the filter & vgscan.

Alasdair
-- 
agk@redhat.com
