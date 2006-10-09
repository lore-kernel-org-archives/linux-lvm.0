Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k99LlFvW015731
	for <linux-lvm@redhat.com>; Mon, 9 Oct 2006 17:47:15 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <20061009185806.GA29486@cobalt0.panici.net>
References: <20061009185806.GA29486@cobalt0.panici.net>
Message-Id: <bae4416f49c8a46ad4f2b5232fec1986@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] LV open but not mounted ?
Date: Mon, 9 Oct 2006 16:49:35 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hmmm, I can see where it might be 'active', but if it's not in use, it 
shouldn't be open.

Some sub-lvs are marked as 'open', because they are used by the main LV 
(such is the case with mirroring and snapshots).

Have you tried 'lsof <path to LV>' ?

  brassow

On Oct 9, 2006, at 1:58 PM, paddy wrote:

>
> I just noticed that I have a system where an LV appears to be open
> (as given by lvs), but I can't see it mounted anywhere, or opened
> by any process.
>
> Any insights, suggestions, explanations, etc gratefully received :-)
>
> Regards,
> Paddy
> -- 
> Perl 6 will give you the big knob. -- Larry Wall
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
