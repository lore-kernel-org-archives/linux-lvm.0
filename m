Received: from sboyd.brisbane.redhat.com
	(IDENT:U2FsdGVkX1+yVdrK65JtZukOwLTpnsJzULHZwr5mtyw@sboyd.brisbane.redhat.com
	[172.16.44.120])
	by pobox.brisbane.redhat.com (8.12.8/8.12.8) with ESMTP id
	j5N18LwU008250
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 11:08:21 +1000
Subject: Re: [linux-lvm] lvextend
From: Sean Boyd <sboyd@redhat.com>
In-Reply-To: <200506221716.00221.t-rigby@shaw.ca>
References: <200506221716.00221.t-rigby@shaw.ca>
Date: Thu, 23 Jun 2005 11:08:21 +1000
Message-Id: <1119488901.4305.27.camel@sboyd.brisbane.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: sboyd@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2005-06-22 at 17:16 -0700, Terry Rigby wrote:
> I am trying to add a full hard drive to my LV by following the directions at 
> TLDP.org.  It says there to use lvextend -L +XXG where XX is the size in GB 
> you want to add to the LV.  Is there a more simple way to just add a whole 
> hard drive ie: /dev/hde
> 
> It seems like a pain to have to manually figure out the size of the hard drive 
> then add it using lvextend -L +200GB for a 200GB hard drive especially since 
> we all know its not actually 200GB.

You could increase the LV by using the remaining free physical extents
(PE).

To check how many PE's are available after extending the VG run
vgdisplay and check "Free  PE / Size". The first value will give you the
total number of PE's available.

Then extend your LV using the -l switch to specify PE's rather than
having to determine a size using the -L switch.

For example "lvextend -l +25 /dev/volGroup00/myLVM" will extend myLVM by
25 PE's.

Of course you then need to extend to file system to be able to use this
extra space :)

--Sean
