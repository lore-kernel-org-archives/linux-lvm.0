Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2PNPmj00320
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 18:25:48 -0500
Received: from shell.blacknet.de (shell.blacknet.de [80.254.131.106])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2PNPlWA002288
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 18:25:47 -0500
Date: Fri, 26 Mar 2004 00:17:11 +0100
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] 2 TB limit
Message-ID: <20040325231658.GD24286@shell.blacknet.de>
References: <005601c412af$748d71a0$1fa0a8c0@blec>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <005601c412af$748d71a0$1fa0a8c0@blec>
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
To: linux-lvm@redhat.com


On Thu, Mar 25 '04 at 16:23, Brad Vrabete wrote:
> Is there any was to create a logigal volume larger than 2TB? Can LVM2
> do that?
you need to use 2.6.x (or find a patch for 2.4.x) as onty his kernel
supports large block devices.

Or you might have luck with x86_64 (aka AMD Opterons)
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
