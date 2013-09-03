Message-ID: <5225B49B.6050904@redhat.com>
Date: Tue, 03 Sep 2013 12:06:19 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <521871FD.8000700@mglug.de>
In-Reply-To: <521871FD.8000700@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] howto speed-up thinpool-devices?
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
Cc: Oliver Rath <rath@mglug.de>

On 08/24/2013 10:42 AM, Oliver Rath wrote:
> Hi list,
>
> Im using thinpool-devices (and snapshots, too). I know, thinpool-devices
> arent the fastest one, but maybe there could make more use of read (and
> maybe write) caching. In my test-system are 32GB of ram, but there is a
> max use of cache about <1GB, not more, by heavily use of these devices.

Buffers may be more relevant metric as the I/O among snapshots is 
"shared" on block device level.

I am using thin snapshots rather heavily (in VMs) and buffers are using 
13 GB of total 32 GB RAM on the machine (and it is not running@full 
load now)

Are you using FS on top of the thin devices?

-- Martian

>
> Is it possible to speed up the reading with growing up the cache use?
> The /sys/block/dm-X/.. directories have lots of parameters, but Im not
> experienced for that. Maybe Im looking at the wrong place and modifying
> kernel parameters (scheduler etc.) are the better way?
>
> Tfh!
> Oliver
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
