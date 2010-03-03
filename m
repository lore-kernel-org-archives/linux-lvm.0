Message-ID: <4B8E4C90.6050603@klunky.co.uk>
Date: Wed, 03 Mar 2010 12:48:32 +0100
From: J4 <junk4@klunky.co.uk>
MIME-Version: 1.0
References: <4B8E3D56.50703@klunky.co.uk> <4B8E47DD.6070502@redhat.com>
In-Reply-To: <4B8E47DD.6070502@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] System won't create devices from volume group :
 advice on dmsetup create command required (or alternative solution)
Reply-To: junk4@klunky.co.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dear Milan,

	Marvellous. This solved the problem.

Many thanks and best wishes, J.

Milan Broz wrote:
> On 03/03/2010 11:43 AM, J4 wrote:
>> # vgchange -a y mds
> ...
>> # ls /dev/mapper | grep mds
>> brw------- 1 root root 253, 11 Mar  3 11:17 /dev/mapper/mds-mds
> 
> So the only LV name "mds" there is properly activated.
> 
> LVM will not activate partitions on the LV automatically,
> but you can use "kpartx" utility to do that (see man kpartx).
> 
> Try "kpartx -a /dev/mds/mds"
> 
> (before deactivating LV you will need run kpartx -d to remove these
> partition mappings again.)
> 
> Milan
