Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1MDuEXp025888
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 08:56:14 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1MDu7mX001032
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 08:56:08 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id EABD5542C7
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:55:56 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 22672-10 for <linux-lvm@redhat.com>;
	Thu, 22 Feb 2007 14:55:44 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:55:44 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 504189483
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:55:15 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (192.168.113.3 [192.168.113.3]) (amavisd-new, port 10025)
	with ESMTP id 4Z4KjM99wRej for <linux-lvm@redhat.com>;
	Thu, 22 Feb 2007 14:55:52 +0100 (CET)
Received: from [81.173.188.20] (xdsl-81-173-188-20.netcologne.de
	[81.173.188.20]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:55:14 +0100 (CET)
Message-ID: <45DDA0DE.2020105@wpkg.org>
Date: Thu, 22 Feb 2007 14:55:42 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
References: <45D448F5.3000301@wpkg.org>	<45D47AF5.2040106@wpkg.org>	<20070216074737.GA14119@percy.comedia.it>	<45D57D16.8060902@wpkg.org>	<20070217125644.GC11919@percy.comedia.it>	<20070217183431.GW7201@agk.surrey.redhat.com>
	<45DD98CC.1020305@wpkg.org>
In-Reply-To: <45DD98CC.1020305@wpkg.org>
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

Tomasz Chmielewski schrieb:
> Alasdair G Kergon schrieb:
>> On Sat, Feb 17, 2007 at 01:56:44PM +0100, Luca Berra wrote:
>>> On Fri, Feb 16, 2007 at 10:44:54AM +0100, Tomasz Chmielewski wrote:
>>>> BTW, the machine is running Debian etch (ARM port).
>>> mmm i don't have an arm maybe this is the issue why lvm does not
>>> understand that sda2 is a md component?!?
>>  
>> I've not followed this thread, but you must use version 2.02.21 or later
>> for the ARM architecture with md (or backport the patch).
> 
> Hmm, I must try that.
> 
> I'll let the list know in a week or so.

Hmm, I can't compile that:

(...)
gcc -c -I. -I../include -DHAVE_CONFIG_H  -fPIC -Wall -Wundef -Wshadow 
-Wcast-align -Wwrite-strings -Wmissing-prototypes -Wmissing-declarations 
-Wnested-externs -Winline -Wmissing-noreturn -O2 striped/striped.c -o 
striped/striped.o
report/report.c:67: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:67: warning: its scope is only this definition or 
declaration, which is probably not what you want
report/report.c:67: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_string_disp?:
report/report.c:69: warning: implicit declaration of function 
?dm_report_field_string?
report/report.c:69: warning: nested extern declaration of 
?dm_report_field_string?
report/report.c: At top level:
report/report.c:74: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:74: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:83: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:83: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_devices_disp?:
report/report.c:116: warning: implicit declaration of function ?dm_snprintf?
report/report.c:116: warning: nested extern declaration of ?dm_snprintf?
report/report.c:139: warning: implicit declaration of function 
?dm_report_field_set_value?
report/report.c:139: warning: nested extern declaration of 
?dm_report_field_set_value?
report/report.c: At top level:
report/report.c:146: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:146: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:176: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:176: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_modules_disp?:
report/report.c:189: warning: passing argument 1 of ?_tags_disp? from 
incompatible pointer type
report/report.c:189: warning: passing argument 3 of ?_tags_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:194: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:194: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_vgfmt_disp?:
report/report.c:203: warning: passing argument 1 of ?_string_disp? from 
incompatible pointer type
report/report.c:203: warning: passing argument 3 of ?_string_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:208: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:208: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_pvfmt_disp?:
report/report.c:218: warning: passing argument 1 of ?_string_disp? from 
incompatible pointer type
report/report.c:218: warning: passing argument 3 of ?_string_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:223: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:223: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_lvkmaj_disp?:
report/report.c:230: warning: implicit declaration of function 
?dm_report_field_int?
report/report.c:230: warning: nested extern declaration of 
?dm_report_field_int?
report/report.c:232: warning: implicit declaration of function 
?dm_report_field_uint64?
report/report.c:232: warning: nested extern declaration of 
?dm_report_field_uint64?
report/report.c: At top level:
report/report.c:237: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:237: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:251: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:251: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:336: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:336: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:362: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:362: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:406: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:406: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:421: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:421: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:435: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:435: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:453: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:453: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:487: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:487: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:506: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:506: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:536: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:536: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:565: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:565: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_vgsize_disp?:
report/report.c:572: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:572: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:577: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:577: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_segstart_disp?:
report/report.c:584: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:584: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:589: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:589: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_segsize_disp?:
report/report.c:596: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:596: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:601: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:601: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_chunksize_disp?:
report/report.c:611: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:611: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:616: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:616: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_pvused_disp?:
report/report.c:627: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:627: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:632: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:632: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_pvfree_disp?:
report/report.c:643: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:643: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:648: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:648: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_pvsize_disp?:
report/report.c:659: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:659: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:664: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:664: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_devsize_disp?:
report/report.c:672: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:672: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:677: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:677: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_vgfree_disp?:
report/report.c:684: warning: passing argument 1 of ?_size64_disp? from 
incompatible pointer type
report/report.c:684: warning: passing argument 3 of ?_size64_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:689: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:689: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:709: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:709: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_uint32_disp?:
report/report.c:711: warning: implicit declaration of function 
?dm_report_field_uint32?
report/report.c:711: warning: nested extern declaration of 
?dm_report_field_uint32?
report/report.c: At top level:
report/report.c:716: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:716: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_int32_disp?:
report/report.c:718: warning: implicit declaration of function 
?dm_report_field_int32?
report/report.c:718: warning: nested extern declaration of 
?dm_report_field_int32?
report/report.c: At top level:
report/report.c:723: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:723: warning: ?struct dm_report? declared inside 
parameter list
report/report.c: In function ?_lvsegcount_disp?:
report/report.c:730: warning: passing argument 1 of ?_uint32_disp? from 
incompatible pointer type
report/report.c:730: warning: passing argument 3 of ?_uint32_disp? from 
incompatible pointer type
report/report.c: At top level:
report/report.c:735: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:735: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:785: warning: ?struct dm_report_field? declared inside 
parameter list
report/report.c:785: warning: ?struct dm_report? declared inside 
parameter list
report/report.c:856: error: array type has incomplete element type
report/report.c:873: error: array type has incomplete element type
In file included from report/report.c:874:
report/columns.h:21: error: ?DM_REPORT_FIELD_TYPE_STRING? undeclared 
here (not in a function)
report/columns.h:24: error: ?DM_REPORT_FIELD_TYPE_NUMBER? undeclared 
here (not in a function)
report/report.c: In function ?report_init?:
report/report.c:889: error: ?DM_REPORT_OUTPUT_ALIGNED? undeclared (first 
use in this function)
report/report.c:889: error: (Each undeclared identifier is reported only 
once
report/report.c:889: error: for each function it appears in.)
report/report.c:892: error: ?DM_REPORT_OUTPUT_BUFFERED? undeclared 
(first use in this function)
report/report.c:895: error: ?DM_REPORT_OUTPUT_HEADINGS? undeclared 
(first use in this function)
report/report.c:897: warning: implicit declaration of function 
?dm_report_init?
report/report.c:897: warning: nested extern declaration of ?dm_report_init?
report/report.c:898: warning: return makes pointer from integer without 
a cast
report/report.c: In function ?report_object?:
report/report.c:916: warning: implicit declaration of function 
?dm_report_object?
report/report.c:916: warning: nested extern declaration of 
?dm_report_object?
make[1]: *** [report/report.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/root/lvm2/LVM2.2.02.22/lib'
make: *** [lib] Error 2



-- 
Tomasz Chmielewski
http://wpkg.org
