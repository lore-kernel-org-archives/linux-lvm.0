Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8SHB74J001299
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2009 13:11:07 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8SHAveg002449
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2009 13:10:57 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n8SHAu4Z025945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2009 13:10:56 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n8SHAuV6030489
	for <linux-lvm@redhat.com>; Mon, 28 Sep 2009 13:10:56 -0400
Date: Mon, 28 Sep 2009 13:10:56 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvm can not be extended
In-Reply-To: <3b0f6ce80909281005h60e9a49bk215ede38716ee0ea@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0909281307510.30380@bmsred.bmsi.com>
References: <3b0f6ce80909281005h60e9a49bk215ede38716ee0ea@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 28 Sep 2009, Yu Huang wrote:

> I am new to lvm. I have installed my ubuntu 8.04 on LVM in my machine.
> 
> I created a volume for the root partition. I used lvextend to extend the
> size of the root volume.
> In lvdisplay, it shows the LV size is 25.00G. But when I use df, it shows
> the size of the root volume is
> 5.00G, which is the original size I allocated to it.
> 
> Am I missing something here?

Definitely.  Df shows the filesystem size, not the LV size.  You probably
want to extend the filesystem to match the LV.  In EL5, 'resize2fs' will
resize a filesystem while it is mounted (Leave out the size, and it will resize
to match the LV).  If the version on your Ubuntu doesn't know how to 
resize online, then you'll have to boot from CD or USB and run resize2fs.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
