Subject: Re: [linux-lvm] lvm/devfs bug?
From: rich turner <rich@storix.com>
In-Reply-To: <20030408203324.A13056@uk.sistina.com>
References: <1049829705.2312.16.camel@rich> 
	<20030408203324.A13056@uk.sistina.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1049832381.1028.17.camel@rich-laptop>
Mime-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Apr  8 15:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

sorry, my mistake. i copied it from many different attempt sources. all
references should be sda not sda1 because the pv will be located on the
entire disk not a partition

On Tue, 2003-04-08 at 12:33, Alasdair G Kergon wrote:
> On Tue, Apr 08, 2003 at 12:21:45PM -0700, Rich Turner wrote:
> > the entire disk /dev/sda1
> > # pvcreate -ff -v /dev/sda1
> > pvcreate --device "/dev/sda" has a partition table
> > # dd if=/dev/zero of=/dev/sda bs=1024 count=10
> > # blockdev --rereadpt /dev/sda
> > # sfdisk -R /dev/sda1
>  
> Confusion between
>   /dev/sda  and
>   /dev/sda1 ?
> 
> Alasdair
> -- 
> agk@uk.sistina.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
