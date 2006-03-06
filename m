Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k26E1U119990
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 09:01:30 -0500
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k26E1SBo006458
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 09:01:28 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id 4DCA71B8F
	for <linux-lvm@redhat.com>; Mon,  6 Mar 2006 09:01:22 -0500 (EST)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 11099-15 for <linux-lvm@redhat.com>;
	Mon,  6 Mar 2006 09:01:18 -0500 (EST)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id 8D8E61B8C
	for <linux-lvm@redhat.com>; Mon,  6 Mar 2006 09:01:18 -0500 (EST)
Message-ID: <440C40B8.3070906@volved.com>
Date: Mon, 06 Mar 2006 09:01:28 -0500
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 intergrated 'native' mirroring support ?
References: <6dcf0dbc0603050853s6f9ec709g8ca57083a8e8c7c5@mail.gmail.com>	<440B75C9.2000509@volved.com>
	<6dcf0dbc0603060536t2b124fccnd336f5cdeeb5637@mail.gmail.com>
In-Reply-To: <6dcf0dbc0603060536t2b124fccnd336f5cdeeb5637@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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

Apparently there are a couple of new developments regarding the mirror 
LVs you mention.

I found some interesting details from Redhat:

http://developer.osdl.org/dev/clusters/docs/cluster_summit_mirror_paper.pdf

http://www.redhat.com/archives/linux-lvm/2005-August/msg00107.html

Still in development currently, so the functionality is somewhat limited.

Hope those help - sorry for jumping the gun James.

-Barnaby



John Smith wrote:
> On 3/6/06, Barnaby Claydon <bclaydon@volved.com> wrote:
>   
>> Hi John,
>>
>> In short; No.
>>
>>     
> Alright, but... what's all this "use lvcreate -m to create mirror
> LV's" stuff I keep reading about in the mailing list about then ?
> Isn't that LVM2 integrated 'native' mirroring support ?
>
> What am I missing here ?
>
>
> Sincerely,
>
>
> John Smith.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
