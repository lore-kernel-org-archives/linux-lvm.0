References: <90473b46-274c-55af-3887-f058f2cf05dd@gmail.com>
	<6dc75647-bec9-564d-23fa-aeb626678cf6@redhat.com>
	<45bbdff9-b88c-4533-8aa5-9976564ed2bf@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d33355bb-51aa-992d-2ab9-9ef2641a119b@redhat.com>
Date: Mon, 26 Nov 2018 12:40:40 +0100
MIME-Version: 1.0
In-Reply-To: <45bbdff9-b88c-4533-8aa5-9976564ed2bf@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM RAID: task mdX_raid1:221 blocked for more than
	120 seconds
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Cesare Leonardi <celeonar@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-raid@vger.kernel.org

Dne 26. 11. 18 v 12:31 Cesare Leonardi napsal(a):
> Resending, I erroneusly replied only to Zdenek, sorry.
> 
> 
> 
> I can provide details about this, that was filed by me:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913119
> 
> It's about a desktop PC, with two SSD (Samsung 850 EVO) on which i build RAID1 
> using LVM.
> # pvs
>  � PV�������� VG� Fmt� Attr PSize��� PFree
>  � /dev/sdb3� vg0 lvm2 a--� <250,00g 15,98g
>  � /dev/sdc3� vg0 lvm2 a--� <250,00g 15,98g
> 
> # lvs
>  � LV��� VG� Attr������ LSize�� Pool Origin Data%� Meta%� Move Log Cpy%Sync 
> Convert
>  � home� vg0 rwi-aor--- 200,00g 100,00
>  � root� vg0 rwi-aor---� 30,00g 100,00
>  � swap0 vg0 rwi-aor---�� 4,00g 100,00
> 
> It's a desktop PC using Debian unstable, so it's rebooted quite often due to 
> frequent updates.

So you should probably start first with running latest available kernel - 4.19.

You also should collect 'dmesg' report

> The freezes happens during normal work, without any resizing or any 
> maintenance on LVM going on. Most of the time I noted the freeze while I was 
> using Thunderbird. But eventually they resolve by themself: I wait minutes and 

Aren't you running out-of-memory ?

Install some CPU/MEM monitoring service and watch out for problems
(AFAIK OOM doesn't really work on my machine - and often  FF + Thunderbird 
combo brings it to the state mouse barely moves and CPU spins in kswapd...)

> I've not noticed any corruption due to these freeze but often they are very 
> long and very impacting. The only reliable workaround found was to reboot with:
> scsi_mod.use_blk_mq=0 dm_mod.use_blk_mq=0

I doubt this have anything in common with this.

Regards

Zdenek
