Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9N0abLW007884
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 20:36:37 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9N0aYZJ010258
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 20:36:34 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l9N0aQP9012635
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 20:36:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l9N0aQKI011288
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 20:36:26 -0400
Date: Mon, 22 Oct 2007 20:36:26 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvreduce
In-Reply-To: <471C29F2.5090408@redhat.com>
Message-ID: <Pine.LNX.4.44.0710222032460.11239-100000@bmsred.bmsi.com>
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

On Mon, 22 Oct 2007, Humble Chirammal wrote:

>   One of the customer ran  "lvreduce" command without reducing the 
> filesystem (resize2fs ).  After the system was rebooted got this error.
> 
> <<snip>>
> 
> The filesystem size (according to the superblock) is 19922944 blocks
> The physical size of the device is 13369344 blocks
> Either the superblock or the partition table is likely to be corrupt!
>  <<snip>>
> 
> Is there any way for data recovery???

Stop them from doing anymore LVM operations until recovery.
If nothing else has been done, undo the lvreduce with vgrestore.
LVM keeps backup versions of the metadata (/etc/lvm/archive on my
system).  I'll let the experts provide the exact syntax.  I haven't
had to do it yet :-)
If they have used the freed extents (lvextend or lvcreate or ...),
then they are hosed.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
