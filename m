Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9S3CWV07972
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 23:12:32 -0400
Received: from feel.to (sv.digitalhouse.co.jp [211.10.15.172])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9S3CTj2006897
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 23:12:29 -0400
Received: from [192.168.0.10] (172.pool5.dsltokyo.att.ne.jp [165.76.172.172])
	by feel.to (8.11.6/3.7W/POP-auth(00031322)) with ESMTP id
	j9S3CS606964
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 12:12:28 +0900
Message-ID: <436197DA.800@snow.email.ne.jp>
Date: Fri, 28 Oct 2005 12:15:38 +0900
From: Mark Sargent <powderkeg@snow.email.ne.jp>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing LVM Revisited
References: <43609147.7090205@snow.email.ne.jp>
	<71EF4685E87CEDB097D1851A@dhcp-2-206.wgops.com>
In-Reply-To: <71EF4685E87CEDB097D1851A@dhcp-2-206.wgops.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Michael Loftis wrote:

> For 2.4 kernels (2.4.20 and later) we've always used ReiserFS and had 
> extremely good results with online/hot expansion on top of LVMs.  We 
> use ext3 for our static os/boot areas but all of our data areas, and 
> since we're using debian, that's just /var, and maybe /home, reside on 
> LVM + ReiserFS.
>
Hi All,

whilst not a direct solution to my current situation I'll keep your 
ideas in mind for future deployment. Cheers.

Mark Sargent.
