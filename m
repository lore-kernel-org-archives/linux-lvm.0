Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4AH3MeA009553
	for <linux-lvm@redhat.com>; Sun, 10 May 2009 13:03:22 -0400
Received: from mail.brunson.com (www.brunson.com [72.249.20.185])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n4AH35df031396
	for <linux-lvm@redhat.com>; Sun, 10 May 2009 13:03:05 -0400
Received: from foxtrot.brunson.com (c-76-120-85-88.hsd1.co.comcast.net
	[76.120.85.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.brunson.com (Postfix) with ESMTP id C3FB86C387
	for <linux-lvm@redhat.com>; Sun, 10 May 2009 11:03:04 -0600 (MDT)
Message-ID: <4A0708C7.70504@brunson.com>
Date: Sun, 10 May 2009 11:03:03 -0600
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Script to import hardware snapshoted VGs
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>	<20090508205312.GA7838@redhat.com>
	<164519.90166.qm@web87105.mail.ird.yahoo.com>
In-Reply-To: <164519.90166.qm@web87105.mail.ird.yahoo.com>
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

On 05/09/2009 01:34 PM, chris procter wrote:
>
>> I actually worked on such a script a little over a month ago but haven't
>> had a chance to get back to it.  I've reviewed your script and have
>> inlined some comments/suggestions below.
>>      
>
> Thanks a lot :)
>
> Most of your suggestions are pretty straightforward and I'll put them in, but the PV name problem is nasty, sorting out my script to deal with them is doable, but there is an issue with setting lvm.conf to filter devices called /dev/$*^  would really upset the regular expression parser. I'm tempted to say that people who call their devices things like that deserve everything they get,

http://xkcd.com/327/

:-)

>   but maybe symlinking them to a sensible name (e.g $TMP_LVM_SYSTEM_DIR/dev/temp1) would be better. I'll have a think.
>
> Oh and it deals with exported volume groups because I hit that one during testing, maybe I have weird usage patterns!
>
> chris
>
>
>    
