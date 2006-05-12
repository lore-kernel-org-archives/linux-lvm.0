Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CGPtTf007658
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 12:25:55 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4CGPmFw010219
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 12:25:48 -0400
Date: Fri, 12 May 2006 18:25:47 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Can't reduce lvm2 volume. I get "Volume group mapper
	doesn't exist"
Message-ID: <20060512162547.GD2974@percy.comedia.it>
References: <1147450728.8248.127.camel@morpheus.ucc.ie>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1147450728.8248.127.camel@morpheus.ucc.ie>
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

On Fri, May 12, 2006 at 05:18:48PM +0100, Marcus Claesson wrote:
>I want to shrink /dev/mapper/Volume00-LogVol02 from 97G to 20G, and this
>is what I tried.
>
the lv is called /dev/Volume00/LogVol02

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
