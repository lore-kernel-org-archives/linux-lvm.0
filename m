Message-ID: <3FC30F49.7010400@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] return from lvm2 to lvm
References: <3FC24C0F.7030701@mail.com>
In-Reply-To: <3FC24C0F.7030701@mail.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 25 02:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

guy cadoche wrote:

> I want to return to kernel-2.4 and as the patch for device-mapper is not 
> include in the kernel core, cannot mount the lvm disk.
> it search for device-mapper (modprobe) and not for lvm-mod
> I unmerge lvm2 and device-mapper...still the same.
> Is there a way to return to use lvm-mod under kernel-2.4.22 ???

Try doing a vgchange -a n, vgchange -a y to re-create the device nodes 
before you mount the LV. I went back from lvm2 to lvm1 and now I have to 
do this every restart. mkvgnodes does not help, BTW.

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
