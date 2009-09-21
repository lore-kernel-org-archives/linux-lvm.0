Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8LMXBSI003311
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 18:33:11 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8LMWwAk002334
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 18:32:59 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n8LMV4bq007711
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 16:31:04 -0600
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n8LMWwQd255140
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 16:32:58 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n8LMWwVI031571
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 16:32:58 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n8LMWvni031560
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 16:32:57 -0600
Date: Mon, 21 Sep 2009 15:32:57 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] grow lv bug
Message-ID: <20090921223257.GB22590@us.ibm.com>
References: <200909220808.16458.whobedobe@dodo.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200909220808.16458.whobedobe@dodo.com.au>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hugh [whobedobe@dodo.com.au] wrote:
> This seems to be a bug with lvm. Unable to grow the logical volume.
> I have the space. pvextend succeeded, vgextend succeeded but lvextend, 
> lvresize fail.
> 
> Where can I report this and get some support?
> 
> Following is a transcript of my attempt to solve this problem. I've remove the 
> sda stuff as it has no problems.
> 
> [root@fc11-64 ~]# pvs -v
>     Scanning for physical volume names
>   PV         VG         Fmt  Attr PSize  PFree  DevSize PV UUID                               
>   /dev/sdb2  VolGroup00 lvm2 a-   67.91G 20.00G  47.93G eCuGyH-jV7L-Tgdg-JyYW-
> sWK1-ehZY-OLw0WS

DevSize is smaller than PSize!
