Message-ID: <3EB6CC41.7020601@legato.com>
From: Daniel Barbar <dbarbar@legato.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can i extend a volumen bigger 256 gigas ?thx
References: <20030304114851.GA22965@hcsd.de> <3E64B885.1AF49EDA@silicide.dk> <20030304144121.GB23975@hcsd.de> <20030305143938.GI1513@gmx.de> <009601c3133d$fcdd24f0$ec36ca51@desi>
In-Reply-To: <009601c3133d$fcdd24f0$ec36ca51@desi>
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
Date: Mon May  5 15:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Yes, it is possible. What's the command you're using and the error 
you get? The maximum size of a logical volume is a function of the 
volume group physical extent size (I don't remember the details). 
You may need to create the volume group with a larger physical 
extent in order to have larger capacity logical volumes, for 
instance, 'vgcreate -s 16m ...'. As far as I know, you do have to 
recreate the volume group in order to change the physical extent 
size. Hope this helps.

---
Daniel Barbar

fnt wrote:
> Hello,
> 
> It is possible to extend a volumen more than 256 gigas?
> it doesnt let me grow the space.
> this is muy info :
> root]# cat /proc/lvm/global
> LVM module LVM version 1.0.3(19/02/2002)
> 
> Total:  1 VG  2 PVs  1 LV (1 LV open 1 times)
> 
> Global: 449424 bytes malloced   IOP version: 10   1175 days 12:40:03 active
> 
> VG:  gl  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 294883328 /71993 total  113950720 /27820 used  180932608
> /44173 free
>   PVs: [AA] ide/host0/bus0/target0/lun0/part4 113950720 /27820   113950720
> /27820          0 /0
>        [AA] ide/host0/bus0/target1/lun0/part1 180932608 /44173          0 /0
> 180932608 /44173
>     LV:  [AWDL  ] vol1                     113950720 /27820    1x open
> 
> i have installed: lvm-1.0.1-2mdk.i586.rpm
> 
> thanks on advanced.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Daniel Barbar
