References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <55ED3D10.4070203@redhat.com>
Date: Mon, 7 Sep 2015 09:30:24 +0200
MIME-Version: 1.0
In-Reply-To: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] devices.filter changed behaviour in 80ac8f37d6
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
To: Richard Davies <richard.davies@elastichosts.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 09/05/2015 01:56 PM, Chris Webb wrote:
> Our hosts use local md arrays as LVM2 PVs in a very straightforward way.
> They also have lots of slower iscsi devices which LVM shouldn't scan or
> touch, so we use a simple filter in lvm.conf:
> 
>     devices {
>       filter = [ "a|^/dev/md.*|", "r|.*|" ]
>     }
> 
> Upon upgrading from lvm-2.02.106 to 2.02.129, commands like lvdisplay
> and lvs dramatically slowed down. Investigating, we found the filter
> wasn't excluding the unwanted devices anymore: they were being scanned
> despite being explicitly excluded.
> 

I'll check it, thanks for the report...

-- 
Peter
