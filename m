References: <BAY178-W67E32E6735DBEBEEBD19B94760@phx.gbl>
	<20160516111416.GA26132@agk-dp.fab.redhat.com>
	<5739B5E2.2010704@redhat.com>
	<BAY178-W38A5B9B5EDECF13E1AAD8694490@phx.gbl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <cf884feb-3ba9-9baa-26bf-7c84555c64a1@redhat.com>
Date: Wed, 18 May 2016 10:21:41 +0200
MIME-Version: 1.0
In-Reply-To: <BAY178-W38A5B9B5EDECF13E1AAD8694490@phx.gbl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Merge
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
To: Tom Jay <tom_jay@hotmail.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On 18.5.2016 10:13, Tom Jay wrote:
> Hello, This question was in fact answered by the debian-kernel mailing list,
> who informed me that the documentation was probably wrong. The kernel does
> actually support merging volumes, just the 'dmsetup targets' output only
> refers to output from modules that are already loaded, not what is supported.
> Using 'lvconvert --merge' works without problems. This is the original thread:
> https://lists.debian.org/debian-kernel/2016/05/msg00186.html. Thanks! Tom

Hi

The issue is - properly compiled  'lvm2'  does  call 'modprobe' internally.
So if you have failing  'lvconvert --merge' because  snapshot-merge module
was not loaded and you will load it by your own modprobe call - then your lvm2 
tool is miscompiled (compiled without modprobe support...)

Regards

Zdenek
