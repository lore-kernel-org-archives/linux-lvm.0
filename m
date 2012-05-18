Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4I0N9MQ017749
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 20:23:09 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4I0N8xb019749
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 20:23:08 -0400
Date: Thu, 17 May 2012 20:21:04 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <20120517181350.2922a70b@bettercgi.com>
Message-ID: <alpine.LRH.2.02.1205172019540.15639@bmsred.bmsi.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvreduce nightmare
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
Cc: ganaiwali@gmail.com

Long ago, Nostradamus foresaw that on May 17, Ray Morris would write:

> Stop. Don't do anything else until you are sure of what to do next.
> You will not lose data by studying. You can lose data by trying to fix
> it.
>
>> resize2fs /dev/vg0/data 100G
>> lvreduce -L -100G -n /dev/vg0/data*

This reduced the LV by 100G.  Probably *not* what you wanted.
