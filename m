Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59A7SL1026337
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 06:07:28 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59A7RjX013624
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 06:07:27 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 547D81F4050
	for <linux-lvm@redhat.com>; Fri,  9 Jun 2006 12:07:21 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01792-01 for <linux-lvm@redhat.com>;
	Fri,  9 Jun 2006 12:07:11 +0200 (CEST)
Message-ID: <4489484E.6010806@conterra.de>
Date: Fri, 09 Jun 2006 12:07:10 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [PATCH] lvm metadata handling,	warn only once about
	missing PV
References: <200606091137.49000.jens.wilke@de.ibm.com>
In-Reply-To: <200606091137.49000.jens.wilke@de.ibm.com>
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

Jens Wilke wrote:
> With patch:
> 
> # vgchange -ay -P
>   Partial mode. Incomplete volume groups will be activated read-only.
>   Missing PV with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw' in VG main
>   2 logical volume(s) in volume group "main" now active

the metadata backup also shows the device name as a hint.
Is this saved by the on-disk MD, too? Might be helpful to see.

Dieter.
