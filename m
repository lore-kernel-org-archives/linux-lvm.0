Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4J5EcM9003201
	for <linux-lvm@redhat.com>; Fri, 19 May 2006 01:14:38 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4J5EaqE024413
	for <linux-lvm@redhat.com>; Fri, 19 May 2006 01:14:37 -0400
Date: Fri, 19 May 2006 07:14:35 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] "/boot" under LVM2 support in lilo or grub
Message-ID: <20060519051435.GB30625@percy.comedia.it>
References: <000001c679bb$6946ca10$640a0a0a@laptopoptimus>
	<000401c67ab4$6e188340$640a0a0a@laptopoptimus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000401c67ab4$6e188340$640a0a0a@laptopoptimus>
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

On Thu, May 18, 2006 at 03:51:17PM -0400, Greg Hartzog wrote:
>My thanks to everyone for answering.
>
> 
>
>>From the lilo author, I found that my choices are for "/boot" to either be
>on RAID-1 or to be under LVM.  But both are not allowed.
>
it depends on what you intend for raid1
the lilo device mapper patch only supports linear maps, so 
you cannot use it with dm-mirror.
but /boot over lvm over md always worked fine.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
