References: <CAGbvivL=9LQJJ=D9j_uJgrZ_Sv=h=C2Th1-=bQARoxwvyC_afQ@mail.gmail.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <c853a9c2-14e1-d4eb-d6a9-7bc90fb9bcfc@redhat.com>
Date: Wed, 30 May 2018 12:49:41 +0200
MIME-Version: 1.0
In-Reply-To: <CAGbvivL=9LQJJ=D9j_uJgrZ_Sv=h=C2Th1-=bQARoxwvyC_afQ@mail.gmail.com>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Device XXX excluded by a filter - why??
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>

On 05/23/2018 05:53 PM, Wyllys Ingersoll wrote:
> Using the following lvm2 version on Ubuntu 16.04.3 running kernel 4.16.03
>    LVM version:     2.02.176(2) (2017-11-03)
>    Library version: 1.02.145 (2017-11-03)
>    Driver version:  4.37.0
> 
> ceph-volume attempts to create a VG on a raw block device to use as a
> bluestore OSD.  The command it uses looks like this:
> 
> vgcreate --force --yes ceph-a637b0e7-e54f-4fe9-8afc-a74671d94f6e /dev/sdi
> 
> The disk (/dev/sdi) in this case is a blank (no partition table) GPT
> label 3.7T drive.

So is it a GPT device or not? If yes, it HAS a partition table after 
all, and LVM filters such devices out, even if the partition table is empty.

Run `wipefs -a /dev/sdi` first to remove any FS/GPT signatures.

-- Martian
> 
> vgcreate complains and fails:
>       stderr: Device /dev/sdi excluded by a filter.
> 
> I cannot figure out what "filter" is causing this.  The global_filter
> in lvm.conf is wide open:
> filter = [ "a|.*/|" ]
> 
> Turning up debug logging does not show any additional reasons.
> Repeatedly running pvscan or vgscan to update the cache does not fix
> it either.
> 
> What could be blocking this device from being used?
> 
> thanks,
>     Wyllys Ingersoll
>     Keeper Technology, LLC
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
