Received: from o.ww.redhat.com (vpn1-7-244.ams2.redhat.com [10.36.7.244])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r07DSShS019884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 7 Jan 2013 08:28:30 -0500
Message-ID: <50EACD33.8040505@redhat.com>
Date: Mon, 07 Jan 2013 14:27:15 +0100
From: Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
References: <CAN4=B2mcZiiW=ErH=iNwLbQv=tWnR4bfcMG=1Tu_hvQ+b6heRQ@mail.gmail.com>
In-Reply-To: <CAN4=B2mcZiiW=ErH=iNwLbQv=tWnR4bfcMG=1Tu_hvQ+b6heRQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] question about extending snapshots
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 01/05/2013 01:00 AM, Brian Chrisman wrote:
> I'm running rhel6.2 nearly stock.
> When I mount a snapshot (writable) and perform an lvextend, the CoW
> table increases in size, but the logical volume size (for example,
> blockdev output) doesn't change itself.

You deploy more COW space to allow for a larger change set either 
applied to the origin or the snapshot or both doing so, yes.

_But_ snapshots always have origin size.

> Is this impossible because the regions of the snapshot volume wouldn't
> have any corresponding regions in the origin volume?

Yes.

> Is there any way to change the size reported by a snapshot?
>
> What I'm trying to do is take a snapshot, mount it, do stuff to it,
> and if I need, make it bigger, and if I need to, just drop it and
> create a new one.
> If I just take a snapshot and modify the origin and use a merge, then
> space becomes an issue.

Watch new snapshots and thin provisioning, which'll help the space issue 
in future RHEL and existjng upstream dm/lvm releases.


Heinz

>
> thanks,
> Brian
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
