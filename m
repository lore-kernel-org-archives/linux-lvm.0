Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0C0ZMva001858
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 19:35:22 -0500
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0C0ZKML001046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 19:35:21 -0500
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.hs.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	t0C0ZF7G039650
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 16:35:18 -0800
Message-ID: <54B316C3.9040101@tlinx.org>
Date: Sun, 11 Jan 2015 16:35:15 -0800
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <54B24766.4030706@ferienwohnung-altenbeken.de>
In-Reply-To: <54B24766.4030706@ferienwohnung-altenbeken.de>
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

Max Power wrote:
>> # dd if=/dev/zero of=/dev/mapper/BigData-data \
>> #    bs=1G count=1 oflag=direct
>>     
----
    I don't know how it interacts in the case you have setup, but
oflag=direct usually has 'dd' writing to the physical device -- not any 
system
cache.  I don't know if lvm's cache changes that behavior, but you might
try it w/o the direct flag?
