Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6L9g3fL017992
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 05:42:03 -0400
Received: from eastrmmtao104.cox.net (eastrmmtao104.cox.net [68.230.240.46])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6L9flUo012624
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 05:41:47 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090721094148.YYAN5576.eastrmmtao104.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 05:41:48 -0400
Message-ID: <4A658D5A.7060205@cox.net>
Date: Tue, 21 Jul 2009 04:41:46 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgs result code error
References: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>	<4A657BEB.6070200@cox.net>
	<38bdcd1f0907210208g19b3a803j90e43a4ce8f6b301@mail.gmail.com>
In-Reply-To: <38bdcd1f0907210208g19b3a803j90e43a4ce8f6b301@mail.gmail.com>
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

On 2009-07-21 04:08, Masanari Iida wrote:
> Thanks for reply.
> 
>> You specified a PV, not a VG.  Try:
>> # vgs vg01
> 
> Yes I know it should work.
> 
> # vgs vg01
>   VG   #PV #LV #SN Attr   VSize VFree
>   vg01   1   0   0 wz--n- 3.82G 3.82G
> 
> 
> The point I want to say is,  vgs command _should_ return non-zero
> exit status value, if vgs command returned an error.

Sorry.

> Reference: man lvm(8)
> 
> DIAGNOSTICS
>        All tools return a status code of zero on success or non-zero on  fail-
>        ure.
[snip]
> I have found this bug on RHEL5 (which uses lvm2.02.40-6) and
> I have checked out WHATS_NEW between 2.02-40 to 49,
> so far no similar symptom.

Debian Sid's 2.02.44-3 returns a non-zero code, so either RH fixed 
it upstream, or Debian patched it...

# vgs --version
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   LVM version:     2.02.44 (2009-01-26)
   Library version: 1.02.30 (2009-01-26)
   Driver version:  4.14.0

# vgs /dev/sdc1
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   Volume group "sdc1" not found

# echo $?
5

-- 
Scooty Puff, Sr
The Doom-Bringer
