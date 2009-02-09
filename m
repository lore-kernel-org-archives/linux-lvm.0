Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19GW3M7015501
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 11:32:04 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n19GW04W009320
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 11:32:00 -0500
Message-ID: <49905A90.2000802@redhat.com>
Date: Mon, 09 Feb 2009 16:32:16 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Problems running my home-built LVM2
References: <jwvzlgzlh6o.fsf-monnier+gmane.linux.lvm.general@gnu.org>	<498EE80D.3090307@redhat.com>
	<jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
In-Reply-To: <jwvprhrinmg.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Stefan Monnier wrote:
>>> I'm trying to use LVM2 on a small MIPS machine.  This machine uses
>>> uClibc-0.9.29 with Linux-2.6.25.20 and has limited RAM and CPU power,
>>> but does come with a 1TB drive which I'd rather manage with LVM.
> 
>>> I had no particular problems building the latest version of LVM2
>>> for it.  And as far as I can tell, it's not fully broken,
>>> but it's unusable: every run of `lvm' gives different results.
>>> E.g. `lvm pvs' sometimes gives the expected output, sometimes lists
>>> nothing at all, sometimes complains about missing volume groups,
>>> sometimes "Incorrect metadata area header checksum" [as mentioned in an
>>> earlier message on this list, incidentally].
> 
>> I guess that using uClibc is the problem.
> 
> It sounds like a likely culprit, indeed.  But Googling indicates that
> LVM2 has been compiled and used with uClibc for initramfs purposes so it
> should work fine.  Tho maybe the problem is that those references I see

AFAIK, nobody is testing this regularly, especially not for the latest 
releases. Also many (most?) distributions are now shipping an 
initramfs with a full glibc environment so this use is becoming less 
common.

Regards,
Bryn.
