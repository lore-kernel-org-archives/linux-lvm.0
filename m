References: <cc1e366b92c320a306f5bd0aa2ec04d6@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <91c96949-ec5c-04f2-b198-368f1e04e957@redhat.com>
Date: Mon, 20 Jan 2020 10:22:12 +0100
MIME-Version: 1.0
In-Reply-To: <cc1e366b92c320a306f5bd0aa2ec04d6@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Time needed for take a snapshot
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 19. 01. 20 v 13:59 Gionatan Danti napsal(a):
> Hi list,
> just for confirmation: is the time needed to take a snapshot constant, or does 
> it depend on how many chunks are mapped in/by the specific thin pool and 
> volume? In other workds, is snapshot create time O(1) or O(n)?

Hi

Depends on what you are asking -  in lvm2 - unfortunately some parts of the 
code are sometimes even O(n^2) - so the more LVs are in VG - the 'heavier' the 
operation gets.

So having  thousands of LVs in a single VG will become probably your bottleneck.

The bTree mapping in kernel will probably be less problematic here.

Regards

Zdenek
