Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA2E2Lr31189
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 09:02:21 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA2E2HFk021260
	for <linux-lvm@redhat.com>; Tue, 2 Nov 2004 09:02:17 -0500
Date: Tue, 2 Nov 2004 15:02:11 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Linux RAID Resync and LVM
Message-ID: <20041102140210.GD10845@percy.comedia.it>
References: <20041102122603.GA12325@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041102122603.GA12325@bdmcc-us.com>
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

On Tue, Nov 02, 2004 at 07:26:03AM -0500, Brian McCullough wrote:
>Is there any way ( what is the procedure ) to "pause" the resync ( yes I
>know that this is a BAD idea, but it is currently forecast to take
>another 12 - 18 hours ) so that I can either restart or resume it in a
>day or two when the deadline has passed?
slow it, reduce the numbers in:
/proc/sys/dev/raid/speed_limit_max
/proc/sys/dev/raid/speed_limit_min

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
