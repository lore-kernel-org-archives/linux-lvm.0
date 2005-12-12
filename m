Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBCIi8BM032742
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 18:44:08 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Elsee-0003Nu-2z
	for linux-lvm@redhat.com; Mon, 12 Dec 2005 18:44:08 +0000
Date: Mon, 12 Dec 2005 18:44:08 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm1 to lvm2 upgrade failed: confused on pv between
	sda1 and md5
Message-ID: <20051212184408.GD25866@agk.surrey.redhat.com>
References: <20051212182045.GA30998@merlins.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051212182045.GA30998@merlins.org>
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

Hi Marc,

On Mon, Dec 12, 2005 at 10:20:45AM -0800, Marc MERLIN wrote:
>   LVM version:     2.01.04 (2005-02-09)

There have been many bug fixes since that release.

First of all, try the last 2.01.* release (2.01.15) and see 
whether that fixes it.

>   Library version: 1.01.00-ioctl (2005-01-17)

Also suggest updating device-mapper to 1.01.05.

Check that you have in lvm.conf devices section:
  md_component_detection = 1 
(i.e. not = 0)

If you edit lvm.conf, run 'vgscan' afterwards.

If things still don't work, check your metadata backups
and archives in /etc/lvm and see if they show the LV
disappearing.  If you want me to investigate, tar up that 
directory and email it to me.

Alasdair
-- 
agk@redhat.com
