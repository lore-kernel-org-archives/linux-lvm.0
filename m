Message-ID: <51E90856.7040308@redhat.com>
Date: Fri, 19 Jul 2013 11:35:18 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1374167576.23440.3.camel@heisenberg.scientia.net>
	<51E84268.6030000@redhat.com>
	<1374183419.5281.9.camel@fermat.scientia.net>
In-Reply-To: <1374183419.5281.9.camel@fermat.scientia.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm RAID and segtypes... difference to MD?
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
Cc: Christoph Anton Mitterer <calestyo@scientia.net>

Dne 18.7.2013 23:36, Christoph Anton Mitterer napsal(a):
> Hi.
>
> Thanks for the answers...
>
>
> On Thu, 2013-07-18 at 21:30 +0200, Zdenek Kabelac wrote:
>> https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/raid_volumes.html
> But that's only about the RAIDs... not about the other segtypes :(

How about going to:

https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/


> And even there it doesn't provide that much detail information... like
> how much it reuses from MD (same superblocks?) and e.g. whether one can
> use such devices also with mdadm (respectively vice versa.


I guess it's obvious it's using different metadata format - since it's based 
on PV/VG/LV.

Internally dmraid shares same kernel code with mdraid.
(unlike mirror which is internal to dm)

There is no detailed doc about everything :) - you can read the open-source.

Zdenek
