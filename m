Message-ID: <5371C64C.2010907@redhat.com>
Date: Tue, 13 May 2014 09:14:20 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAAKRE72CA+c2waO_g5xAdyocB58UvzUgqi26RQUGZZTe0TAVog@mail.gmail.com>
In-Reply-To: <CAAKRE72CA+c2waO_g5xAdyocB58UvzUgqi26RQUGZZTe0TAVog@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] /dev/mapper entries
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
To: LVM general discussion and development <linux-lvm@redhat.com>, unix.co@gmail.com

On 05/13/2014 07:53 AM, Umar Draz wrote:
> Hi All
>
> I have 2 systems where I have shared SAN sotrage, I am using LVM without
> cluster.

Hello Umar,
which version of lvm and what distribution? There is lvmetad in newer 
versions of LVM and you may need to rescan PVs (pvscan --cache $PV)

However using shared storage without cluster locking is nothing but 
asking for trouble...

It is advised to either partition the storage (set zones or whatever the 
SAN allows) or to set global_filter/filter on both machines so each of 
the machines sees only appropriate LUNs it is intended to see and use.

Regards,

-- Martian

>
> If I create a logical volume on server1 and then on server2 (vgchange
> --refresh or vgchange -a y) I can get that logical volume on server2 as
> well.
>
> The same thing I am using on volume deletion e.g.
>
> If I remove volume from server1 its properly remove the volume and also all
> of its entries, and then I refresh the volume group on server2 its also
> refresh its self but a entry in /dev/mapper not removing
>
> how to refresh this /dev/mapper/ on other server while deleting volumes
>
> Br.
>
> Umar
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
