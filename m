Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3T9dtGD007808
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 05:39:55 -0400
Received: from wmproxy1-g27.free.fr (wmproxy1-g27.free.fr [212.27.42.91])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3T9dcsj024118
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 05:39:39 -0400
Received: from imp4-g19.priv.proxad.net (imp4-g19.priv.proxad.net
	[172.20.243.46])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id 503F41FE4B
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 11:39:25 +0200 (CEST)
Message-ID: <1209461962.4816ecca4f0f2@imp.free.fr>
Date: Tue, 29 Apr 2008 11:39:22 +0200
From: Georges Giralt <georges.giralt@free.fr>
Subject: RE: [linux-lvm] How to move /usr from LVM back to non-LVM?
References: <A374F37068535C46BFCF8D48CF29AA7F0116E3A2@zen.zetex.com>
In-Reply-To: <A374F37068535C46BFCF8D48CF29AA7F0116E3A2@zen.zetex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Karl,
If I may,
As you've 4 HDD here what I would do :
Get 2 for system files :
2 part on each of them
1) small 200 MB
2) the remaining.
Set up MD raid on the 2 first partition, use as /boot
Set un md raid partition of the 2 other, us as LVM onto which you put
 lv 1 /
 lv2 /tmp
 lv3 /usr
 lv4 /var
LV5 swap

Get the 2 remaining disks and set only one partition on them,
MD mirror the 2 partiton and set up a LVM on the md.
create lv as needed for /home, database storage area, whatever is needed.

If ons disk dies on you, you can use the remaing for the whole function dur=
ing
repair time.
When the disk has been replaced, you've only to re-sync the md 's it was
supporting and "everithing's fine".
As LVM is concerned, the software mirror is transparent and goes unnoticed.
If the whole server crash, you can get the user data disks onto another ser=
ver
and import the LVM to make the data availlable again. This may be planned by
exporting the LVM data in advance (if you've similar servers (same tools, b=
ut
maybe different application) )
Hope this helps.
Selon Karl Wagner <kwagner@zetex.com>:

> At work, I'm stuck with the static partitions on the current servers, til=
l I
> do a rebuild on new hardware at least ;)
>
> My own home server uses 4xHDD with the same partition layout.
> sdX1: MD RAID1, 1GB /boot
> sdX2: MD RAID10, 5GB /
> sdX3: MD RAID10, 20GB LVM for;
> 		/usr
> 		/var
> sdX5: 50GB LVM for;
> 		/tmp (striped)
> 		Some exported AoE and iSCSI volumes
> sdX6: rest of disk, MD RAID5, dm-crypt and LVM for data (including /home)
>
> I know it's convoluted, but it works. I wish I had done dm-crypt on top of
> the LV's now rather than LVM on dm-crypt. It is not too slow, but I don't
> need encryption for everything on there and I can't do anything about it =
now
> (Think save up to replce them all with 1TB drives, now only =EF=BF=BD100 =
on Ebuyer :D
> )
>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
On
> Behalf Of Charles Marcus
> Sent: 28 April 2008 19:36
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
>
> On 4/28/2008, Georges Giralt (georges.giralt@free.fr) wrote:
> > The fisrt one,  small will be used for /boot
> > The second one for everything else using LVM.
>
> Actually, I should have gone ahead and mention how I usually do it...
>
> /boot (100MB)
> / (10GB - I know, but disks are cheap these days)
> swap (1GB)
> /tmp (1GB)
>
> Then LVM for:
>
> /home
> /var
>
> --
>
> Best regards,
>
> Charles
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>  This has been checked by www.blackspider.com
>
>
> _________________________________________________________
>
> Zetex Semiconductors - Solutions for an analog world.
>
> http://www.zetex.com
> http://www.zetex.cn
>
> E-MAILS are susceptible to interference.  You should not assume that
> the contents originated from the sender or the Zetex Group or that they
> have been accurately reproduced from their original form.
> Zetex accepts no responsibility for information, errors or omissions in
> this e-mail nor for its use or misuse nor for any act committed or
> omitted in connection with this communication.
> If in doubt, please verify the authenticity with the sender.
> _________________________________________________________
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


--=20
