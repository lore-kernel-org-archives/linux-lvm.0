Message-ID: <51E84268.6030000@redhat.com>
Date: Thu, 18 Jul 2013 21:30:48 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1374167576.23440.3.camel@heisenberg.scientia.net>
In-Reply-To: <1374167576.23440.3.camel@heisenberg.scientia.net>
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

Dne 18.7.2013 19:12, Christoph Anton Mitterer napsal(a):
> Hi.
>
> I just stumbled across that LVM nowadays also supports higher RAID
> levels?
>
> Is this "just" reusing the MD code... or is it a new implementation?

reuse


>
> Does using it provide any advantages (i.e. performance) other than using
> the same userland tools... and perhaps greater flexibility in where the
> PEs for a RAID come from (which may be pretty arbitrary with LVM, and is
> always some devices for MD)... not that I'd say that such "flexibility"
> is really useful.

yep stacking of LVs
However some other features available in mdadm are missing in lvm
(i.e. array reshape)


> Is there any larger documentation available on what happens with the
> RAID levels and the other segtypes? I couldn't find basically
> anything... I mean things like mirror/striped are probably clear... but
> free, error, etc.?


https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/raid_volumes.html


Zdenek
