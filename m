Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9TJ71oo030385
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 14:07:01 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9TJ6xHi008606
	for <linux-lvm@redhat.com>; Sun, 29 Oct 2006 14:06:59 -0500
Date: Sun, 29 Oct 2006 20:06:57 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Lost partition table --> Lost 4th PV partition on
	disk - how to find the partition bounderies
Message-ID: <20061029190656.GA15587@percy.comedia.it>
References: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
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
To: linux-lvm@redhat.com

On Sun, Oct 29, 2006 at 12:46:15PM +0100, gklima@cosy.sbg.ac.at wrote:
>Hi!
>
>I've a laptop with root lvm2 and lost my partitioning table (all zeros).
>But the data on the disk (4th partition) should be fine since I've only
>messed with the primary patition table.
i had some success in the past with
http://www.cgsecurity.org/wiki/TestDisk

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
