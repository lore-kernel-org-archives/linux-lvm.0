Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6D93oV25869
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 05:03:50 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6D93nE1028370
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 05:03:49 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 3A1201C88E0
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 11:03:32 +0200 (CEST)
Message-ID: <42D4D8D8.6050203@conterra.de>
Date: Wed, 13 Jul 2005 11:03:20 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resend: API for retrieving linux lvm information
References: <ce9f1f9e04090623046460fed8@mail.gmail.com>
	<20040907094413.GA6264@agk.surrey.redhat.com>
In-Reply-To: <20040907094413.GA6264@agk.surrey.redhat.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> These answers are for LVM2.
> 
> On Mon, Sep 06, 2004 at 11:04:09PM -0700, Stanley Yue wrote:
> 
>>1) Is there any api library for retrieve linux lvm configuration? I.e.
>>querying for all the vg(s), pv(s), lv(s) on the system?
> 
> The commands: lvs, pvs, vgs with numerous cmdline flags.
> See lib/report/columns.h for field names

liblvm.a seems handy, to generate lvm command line tools, but I'm missing
a clear differentiation between modifying and non modifying usage.

I'm asking, as I want to develop some lvm information system running
as a web service to provide a quick overview about my lvm configuration
and status. Thus I definitely want to run it as non root. I might use
those nice lvs,pvs,vgs commands, but I don't want to provide them with
a suid-bit, as they are potentially able to modify my lvm. The former
/proc interface was ideal for this purpose, but it seems to be missing for
LVM2. Are there any plans, to provide lvm informations via /proc or /sys
again, or would it be possible to write somehow "restricted" lvm-tools
using liblvm?

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
