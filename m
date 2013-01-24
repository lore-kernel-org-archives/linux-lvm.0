Message-ID: <5100C5E5.8040603@redhat.com>
Date: Thu, 24 Jan 2013 06:25:57 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <51004E73.9080902@tum.de>
In-Reply-To: <51004E73.9080902@tum.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgremove fails to remove empty VG (v2.02.98)
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
Cc: Joschi Brauchle <joschi.brauchle@tum.de>

On 01/23/2013 09:56 PM, Joschi Brauchle wrote:
> Hello,

Hello!

>
> I get the following error with lvm2.02.98:
> -----------
> #/sbin/vgdisplay --units k -v 'system'
>
> --- Volume group ---
> VG Name system
> System ID
> Format lvm2
> Metadata Areas 1
> Metadata Sequence No 13
> VG Access read/write
> VG Status resizable
> MAX LV 0
> Cur LV 0
> Open LV 0
> Max PV 0
> Cur PV 1
> Act PV 1
> VG Size 104669184.00 KiB
> PE Size 4096.00 KiB
> Total PE 25554
> Alloc PE / Size 0 / 0 KiB
> Free PE / Size 25554 / 104669184.00 KiB
> VG UUID Qs0uaZ-L88n-tC7T-fZQj-sgJY-2yRX-Dlt2Cr
>
> --- Physical volumes ---
> PV Name /dev/sda3
> PV UUID wzGjXi-F2lT-d2d4-l5a6-EmfM-W838-YxaFIh
> PV Status allocatable
> Total PE / Free PE 25554 / 25554
> -----------
>
> VG system is empty, but still:
> -----------
> # /sbin/vgremove 'system'
> -----------
> failes with status code 5, which means 'can't remove volume group
> containing logical volumes' (from man page).
>


> Looks like a bug in vgremove?

Possibly. Could you fill in these gaps in the puzzle:

0. Which distro?

1. Do a lvmdump for bug report:

     lvmdump -ma

2. Try with verbose

     vgremove -vvvv &> vgremove-dirty.out

3. Check if lvmetad is running:

     ps aux | grep lvmetad

3.1 if so, the issue is likely to go away after restarting it. If you 
`gcore` or `kill -SEGV` it to get a core dump it may help us.

3.2 do another lvmdump here, to get "updated" data after lvmdump restart

3.3 retry vgremove

     vgremove -vvvv &> vgremove-reloaded.out

4. pastebin the vgremove-dirty.out and we will be able to tell more then.

>
> Best regards,
> J Brauchle
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
