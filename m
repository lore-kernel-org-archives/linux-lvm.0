Received: from [10.11.10.250] (vpn-10-250.rdu.redhat.com [10.11.10.250])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id oAN42edV031960
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2010 23:02:40 -0500
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <201011212234.20129.benscott@nwlink.com>
References: <201011212234.20129.benscott@nwlink.com>
Date: Mon, 22 Nov 2010 23:03:44 -0500
Message-ID: <1290485024.31336.2.camel@f12-work>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] bug in lvm2app get_property value
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2010-11-21 at 22:34 -0800, ben wrote:
> For some reason the following functions return different numbers for single 
> segment volumes:
> 
>     value = lvm_lv_get_property(lvm_lv, "lv_size");
>     value = lvm_lvseg_get_property(lvm_lvseg, "seg_size");
> 
> The first function seems to be correct while the second one returns the same 
> value divided by 512?
> 

yes this is a bug - thanks for reporting.
Patch submitted to lvm-devel.
