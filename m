Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4N25VVE013556
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 22:05:31 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4N25UUE013925
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 22:05:30 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p4N25PPe012034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 22:05:25 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p4N25O4P022857
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 22:05:24 -0400
Date: Sun, 22 May 2011 22:05:24 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1306017503.3487.1454529429@webmail.messagingengine.com>
Message-ID: <alpine.LRH.2.00.1105222203440.22749@bmsred.bmsi.com>
References: <1306017503.3487.1454529429@webmail.messagingengine.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM - Combining different hard drives with
 different specs ?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 21 May 2011, Lee Gold wrote:

> I have a 100GB IDE HD that will fill up soon. I have a 1TB SATA drive I
> want to add. I am using Ubuntu Server 10.04, I installed the existing
> 100GB drive using LVM, only a single initial HD. I aim to increase my
> storage capacity under the server's document root /var/www... Before I
> get started hopefully asking intelligent questions and giving the needed
> information to help you help me, I wanted to ask this initial question:
>
> These two drives are different, they surely have different performance.
> Will this be a problem? If it was RAID I think matching drives are
> needed. I just want to add storage capacity with acceptable performance
> for a local in-house server.

Even for RAID, they don't have to match.  For RAID1, write speed will 
follow the slowest drive.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
