Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5ELGZu18711
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2005 17:16:35 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5ELGVOB006958
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2005 17:16:32 -0400
Date: Tue, 14 Jun 2005 23:16:25 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM+Raid1 disappeared
Message-ID: <20050614211625.GA16441@percy.comedia.it>
References: <873brlg9jk.wl%rjmx@rjmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <873brlg9jk.wl%rjmx@rjmx.net>
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

On Mon, Jun 13, 2005 at 06:46:07PM -0400, Ron Murray wrote:
>and mdadm --examine /dev/md0 gets me:
>  mdadm: /dev/md0 is too small for md
>
try to understand why md0 is not started at boot.
do you have a (non empty) /etc/mdadm.conf file?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
