Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HJdCwb004350
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 15:39:12 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HJd5Jw009233
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 15:39:06 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id D80851F404B
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 21:38:59 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16364-09 for <linux-lvm@redhat.com>;
	Wed, 17 May 2006 21:38:54 +0200 (CEST)
Message-ID: <446B7BCD.2020406@conterra.de>
Date: Wed, 17 May 2006 21:38:53 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Forgot to export my volume group...
References: <44696A27.5050500@andrew.cmu.edu>
In-Reply-To: <44696A27.5050500@andrew.cmu.edu>
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

Jared Luxenberg wrote:
> I forgot to run export on my volume group before disconnecting it from 
> my system.  Is there any way to mount the volume group without access to 
> the original machine?

Isn't it recognized by the target machine even if it was not properly
exported? I once had similar problems when trying to migrate a VG to
an other system which already had a VG. In this case I had to "import"
the new VG properly, to arrange it with the already running VG.
If you are using LVM2, all necessary informations to get it running
again are saved on each PV, regardless of beeing exported or not.

Dieter.
