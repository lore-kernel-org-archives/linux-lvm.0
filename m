Message-ID: <4BA0516E.8060108@alteeve.com>
Date: Tue, 16 Mar 2010 23:50:06 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <4B9FDAB6.3000302@alteeve.com> <4B9FEF2D.4070608@redhat.com>
	<4BA04506.3060904@alteeve.com>
In-Reply-To: <4BA04506.3060904@alteeve.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Fixed! (was: Re: Two questions about cluster support (2
 problems, actually))
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
Cc: Milan Broz <mbroz@redhat.com>

On 10-03-16 10:57 PM, Digimer wrote:
> Thanks for the reply, Milan!
>
> I had made the change to the 'filter' argument, but I was using 'filter
> = [ "a|drbd.*|", "r|.*|" ]'. I switched to 'filter = [ "a|^/dev/drbd|",
> "a/sd*/", "r/.*/" ]' and started 'clvmd'. This seems to have solved the
> problem, so thank you.
>
> If I may ask another question though;
>
> My DRBD device is '/dev/drbd0' which sits on either node's
> '/dev/san0x/lv02'. When I ran 'pvcreate /dev/drbd0' the PV was created
> successfully and 'pvdisplay' shows the new PV on both nodes. However, I
> see this:
>
> # pvdisplay
> --- Physical volume ---
> PV Name /dev/sda2
> VG Name san02
> PV Size 465.51 GB / not usable 14.52 MB
> Allocatable yes
> PE Size (KByte) 32768
> Total PE 14896
> Free PE 1407
> Allocated PE 13489
> PV UUID ru7tmz-Qd4d-aatg-4ReY-TPPq-gMll-Z5ZOkL
>
> "/dev/san02/lv02" is a new physical volume of "399.99 GB"
> --- NEW Physical volume ---
> PV Name /dev/san02/lv02
> VG Name
> PV Size 399.99 GB
> Allocatable NO
> PE Size (KByte) 0
> Total PE 0
> Free PE 0
> Allocated PE 0
> PV UUID MjwXhY-T3dw-IUkI-ZdSI-FKEB-KJdq-nl9GUo
>
> Note that the 'PV Name' is '/dev/san02/lv02' but the device passed was
> 'pvcreate /dev/drbd0'. Is this correct? I'd expect it to show the DRBD
> device, not the DRBD's underlying logical volume.
>

I switched back to my old syntax and added an entry for 'sdX' devices, 
restarted clvmd on both nodes and every seems to be fine now! Here is my 
latest, working, filter line:

filter = [ "a|drbd.*|", "a|sd.*|", "r|.*|" ]

Thanks for the help! I'll be looking forward to testing out the fix in 
CentOS 5.5. :)

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
