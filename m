Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j1DGpGMR015257
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2005 16:51:16 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1D0Mxo-0001uN-K7
	for linux-lvm@redhat.com; Sun, 13 Feb 2005 16:51:16 +0000
Date: Sun, 13 Feb 2005 16:51:16 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM-Snapshot + dm_crypt
Message-ID: <20050213165116.GP14093@agk.surrey.redhat.com>
References: <420F83CB.5040008@web.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <420F83CB.5040008@web.de>
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

On Sun, Feb 13, 2005 at 05:43:55PM +0100, Torben Viets wrote:
> How can I make a snapshot of a dm_crypt device?
 
If you've not put data on it yet:
  pvcreate on the device
  vgcreate
  lvcreate
  mkfs
  put your data onto it
  lvcreate -s

But you have, you'd have to use 'dmsetup' to do the snapshot by hand
and it's tricky.

Alasdair
-- 
agk@redhat.com
