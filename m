Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i8ODpOck026720
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 09:51:25 -0400
Sender: alewis@redhat.com
Subject: Re: [linux-lvm] How to tell if a logical volume is striped
References: <mailman.3018.1096000472.3231.linux-lvm@redhat.com>
From: AJ Lewis <alewis@redhat.com>
Date: 24 Sep 2004 08:51:24 -0500
In-Reply-To: <mailman.3018.1096000472.3231.linux-lvm@redhat.com>
Message-ID: <x05y8izdbc3.fsf@null.msp.redhat.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

lemons_terry@emc.com writes:

> How can I tell if a logical volume is striped?  'lvdisplay' doesn't seem to
> show this, even in V2.

'lvs --segments' should show you (lvs is only available in lvm2 - you
might need to run 'lvm lvs --segments' depending on how lvm2 is installed...

regards,
-- 
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414
   
Current GPG fingerprint = D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
