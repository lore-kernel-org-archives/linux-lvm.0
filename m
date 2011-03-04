From: Koen Vermeer <koen@vermeer.tv>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
In-Reply-To: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
Date: Fri, 04 Mar 2011 22:49:07 +0100
Message-ID: <1299275347.11519.19.camel@green>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 03/03/2011 06:25 AM, Scott Arthur wrote: 
>  1      32.3kB  296MB   296MB   primary   ext4         boot 
>  2      296MB   1000GB  1000GB  extended
>  5      296MB   1000GB  1000GB  logical                lvm
> I'm obviously wanting to expand the LVM partition to fill the
> remaining 1TB of space.

I'm just a regular LVM user and maybe I'm misunderstanding you, but why
not simply add partition #2 as a physical volume? I thought that was one
of the advantages of LVM: not having to worry about that kind of thing.

Best,
Koen
