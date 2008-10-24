Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9OGUkFv014785
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2008 12:30:46 -0400
Message-Id: <99ED4C7B-473E-422F-AC32-F34EB2A11FA4@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <17984.89.200.148.101.1224840790.squirrel@wmail.comarch.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] How to monitor and possibly autoextend snapshots
Date: Fri, 24 Oct 2008 11:30:00 -0500
References: <17984.89.200.148.101.1224840790.squirrel@wmail.comarch.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Right now, you get notified when the snapshot becomes invalid.  I  
thought I heard someone talking about adding forewarning, but I don't  
know where that stands.

You can respond to events (like the snapshot going invalid) through  
dmeventd, but any solution like that would require new code... and you  
would also need new code in the kernel to do the forewarning.

Since you have some knowledge of the arguments given to other programs  
for this feature... :)  Perhaps if you would be willing to envision  
the arguments necessary to 'lvcreate' when creating the snapshot, we  
could get the ball rolling.

  brassow


On Oct 24, 2008, at 4:33 AM, marcin.kaluza@comarch.pl wrote:

> Hi
>
> Is there a way to get notified, when the snapshot fills up to a  
> certain
> level? i.e.  via dmsetup wait [] ? I looked for event numbers but  
> couldn't
> find any doc for them.
> The best thing would be to make snapshots autoextensible when given  
> a max
> size and resize value (just like oracle tablespaces do), but I suppose
> that would require much coding...
> Any thoughts?
>
> We're using lvm snapshots for samba shadow copies and database  
> cloning,
> but there's a problem with monitoring snapshots % of usage - now we  
> just
> have a daemon that polls lvdisplay periodically and extends the lv  
> when
> necessary. But this is unreliable - you have to either poll often or  
> keep
> enough of free space and still you can end up with a trashed snap.
>
> Martin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
