Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i36Ghwj28948
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 12:43:58 -0400
Received: from magic.alttech.com ([207.13.196.227])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i36Ghu5D012109
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 12:43:57 -0400
Received: from dogberry.ossmann.com (magic.alttech.com [64.140.60.35])
	by magic.alttech.com (Postfix) with ESMTP id 08C512FE98
	for <linux-lvm@redhat.com>; Tue,  6 Apr 2004 10:45:07 -0600 (MDT)
Date: Tue, 6 Apr 2004 10:43:51 -0600
From: Michael Ossmann <mike@ossmann.com>
Subject: Re: [linux-lvm] Converting the root filesystem to ReiserFS on LVM...
Message-ID: <20040406164351.GA17338@ossmann.com>
References: <40717062.6050401@alteeve.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40717062.6050401@alteeve.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Apr 05, 2004 at 10:42:42AM -0400, Madison Kelly wrote:
> 
> When I try to boot off either rescue CD 'root' isn't mounted but 
> then I can't find the darn LVM partitions (and yes I made sure that the 
> rescue CDs supported LVM and ReiserFS).

Did you try running vgscan?

mossmann
