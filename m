Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j16KOfwq003545
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 20:24:41 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CxsxV-00062P-0G
	for linux-lvm@redhat.com; Sun, 06 Feb 2005 20:24:41 +0000
Date: Sun, 6 Feb 2005 20:24:40 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Reducing PV/ Reclaiming free PEs from a PV to be used
	for another partition/purpose outside of LVM
Message-ID: <20050206202440.GI14093@agk.surrey.redhat.com>
References: <1107720948.6351.214448095@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1107720948.6351.214448095@webmail.messagingengine.com>
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

On Sun, Feb 06, 2005 at 12:15:48PM -0800, Ajeet Nankani wrote:
> vgcfgbackup which would give me meta file data as below 
 
>         extent_size = 65536             # 32 Megabytes

>                         device = "/dev/hda6"    # Hint only
 
>                         pe_start = 384
>                         pe_count = 266  # 8.3125 Gigabytes

>                                 extent_count = 192      # 6 Gigabytes
>                                         "pv0", 0

0-191

>                                 extent_count = 32       # 1024 Megabytes
>                                         "pv0", 192

192-223

> Now here if i edit it and in physical volume section where it says that
> pe_count = 266, i change it to pe_count = 224 which is the last PE used
> by the Logical Volume.
 
Yes.

> after saving it if i run vgcfgrestore with this file, will my PV be
> reduced?? 

That's what pvresize would do.

> after that i can reduce hda6 with parted or similar utility.
 
and the new size is 384 sectors plus 224 extents of 65536 sectors each.

Alasdair
-- 
agk@redhat.com
