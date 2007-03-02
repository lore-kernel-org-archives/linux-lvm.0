Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22BaaDA027664
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:36:36 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l22BaWSi024594
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:36:32 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id 28CF554673
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:36:26 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 28685-02 for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 12:36:08 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:36:08 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 0C11C946C
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:36:07 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id CjuoVYQe-pQD for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 12:35:07 +0100 (CET)
Received: from [81.173.142.58] (xdsl-81-173-142-58.netcologne.de
	[81.173.142.58]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:36:05 +0100 (CET)
Message-ID: <45E80C24.5020301@wpkg.org>
Date: Fri, 02 Mar 2007 12:36:04 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
References: <45D448F5.3000301@wpkg.org>
	<45D47AF5.2040106@wpkg.org>	<20070216074737.GA14119@percy.comedia.it>	<45D57D16.8060902@wpkg.org>	<20070217125644.GC11919@percy.comedia.it>	<20070217183431.GW7201@agk.surrey.redhat.com>	<45DD98CC.1020305@wpkg.org>
	<45DDA0DE.2020105@wpkg.org>
	<20070225083815.GA23001@percy.comedia.it>
In-Reply-To: <20070225083815.GA23001@percy.comedia.it>
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
To: linux-lvm@redhat.com

Luca Berra schrieb:
> On Thu, Feb 22, 2007 at 02:55:42PM +0100, Tomasz Chmielewski wrote:
>> Tomasz Chmielewski schrieb:
>>> Alasdair G Kergon schrieb:
>>>> On Sat, Feb 17, 2007 at 01:56:44PM +0100, Luca Berra wrote:
>>>>> On Fri, Feb 16, 2007 at 10:44:54AM +0100, Tomasz Chmielewski wrote:
>>>>>> BTW, the machine is running Debian etch (ARM port).
>>>>> mmm i don't have an arm maybe this is the issue why lvm does not
>>>>> understand that sda2 is a md component?!?
>>>>  
>>>> I've not followed this thread, but you must use version 2.02.21 or 
>>>> later
>>>> for the ARM architecture with md (or backport the patch).
>>>
>>> Hmm, I must try that.
>>>
>>> I'll let the list know in a week or so.
>>
>> Hmm, I can't compile that:
>>
>> (...)
>> gcc -c -I. -I../include -DHAVE_CONFIG_H  -fPIC -Wall -Wundef -Wshadow 
>> -Wcast-align -Wwrite-strings -Wmissing-prototypes 
>> -Wmissing-declarations -Wnested-externs -Winline -Wmissing-noreturn 
>> -O2 striped/striped.c -o striped/striped.o
>> report/report.c:67: warning: ?struct dm_report_field? declared inside 
>> parameter list
> Did you update device-mapper as well?
> 
> Anyway the patch to support both endian versions of the md superblock is
> very small and can be applied to lvm earlier than 2.02.21
> 
> http://sources.redhat.com/cgi-bin/cvsweb.cgi/LVM2/lib/device/dev-md.c.diff?r1=1.3&r2=1.4&cvsroot=lvm2 

Curiously, I updated lvm to Debian's 2.02.06-3, rebooted (machine was in 
a rather weird state), and the issue is gone.

With Debian's libdevmapper-dev 1.02.08-1 it doesn't compile; I didn't 
try to upgrade it anymore.


-- 
Tomasz Chmielewski
