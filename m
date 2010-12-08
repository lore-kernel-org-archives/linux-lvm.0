From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <201012071901.01998.benscott@nwlink.com>
References: <201012071901.01998.benscott@nwlink.com>
Date: Wed, 08 Dec 2010 11:02:20 -0500
Message-ID: <1291824140.6769.394.camel@f12-work>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lv segment "devices" property?
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

On Tue, 2010-12-07 at 19:01 -0800, ben wrote:
> Is there any plan to add the lvm2app get property "devices" function for 
> logical volume segments?
> 
> ie:   value = lvm_lvseg_get_property(lvm_lvseg, "devices");
> 
> Thank you.
> benscott@nwlink.com
>  


Patches were posted on 11/22 here to address 'devices' and
'seg_pe_ranges':
https://www.redhat.com/archives/lvm-devel/2010-November/msg00091.html

Petr also recently committed patches to rework some internal 'percent'
code and I think will add the "snap_percent" and "copy_percent"
properties.

I suspect these are just part of the lvm-devel patch backlog and will
eventually get in.
