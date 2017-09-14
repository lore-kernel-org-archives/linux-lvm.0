Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <13f08f25-6b16-e930-b609-4cd2799b08da@yahoo.co.uk>
Date: Thu, 14 Sep 2017 09:58:11 -0500
Message-Id: <666DE320-FD89-4208-8056-DB6AA4F370B1@redhat.com>
References: <13f08f25-6b16-e930-b609-4cd2799b08da@yahoo.co.uk>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] raid & its stripes
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Seems strange on the surface.  Would you mind posting the layout of each?  ‘lvs -a -o +devices’

 brassow

> On Sep 13, 2017, at 8:53 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
> 
> hi boys, girls
> 
> man page reads: -i ...This is equal to the number of physical volumes to scatter the  logical  volume data....
> I wonder, when I do not use -i while creating an LV with 10 phy devs.
> 
> $ lvcreate -n raid0.A --type raid0 -I 16 -l 97%pv
> 
> a dbench would show:
> $ dbench -t 60 20
> ...
> Throughput 112.309 MB/sec  20 clients  20 procs  max_latency=719.409 ms
> 
> Yet when I say: this many stripes:
> 
> $ lvcreate -n raid0.A --type raid0 -I 16 -i 10 -l 97%pv
> 
> dbench:
> ...
> Throughput 83.2822 MB/sec  20 clients  20 procs  max_latency=816.027 ms
> 
> And though the results would vary, xfs, a dbench for LV with no -i as an argument(which LVM chooses then to be 2) would always look better.
> And I thought, as in the manual, always make stripes to go to all phy devices.
> 
> Question - is there some "little" magic LVM does? And if yes then how/what it is?
> many thanks, L.
> 
> .
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
