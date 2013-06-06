Message-ID: <51B05859.5060708@redhat.com>
Date: Thu, 06 Jun 2013 11:37:29 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20130605020728.GA9658@gmail.com>
In-Reply-To: <20130605020728.GA9658@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Query on PE size
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
Cc: Kumar amit mehta <gmate.amit@gmail.com>

Dne 5.6.2013 04:07, Kumar amit mehta napsal(a):
> Hi,
>
> I see that a VG will set the default PE size to 4MiB, i.e.
> 4 * 1024 * 1024 = 4194304
> (Please correct me if I'm wrong)
>
> <snip>
> # pvcreate /dev/vdc1
> # vgcreate testvg /dev/vdc1
> # vgdisplay
> # vgdisplay testvg|grep "PE Size"
>     PE Size               4.00 MiB <----
> <snip>
>
> I see that :
> vgcreate()
>   -->vgcreate_params_set_defaults()
>     -->vp_def->extent_size = DEFAULT_EXTENT_SIZE * 2;
>
> Where DEFAULT_EXTENT_SIZE is #defined to 4096
> <snip from lib/config/defaults.h>
> #define DEFAULT_EXTENT_SIZE 4096        /* In KB */
> <snip from lib/config/defaults.h>
>
> This means that the default extent size being set is 8192, but as mentioned
> earlier,the default extent size as reported by 'vgdisplay' is 4 MiB. So Can
> someone please point me to the place where this conversion of 8192 into 4MiB
> is taking place in the code ?

Variables in the lvm source code which have suffix _size should keep the size 
in 512b block units ->  8192 * 512b block => 4MiB

Zdenek
