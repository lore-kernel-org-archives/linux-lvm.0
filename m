Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBUJvh3P007993
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:57:43 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBUJvUc6031954
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:57:30 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id mBUJvXBf017084
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:57:33 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.13.8) with ESMTP id mBUJvUIx026797
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 14:57:30 -0500
Date: Tue, 30 Dec 2008 14:57:29 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Convert a non-striped LV to a striped LV without
	data loss?
In-Reply-To: <8c87cb5a0812301150ibeeb939kaca1ea789a2e0a57@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0812301454250.26679@bmsred.bmsi.com>
References: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
	<20081230185211.GB27523@seneca.muc.de>
	<8c87cb5a0812301150ibeeb939kaca1ea789a2e0a57@mail.gmail.com>
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

On Tue, 30 Dec 2008, Doug Eubanks wrote:

> No, I have a current linear lv that I want to stripe across three different
> hardware based RAID 5 controllers (3 pvs).

I think he wants to know if he can add the 3 new PVs to the same volume 
group as the linear lv (of course), and then migrate the LV to be striped
across the 3 PVs.

As far as I can see, this is certainly possible with device mapper - but
I'm not aware of any support in current user mode tools.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
