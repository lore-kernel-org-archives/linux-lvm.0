Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8IHvteG021646
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 13:57:55 -0400
Received: from gaimboi.tmr.com (mail.tmr.com [64.65.253.246])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8IHvqru014641
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 13:57:53 -0400
Message-ID: <46F0125B.6020605@tmr.com>
Date: Tue, 18 Sep 2007 14:00:59 -0400
From: Bill Davidsen <davidsen@tmr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Q: Online resizing ext3 FS
References: <20070912163621.1f951876@slopi> <46E7FE32.7010404@wpkg.org>
	<87ejh2n2kk.fsf@informatik.uni-tuebingen.de>
In-Reply-To: <87ejh2n2kk.fsf@informatik.uni-tuebingen.de>
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
To: Goswin von Brederlow <brederlo@informatik.uni-tuebingen.de>
Cc: linux-raid@vger.kernel.org, LVM general discussion and development <linux-lvm@redhat.com>

Goswin von Brederlow wrote:
> Tomasz Chmielewski <mangoo@wpkg.org> writes:
>
>   
>> Chris Osicki schrieb:
>>     
>>> Hi
>>>
>>> I apologize in advance for asking a question not really appropriate
>>> for this mailing list, but I couldn't find a better place with lots of
>>> people managing lots of disk space.
>>>
>>> The question:
>>> Has anyone of you been using ext2online to resize (large) ext3 filesystems?
>>> I have to do it going from 500GB to 1TB on a productive system I was
>>> wondering if you have some horror/success stories.
>>> I'm using RHEL4/U4 (kernel 2.6.9) on this system.
>>>       
>
> That kernel seems to be a bit old. Better upgrade first.
>   

You don't upgrade when using the stable releases... that's the whole 
idea, you don't have to worry about a new versions of anything, the bugs 
and security issues are backported, but the version stays the same. 
Highly desirable for "must work" systems, no so nice for doing cutting 
edge stuff using nice features you don't have. :-(

-- 
bill davidsen <davidsen@tmr.com>
  CTO TMR Associates, Inc
  Doing interesting things with small computers since 1979
