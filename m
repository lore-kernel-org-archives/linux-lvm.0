Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lB6D78cO019939
	for <linux-lvm@redhat.com>; Thu, 6 Dec 2007 08:07:08 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1J0GRY-0002U3-TG
	for linux-lvm@redhat.com; Thu, 06 Dec 2007 13:07:08 +0000
Date: Thu, 6 Dec 2007 13:07:08 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] DM devices
Message-ID: <20071206130708.GZ22843@agk.fab.redhat.com>
References: <5485940d0712060452p671fb716yc1c0df4aa14b611f@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5485940d0712060452p671fb716yc1c0df4aa14b611f@mail.gmail.com>
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

On Thu, Dec 06, 2007 at 12:52:54PM +0000, C'est Pierre wrote:
> Could someone tell me what exactly are these dm-1 through dm-N devices?
 
Internal kernel names for the devices.
With current kernels, -N is the minor number, but that may change in future
(if we use more than one major number).

dmsetup info -j 253 -m 1

(for dm-1 if the dm major number is 253)

Alasdair
-- 
agk@redhat.com
