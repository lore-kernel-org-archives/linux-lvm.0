Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5N0Uru08044
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 20:30:53 -0400
Received: from twinlark.arctic.org (twinlark.arctic.org [207.7.145.18])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5N0UpN6010816
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 20:30:52 -0400
Date: Wed, 22 Jun 2005 17:30:49 -0700 (PDT)
From: dean gaudet <dean@arctic.org>
Subject: Re: [linux-lvm] lvextend
In-Reply-To: <200506221716.00221.t-rigby@shaw.ca>
Message-ID: <Pine.LNX.4.62.0506221728580.12395@twinlark.arctic.org>
References: <200506221716.00221.t-rigby@shaw.ca>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

you could do "pvdisplay /dev/hde" to find the number of extents... then 
use "lvextend -l" instead of -L ...

-dean

On Wed, 22 Jun 2005, Terry Rigby wrote:

> I am trying to add a full hard drive to my LV by following the directions at 
> TLDP.org.  It says there to use lvextend -L +XXG where XX is the size in GB 
> you want to add to the LV.  Is there a more simple way to just add a whole 
> hard drive ie: /dev/hde
> 
> It seems like a pain to have to manually figure out the size of the hard drive 
> then add it using lvextend -L +200GB for a 200GB hard drive especially since 
> we all know its not actually 200GB.
> 
> Thanks for your response.
> 
> Terry Rigby
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
