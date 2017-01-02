Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02JLeR0023266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 2 Jan 2017 14:21:40 -0500
Received: from mail.knebb.de (mail.knebb.de [85.25.100.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AFB34E4C4
	for <linux-lvm@redhat.com>; Mon,  2 Jan 2017 19:21:39 +0000 (UTC)
Received: from [192.168.0.229] (p5DE005BF.dip0.t-ipconnect.de [93.224.5.191])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: cvoelker)
	by mail.knebb.de (Postfix) with ESMTPSA id 6D8B49C01F1
	for <linux-lvm@redhat.com>; Mon,  2 Jan 2017 20:21:41 +0100 (CET)
References: <45f36905-feee-8fdf-8545-05d4937a95c1@knebb.de>
	<71b437e8-4aca-0b97-ebab-ee577418db94@redhat.com>
From: knebb@knebb.de
Message-ID: <d33f570c-5ea4-5cdc-1737-931252b8ea5c@knebb.de>
Date: Mon, 2 Jan 2017 20:20:54 +0100
MIME-Version: 1.0
In-Reply-To: <71b437e8-4aca-0b97-ebab-ee577418db94@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM filter ignored?
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
To: linux-lvm@redhat.com

Hi,


>> So I tried:
>> filter = [ "r|sdb.*/|","a|drbd0/|","a|.*/|" ]
>>
>
> Just check the 'comment' for filters in lvm.conf -
> there is stated you should NOT mix  'r' & 'a' together
> (there is even no need for this in 99.9999%)
>
Well....it writes "be careful mixing" but in the examples mixing is
shown. Appeared not to be soooo important.

> - either use plain list of rejects  'r'
> - or set 'white-list' with all 'a'  finished with 'r .*'
>
> To to be exact in your case:
>
> Use just:    [ "r|/dev/sdb|" ]
>
I set this not as you recommended and indeed it appears to be working,
Thanks, even I do not have a clue what I did wrong as I remember I had
it this way. But I moght be wrong as it did not work as I configured it.

Thanks a lot, looks great now!

/CHRISTIAN
