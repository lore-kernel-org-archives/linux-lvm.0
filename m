Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2QAbGxg017908
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 06:37:16 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2QAasjm009961
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 06:36:54 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e38.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n2QAYfHv022680
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 04:34:41 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n2QAarZ3207612
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 04:36:53 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n2QAarTb016829
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 04:36:53 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n2QAaroq016820
	for <linux-lvm@redhat.com>; Thu, 26 Mar 2009 04:36:53 -0600
Date: Thu, 26 Mar 2009 03:36:52 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] lvm mirror read performance, no load balance with PV ?
Message-ID: <20090326103652.GA13791@us.ibm.com>
References: <af3e5b60903240440q671356f5xd4e8e8c92ace8a56@mail.gmail.com>
	<20090324130834.GA12309@us.ibm.com>
	<af3e5b60903240904k1894f981yf2072f13a336ae04@mail.gmail.com>
	<20090324161239.GA5322@us.ibm.com>
	<af3e5b60903240922w2d20b063x51b04f738003f98a@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af3e5b60903240922w2d20b063x51b04f738003f98a@mail.gmail.com>
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

Sascha Thomas Spreitzer [sascha@spreitzer.name] wrote:
> Can you give me a reference to this patch first? URL?

See the following link. If you read the responses, then you know why it
is not in upstream yet. 

http://permalink.gmane.org/gmane.linux.kernel.device-mapper.devel/2415

Thanks, Malahal.
