Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6MDSwhp002290
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 14:28:58 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1Bndd4-0004g7-CA
	for linux-lvm@redhat.com; Thu, 22 Jul 2004 14:28:58 +0100
Date: Thu, 22 Jul 2004 14:28:57 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] Latest LVM
Message-ID: <20040722132857.GE10840@tykepenguin.com>
References: <20040722125947.70702.qmail@web20501.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040722125947.70702.qmail@web20501.mail.yahoo.com>
Sender: Patrick <patrick@tykepenguin.com>
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

On Thu, Jul 22, 2004 at 05:59:47AM -0700, nitin ahuja wrote:
> Hi 
> 
> can anybody tell me where I can get latest lvm patches
> for stock kernel linux-2.6.7
> 
> lvm-1.0.8 patches does not work with linux-2.6.7
> 

You need to use LVM2 with 2.6.x kernels. make sure your kernel is
built with "Device Mapper" support.

-- 

patrick
