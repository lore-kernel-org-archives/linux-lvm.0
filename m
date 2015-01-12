Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0C69fKr015653
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 01:09:41 -0500
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0C69cY5002467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2015 01:09:40 -0500
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.hs.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	t0C69X42056757
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 22:09:37 -0800
Message-ID: <54B3651D.2030407@tlinx.org>
Date: Sun, 11 Jan 2015 22:09:33 -0800
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <1421040644.77686.YahooMailBasic@web181504.mail.ne1.yahoo.com>
In-Reply-To: <1421040644.77686.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] writeback cache not promoting writes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

matthew patton wrote:
> and stop using DD has a benchmark or testing tool. FIO. DD has way too many oddities.
>   
compared to fio?  Seems like fio only works on raw disk partitions.
At least 'dd' can write to files...

Looked at fio but seems like I have to let it overwrite an entire
disk --- not what I'd call ideal...
