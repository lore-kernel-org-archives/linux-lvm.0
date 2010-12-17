Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBHLbKvq016436
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 16:37:20 -0500
Received: from nm11.bullet.mail.ird.yahoo.com (nm11.bullet.mail.ird.yahoo.com
	[77.238.189.64])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id oBHLbBSX021326
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 16:37:12 -0500
Message-ID: <488312.3765.qm@web87115.mail.ird.yahoo.com>
References: <4D0B9D71.3080602@gmail.com>
Date: Fri, 17 Dec 2010 21:37:10 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <4D0B9D71.3080602@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Conflicting vg names but can't rename one
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

You could try using vgimportclone, eg:
vgimportclone -n newvgname /dev/sdb

(replacing /dev/sdb with your new device name obviously)
vgimportclone works by setting up its own little lvm environment where only 
/dev/sdb exists so it shouldn't get confused by the preexisting VG (which 
presumably has the active LVs that are causing lvm to get confused)

Doesn't explain why it doesn't work in the first place though

chris




----- Original Message ----
> From: Mauricio Tavares <raubvogel@gmail.com>
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Sent: Friday, 17 December, 2010 17:27:13
> Subject: [linux-lvm] Conflicting vg names but can't rename one
> 
>     I took a drive from an ailing machine to suck the data out of  it. This 
>drive used to be part of a single drive LVM. Now, when I connect it to  my 
>machine, I realized I had named that vg the same name I had used in the vg I  
>have in my desktop associated with just one drive,
> 
> vgdisplay  export
>   WARNING: Duplicate VG name export: Existing  
>fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes precedence over  
>SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>   --- Volume group ---
>    VG Name               export
>   System  ID
>   Format                 lvm2
>   Metadata Areas        1
>   Metadata  Sequence No  2
>   VG Access              read/write
>   VG Status              resizable
>   MAX LV                 0
>   Cur LV                 1
>   Open LV               1
>    Max PV                0
>   Cur  PV                1
>   Act  PV                1
>   VG  Size               465.76 GiB
>   PE  Size               4.00 MiB
>   Total  PE              119234
>   Alloc PE /  Size       102400 / 400.00 GiB
>   Free  PE /  Size       16834 / 65.76 GiB
>   VG UUID                 fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB
> 
> We see that  UUID  fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB is the drive/vg in 
>use while UUID  SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D is the extra drive I just 
>attached to my  machine. So I thought on using vgrename to change the name of 
>the extra drive's  vg so I can mount it:
> 
> vgrename SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D  export1
>   WARNING: Duplicate VG name export: Existing  
>fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes precedence over  
>SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>   WARNING: Duplicate VG name  export: Existing 
>fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes  precedence over 
>SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>   WARNING:  Duplicate VG name export: fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB 
>(created here)  takes precedence over SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>   Volume  group "export" still has active LVs
> 
> What am I missing here? I thought if  I told it to rename the vg with a given 
>uuid I would be golden. As you can see,  that is not the  case.
> 
> _______________________________________________
> linux-lvm  mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


      
