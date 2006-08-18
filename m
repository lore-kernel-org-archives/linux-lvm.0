Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7I84lg7007420
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 04:04:47 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7I84dT8001636
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 04:04:39 -0400
Date: Fri, 18 Aug 2006 10:04:36 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] how to learn number of stripes on logical volume?
Message-ID: <20060818080435.GB24653@percy.comedia.it>
References: <20060817201917.1EF8E1EB6B8@labrador.eecs.harvard.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060817201917.1EF8E1EB6B8@labrador.eecs.harvard.edu>
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

On Thu, Aug 17, 2006 at 04:19:17PM -0400, Norman Ramsey wrote:
>I'm using LVM2 under Debian.  I have a logical volume 
>created by the Debian installer, and I'd like to know if it
>is striped.  How can I find out?
>
>I tried 'lvdisplay -v' and 'vgdisplay -v', but neither
>shows the number of stripes on a logical volume (I tried
>with a newly created LV with two stripes, but the information
>is not shown).

try 'lvdisplay -vm'

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
