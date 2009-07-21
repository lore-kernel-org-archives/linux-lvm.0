Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LAmlF3024670
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 06:48:47 -0400
Received: from eastrmmtao103.cox.net (eastrmmtao103.cox.net [68.230.240.9])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LAmWCr001835
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 06:48:32 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090721104832.OLEK12338.eastrmmtao103.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 06:48:32 -0400
Message-ID: <4A659CFF.4060308@cox.net>
Date: Tue, 21 Jul 2009 05:48:31 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgs result code error
References: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>	<4A657BEB.6070200@cox.net>	<38bdcd1f0907210208g19b3a803j90e43a4ce8f6b301@mail.gmail.com>	<4A658D5A.7060205@cox.net>
	<20090721103511.GH32330@agk-dp.fab.redhat.com>
In-Reply-To: <20090721103511.GH32330@agk-dp.fab.redhat.com>
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

On 2009-07-21 05:35, Alasdair G Kergon wrote:
> On Tue, Jul 21, 2009 at 04:41:46AM -0500, Ron Johnson wrote:
>> Debian Sid's 2.02.44-3 returns a non-zero code, so either RH fixed it 
>> upstream, or Debian patched it...
> 
>> # vgs /dev/sdc1
>>   WARNING: Ignoring duplicate config node: filter (seeking filter)
>>   Volume group "sdc1" not found
>> # echo $?
>> 5
> 
> That's a *different* error case that works correctly.
> 
> Yes, I agree that the original case mentioned should give EINVALID_CMD_LINE
> instead of ECMD_PROCESSED.


 > On 2009-07-21 02:16, Masanari Iida wrote:
 > # vgs /dev/cciss/c0d3p3
 >   Invalid volume group name: cciss/c0d3p3

Hey, you're right!!

But why?  (I tried to mimic his example as best I could.)

Is it because of the multi-level device name, and the parser getting 
confused?

-- 
Scooty Puff, Sr
The Doom-Bringer
