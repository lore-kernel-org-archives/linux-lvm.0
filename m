Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6FKwTVG024010
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 16:58:29 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6FKwLjG025073
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 16:58:21 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p6FKwAbd011532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 16:58:10 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p6FKw9EI013809
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 16:58:09 -0400
Date: Fri, 15 Jul 2011 16:58:09 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CAH5HgO_KmKC6xH2p5Btc8U1tjzpoid5aMw0Ej2KyS2RwQK3XTA@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1107151657330.13673@bmsred.bmsi.com>
References: <CAH5HgO9aRwAsjH2hprM=HhnKhZV4h1hewNp8G_VEm0Fvs8bptQ@mail.gmail.com>
	<CAEhu1-6hX4RpATAwQuWNUwG2ZD-eQikwF7qzTxCRyCwUFwHZ9g@mail.gmail.com>
	<CAH5HgO_KmKC6xH2p5Btc8U1tjzpoid5aMw0Ej2KyS2RwQK3XTA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovery from a failed motherboard
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

On Fri, 15 Jul 2011, Tom Epperly wrote:

>>> I am wondering if there is a way I can plug these two physical disks
>>> into another Linux box and access the file system that's on the
>>> logical volume group.
>>
>> Yes. It should work without issue. Many times I have booted a system
>> (home and work) with volume groups on a sysrescuecd and my volume
>> groups show up without issue.

One issue would be if the vg name conflicts with a vg name on the system
you plug them into.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
