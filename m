Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jA4JGhm1012750
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 19:16:43 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EY73L-0007bX-6J
	for linux-lvm@redhat.com; Fri, 04 Nov 2005 19:16:43 +0000
Date: Fri, 4 Nov 2005 19:16:43 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvcreate on a dmraid device
Message-ID: <20051104191643.GT26394@agk.surrey.redhat.com>
References: <200511042005.17392.Dan.Johansson@dmj.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200511042005.17392.Dan.Johansson@dmj.nu>
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

On Fri, Nov 04, 2005 at 08:05:08PM +0100, Dan Johansson wrote:
> # pvcreate /dev/mapper/pdc_edcfibbf4
>   Device /dev/mapper/pdc_edcfibbf4 not found.
 
Look for (commented out) types line in lvm.conf
and enable it saying:
  types = [ "device-mapper", 1 ]

(This will happen by default in the next release.)

Alasdair
-- 
agk@redhat.com
