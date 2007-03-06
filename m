Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l261cN8F015187
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 20:38:24 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l261cMV8005527
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 20:38:22 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l261cHbK030804
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 20:38:17 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l261cGgr026726
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 20:38:16 -0500
Date: Mon, 5 Mar 2007 20:38:16 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Encapsulate existing partition / Moving logical
	volumes
In-Reply-To: <31dadfbb0703051637n6b9fc6c4w1eea492bd08079@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0703052032480.26718-100000@bmsred.bmsi.com>
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

On Mon, 5 Mar 2007, Vern Kyle wrote:

> First, is there a method to encapsulate an existing disk partition
> into a logical volume?  (I can copy all of the data manually, but I'm
> thinking there is an eloquent way to accomplish this.)

Since the LVM metadata takes up room, and is stored at the beginning, 
I don't see how a partition could be "converted" easily.  You could 

1) shrink the fs
2) use a special copy to move up the fs enough blocks to make room for
   metadata (by starting at the end and working towards the beginning
   of the partition).
3) create the PV metadata and allocate the LV without zeroing the
   beginning.

However, by that time, you might as well have copied the data.  The
only utility would be if there was no room - and it would be highly
dangerous.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
