Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LNAvrg013384
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 19:10:57 -0400
Received: from rattler.cajuninc.com
	(adsl-068-153-235-242.sip.shv.bellsouth.net [68.153.235.242])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LNAiXO018287
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 19:10:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by rattler.cajuninc.com (Postfix) with ESMTP id 1AAC0781D8
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 18:10:44 -0500 (CDT)
Received: from rattler.cajuninc.com ([127.0.0.1])
	by localhost (rattler.cajuninc.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id NQ6FchtJEljM for <linux-lvm@redhat.com>;
	Wed, 21 Apr 2010 18:10:43 -0500 (CDT)
Received: from rattler.cajuninc.com (unknown [10.10.11.1])
	by rattler.cajuninc.com (Postfix) with ESMTP id 518DD781D6
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 18:10:43 -0500 (CDT)
Message-ID: <4BCF85F3.9020804@cajuninc.com>
Date: Wed, 21 Apr 2010 18:10:43 -0500
From: "M.Lewis" <cajun@cajuninc.com>
MIME-Version: 1.0
References: <1271869246.10836.0@raydesk1.bettercgi.com>
In-Reply-To: <1271869246.10836.0@raydesk1.bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Migrating LVM
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

Ray Morris wrote:
>> Oops, my eyes missed the pipe and second dd when I made my previous
>> comments.  That is pretty good for different disks then yes... not
>> so good for same physical disk.
> 
>    Indeed my tests were done copying from the "old" disk
> to the "new" disk, as the OP is doing, I believe.
> 
>> I actually have some old hacked up dd code I made once to use 16
>> concurrent aio requests with O_DIRECT.  I need to clean it up a
>> bit but it showed great promise.
> 
>    Considering how often "dd" is used for copying large amounts
> of data, even a modest improvement could save many thousands of
> hours of admin time.  I would like to encourage you to do any
> needed cleanup and make it available, preferably integrated with
> GNU dd - it could save hundreds of thousands of dollars worth of
> time.
> -- 
> Ray Morris
> support@bettercgi.com

Thanks to all for the suggestions. I believe I will go the dd route. 
That seems like the best (simplest) option.

Thanks,
Mike
