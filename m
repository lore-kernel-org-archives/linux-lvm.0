Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIIKmma021086
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 13:20:48 -0500
Received: from pd4mo3so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIIKFHa023916
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 13:20:18 -0500
Received: from pd3mr6so.prod.shaw.ca (pd3mr6so-qfe3.prod.shaw.ca [10.0.141.21])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JT9008T5C7ZF990@l-daemon> for linux-lvm@redhat.com; Tue,
	18 Dec 2007 11:19:11 -0700 (MST)
Received: from pn2ml10so.prod.shaw.ca ([10.0.121.80])
	by pd3mr6so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JT900ABPC7YQ5J0@pd3mr6so.prod.shaw.ca> for
	linux-lvm@redhat.com; Tue, 18 Dec 2007 11:19:11 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int ([68.144.68.179])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0JT900GBDC7YWT20@l-daemon> for linux-lvm@redhat.com; Tue,
	18 Dec 2007 11:19:10 -0700 (MST)
Date: Tue, 18 Dec 2007 11:19:09 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
In-reply-to: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93823E21AC9CD@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

>Whilst I cannot find any definite reference stating "MS WinXP cannot
>handle LVM" it does seem to be the culprit.
>
>Anybody got any such definitive references or other help?
>
>Thanks, Michael

If you do this, you will destroy the mbr on the first disc making Fedora unbootable. You will then have to re-install grub and make sure your menu has an entry for winxp. As far as winxp hanging on install, I am not surprised as it doesn't understand/know of lvm or Linux at all. It's likely trying to analyze the disc and gets stuck. You may have less work in the long run if you do unplug it!
jlc
