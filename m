Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3S9tWv09705
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 05:55:32 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3S9tU99019993
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 05:55:30 -0400
Date: Wed, 28 Apr 2004 11:04:44 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Duplicated PV
Message-ID: <20040428090443.GB2910@percy.comedia.it>
References: <69596D9C5887874E9A35F6C8DF94B2AB166867@nautilus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69596D9C5887874E9A35F6C8DF94B2AB166867@nautilus>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Apr 28, 2004 at 03:45:46PM +0800, Victor Tan wrote:
>Hi!
> 
>Any idea how can I solve the "Found duplicated PV xxxxxxxxxxxx:using /dev/nbd0 not /dev/sda"?
> 
>Thanks in advance!
>Victor
>
using device filters in /etc/lvm/lvm.conf?
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
