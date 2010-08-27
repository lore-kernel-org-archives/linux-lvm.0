Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7RJChck015704
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2010 15:12:43 -0400
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7RJCURS024526
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2010 15:12:31 -0400
Received: from IWDUBCORMSG002.sci.local (iwdubcormsg002.sci.local
	[10.105.142.32])
	by boamail1.stercomm.com (Postfix) with ESMTP id 4CDDF33B01
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2010 15:12:30 -0400 (EDT)
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <AANLkTin5W9M=g9Mjn9xGVxA1QErCsbXzYfc8Qswainhn@mail.gmail.com>
References: <AANLkTin5W9M=g9Mjn9xGVxA1QErCsbXzYfc8Qswainhn@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Date: Fri, 27 Aug 2010 14:12:28 -0500
Message-Id: <1282936348.21816.154.camel@geeko>
Mime-Version: 1.0
Subject: Re: [linux-lvm] lvm versus Veritas VxVM?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2010-08-27 at 14:47 -0400, Jon Price wrote:
>  
> Hi,
>  
> How does lvm compare to Veritas VxVM?

IMHO, the toolset with lvm2 is simpler to understand.


And of course, lvm2 is free!!!!

With that said, I haven't tried clvm... I've only done clustering using
VxVM.  Also, VxVM has PLATFORM LIMITATIONS... so it's not supported as
well as lvm2 which is almost everywhere (Linux wise).
