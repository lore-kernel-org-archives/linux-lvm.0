Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1P8cK4t028921
	for <linux-lvm@redhat.com>; Sun, 25 Feb 2007 03:38:21 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1P8cHWM030323
	for <linux-lvm@redhat.com>; Sun, 25 Feb 2007 03:38:18 -0500
Date: Sun, 25 Feb 2007 09:38:16 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
Message-ID: <20070225083815.GA23001@percy.comedia.it>
References: <45D448F5.3000301@wpkg.org> <45D47AF5.2040106@wpkg.org>
	<20070216074737.GA14119@percy.comedia.it>
	<45D57D16.8060902@wpkg.org>
	<20070217125644.GC11919@percy.comedia.it>
	<20070217183431.GW7201@agk.surrey.redhat.com>
	<45DD98CC.1020305@wpkg.org> <45DDA0DE.2020105@wpkg.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45DDA0DE.2020105@wpkg.org>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 22, 2007 at 02:55:42PM +0100, Tomasz Chmielewski wrote:
>Tomasz Chmielewski schrieb:
>>Alasdair G Kergon schrieb:
>>>On Sat, Feb 17, 2007 at 01:56:44PM +0100, Luca Berra wrote:
>>>>On Fri, Feb 16, 2007 at 10:44:54AM +0100, Tomasz Chmielewski wrote:
>>>>>BTW, the machine is running Debian etch (ARM port).
>>>>mmm i don't have an arm maybe this is the issue why lvm does not
>>>>understand that sda2 is a md component?!?
>>>  
>>>I've not followed this thread, but you must use version 2.02.21 or later
>>>for the ARM architecture with md (or backport the patch).
>>
>>Hmm, I must try that.
>>
>>I'll let the list know in a week or so.
>
>Hmm, I can't compile that:
>
>(...)
>gcc -c -I. -I../include -DHAVE_CONFIG_H  -fPIC -Wall -Wundef -Wshadow 
>-Wcast-align -Wwrite-strings -Wmissing-prototypes -Wmissing-declarations 
>-Wnested-externs -Winline -Wmissing-noreturn -O2 striped/striped.c -o 
>striped/striped.o
>report/report.c:67: warning: ?struct dm_report_field? declared inside 
>parameter list
Did you update device-mapper as well?

Anyway the patch to support both endian versions of the md superblock is
very small and can be applied to lvm earlier than 2.02.21

http://sources.redhat.com/cgi-bin/cvsweb.cgi/LVM2/lib/device/dev-md.c.diff?r1=1.3&r2=1.4&cvsroot=lvm2

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
