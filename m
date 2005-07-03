Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j63M9CV06974
	for <linux-lvm@redhat.com>; Sun, 3 Jul 2005 18:09:12 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j63M9A7b002456
	for <linux-lvm@redhat.com>; Sun, 3 Jul 2005 18:09:11 -0400
Date: Mon, 4 Jul 2005 00:09:00 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] (no subject)
Message-ID: <20050703220859.GA11388@percy.comedia.it>
References: <1120417012l.9327l.0l@tangerine>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1120417012l.9327l.0l@tangerine>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM Discussions <linux-lvm@redhat.com>

On Sun, Jul 03, 2005 at 06:56:45PM +0000, Jean-Luc Coulon (f5ibh) wrote:
>Hi,
>
>Is there a safe way to convert from a working LVM (with root on LVM) to  
>a software RAID1 including the device where is the existing LVM ?
>
>Regards
>
>Jean-Luc

create a degraded raid1 array with only the other disk

add the new md to the existing vg

pvmove all lv on the new pv

remove the old (now empty pv)

use dd to make it forget it was a pv

hotadd this disk to the array

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
