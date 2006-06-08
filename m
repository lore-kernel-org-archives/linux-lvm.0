Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58Jv0U0014076
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 15:57:00 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k58JupuB032587
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 15:56:52 -0400
Date: Thu, 8 Jun 2006 21:56:51 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Right way to resize LVM Volume on SAN?
Message-ID: <20060608195651.GF548@percy.comedia.it>
References: <4487E578.2060202@alienworld.org>
	<20060608094246.GA2775@redhat.com>
	<44882ED2.4050806@alienworld.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44882ED2.4050806@alienworld.org>
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

On Thu, Jun 08, 2006 at 04:06:10PM +0200, Alen Salamun wrote:
>Thank you. I read that already. And since it only says:
>
>"Expand the PV on /dev/sda1 AFTER enlarging the partition with fdisk"
>
>my question is related on part of enlarging partition with fdisk. Do I 
>have to do it in described way (delete, create new with extended last 
>sector) to preserve data or is there any other "less destructive 
>look-a-like" way?

sfdisk for backing up your partition table
parted to resize

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
