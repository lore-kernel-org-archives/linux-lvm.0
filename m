Received: from fentible.pjc.net (vpnuser4.surrey.redhat.com [172.16.9.4])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i22Fjeuq029699
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 15:45:40 GMT
Received: from patrick by fentible.pjc.net with local (Exim 4.30)
	id 1AyC6K-0003cB-Da
	for linux-lvm@redhat.com; Tue, 02 Mar 2004 15:46:32 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] Adding xfs module to the initrd-lvm
Message-ID: <20040302154631.GB12779@tykepenguin.com>
References: <20040302152911.GI15556@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040302152911.GI15556@tangerine.coulon.evette>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  2 10:44:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Mar 02, 2004 at 04:29:11PM +0100, Jean-Luc Coulon (f5ibh) wrote:
> Hi,
> 
> I would like to add the xfs module to the lvm created by  
> lvmcreate_initrd.
> 
> Is there a mean to do that easily?
> So I have to mount and existing one and add the module by hand?

I suspect that's the easiest way if that's what you really need to do.

> So I have to use the standard initrd tools?

You could edit the existing lvmcreate_initrd to add the module (look for lvm-mod
and write some similar code underneath it).

But the easiest way, by far, is to have your kernel with XFS compiled into it
rather than as a module!

Patrick
