Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j31Hg9O14551
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 12:42:09 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j31Hg06g012221
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 12:42:03 -0500
Date: Fri, 1 Apr 2005 19:41:59 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Message-ID: <20050401174159.GB26517@percy.comedia.it>
References: <424CA0D1.5060905@nospam.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <424CA0D1.5060905@nospam.com>
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

On Fri, Apr 01, 2005 at 09:16:01AM +0800, Andy Sy wrote:
>Luca Berra wrote:
>
>> no, [lvm partition detection and activation] is a user space
>> task, there is no reason to burden the kernel with this.
>
>I find that a spurious argument.  The kernel autodetects physical
>partitions, so how is that different from detecting logical ones?
>>From the user's point of view he would want it to happen the
>same way.  In fact, given the flexibility and [purported] negligible
>overhead of logical volumes, he should not even be bothering
>with physical partitions anymore.

it adds unneded complexyty to the kernel.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
