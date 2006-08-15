Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FBk3xM020929
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 07:46:03 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FBjxDM028374
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 07:45:59 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7FBjra16716
	for linux-lvm@redhat.com; Tue, 15 Aug 2006 12:45:53 +0100
Date: Tue, 15 Aug 2006 12:45:50 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] expanded volume
Message-ID: <20060815114516.GA16285@cobalt0.panici.net>
References: <44E1AB70.8080702@arnet.net.ar>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44E1AB70.8080702@arnet.net.ar>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Aug 15, 2006 at 08:09:36AM -0300, German Staltari wrote:
> Hi, I've expanded a LV but the disks that I've added to the LV/VG are 
> not being used (the I/Os to this disks are almost null and the old ones 
> still with high I/Os). Is there a way to force I/O to the new disks?

did you resize the filesystem? what filesystem(s) are you using?

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
