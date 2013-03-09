Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r29I456J027046
	for <linux-lvm@redhat.com>; Sat, 9 Mar 2013 13:04:05 -0500
Received: from mail-gh0-f171.google.com (mail-gh0-f171.google.com
	[209.85.160.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r29I44au002220
	for <linux-lvm@redhat.com>; Sat, 9 Mar 2013 13:04:04 -0500
Received: by mail-gh0-f171.google.com with SMTP id r17so437046ghr.30
	for <linux-lvm@redhat.com>; Sat, 09 Mar 2013 10:04:04 -0800 (PST)
Message-ID: <513B7992.6050308@ubuntu.com>
Date: Sat, 09 Mar 2013 13:04:02 -0500
From: Phillip Susi <phillsusi@gmail.com>
MIME-Version: 1.0
References: <511BB48A.3010009@ubuntu.com> <511C33AF.7020506@shiftmail.org>
In-Reply-To: <511C33AF.7020506@shiftmail.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove doesn't work the way the man page says
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Spelic <spelic@shiftmail.org>

Please use reply-to-all on public mailing lists; I did not see there had 
been any replies until now because I was not Cc'd.

On 02/13/2013 07:45 PM, Spelic wrote:
> breaking it up in smaller subsegments would probably have been wiser,
> except that you risk to induce fragmentation if other LVM operations
> happen during the move.

There's no risk of fragmentation because you still allocate the whole 
thing at once, you just set it up as (linear, mirror, linear) instead of 
one big mirror, and the mirror portion slides over when synced.
