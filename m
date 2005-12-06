Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jB613wOo002865
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 01:03:58 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EjRFO-0001YY-4L
	for linux-lvm@redhat.com; Tue, 06 Dec 2005 01:03:58 +0000
Date: Tue, 6 Dec 2005 01:03:58 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Which size for snapshot volume for a *safe* backup?
Message-ID: <20051206010357.GF3647@agk.surrey.redhat.com>
References: <20051205223911.GE3123@mjk.myfqdn.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051205223911.GE3123@mjk.myfqdn.de>
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

On Mon, Dec 05, 2005 at 11:39:11PM +0100, Marc-Jano Knopp wrote:
>   But for files smaller than that (like 512 bytes), it erronously
>   prints:
> 
>     Device /dev/loop/0 not found

Maybe should be changed to:
  Device /dev/loop/0 not found (or ignored by filters).

Tiny devices are filtered out at a low level in the code as
it is never valid for lvm2 to scan them to see if they
are PVs.

This was added for devices with extended partitions.
# blockdev --getsize /dev/hda4
2
 
Alasdair
-- 
agk@redhat.com
