Return-Path: <Tony.Rogers@fleet.gecapital.com>
Message-ID: <4FE1C7F276C8D411A40C00508BCF0E8202C0F904@UKMANMP02CFLSGE>
From: "Rogers, Tony (CAP, FLEET)" <Tony.Rogers@fleet.gecapital.com>
Date: Tue, 12 Jun 2001 17:33:39 +0100
MIME-Version: 1.0
Subject: [linux-lvm] FW: re: Upgrading to Mandrake 8.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> Hello,
> 
> Please forgive the format of this mail, but I have had to cut and paste
> between mail systems!
> 
> I don't know if you have got any further with this problem, but I have had
> similar issues, and have overcome them (kind of).
> 
> I did a clean install of Mandrake 8.0 with /usr on an LV created at
> install time. All filesystems other than boot (ext2) were reiserfs (/ and
> /usr).
> 
> This worked fine, until I decided to experiment with reiserfs on a new
> Volume Group, as I have not had any real experience of Reiserfs yet, and I
> wanted to play somewhere safe.
> 
> I created a new VG from some spare partitions on a couple of SCSI disks -
> I'll spare the details unless someone wants more - and created an LV on
> this. I then created a reiserfs on top of this, and mounted and resized it
> (I was just generally playing with it). No problems, so I went to bed.
> 
> Imagine my surprise when I booted a day or two later and it errored on the
> vgchange as described below during the boot process.
> 
> The solution - /usr which was reiserfs on the first LV was OK, but my test
> LV / VG would not start, so as I had no data to lose I changed the
> partition type back to standard Linux, and rebooted.
> 
> As LVM found nothing on those partitions, it booted perfectly with /usr
> working just fine. I changed the partition types and then did a -ff
> pvcreate which worked. LVM was working again! I rebooted and ... the same
> problem.
> 
> Something else was required. I did the same trick with the partitions, and
> this time I removed the second VG (called lvmtest - is there anything
> special about this name? Is it reserved?).
> 
> I then created new PV / VG (with a new name) and LV, and it has worked
> fine ever since.
> 
> I have no real explanation for this, but am simply relaying the info, in
> case it is useful to anyone. You may not be happy with the destructive
> recovery technique that I used!!!
> 
> Regards, Tony.
> 
> ============================
> 
> 
> Mandrake 8.0's LVM have many probleme (ver 0.9)
>  I've create my LVM and when I reboot vgchange do an Ooops.
> 
>  I will update to LVM 0.9.1 beta 7 !
> 
> 
>  Le Dimanche 27 Mai 2001 00:38, vous avez crit :
>  > Have you actually used mandrake 8.0 already?
>  >
>  > Unless you have some good reason to do so, ie not mere
>  > upgrade-fever, stay with 7.2
>  >
>  > Believe me... 8.0 is still "cooker" they just *had* to
>  > release it for wider testing...
>  >
>  > But LVM-wise, I havn't a clue that would help you do the upgrade.
>  > However, I did try going from 7.1 to 7.2 and it broke BADLY!
>  >
>  > Best bet is to reinstall not upgrade.
>  >
>  > > -----Original Message-----
>  > > From: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]On
>  > > Behalf Of Diederick van Dijk
>  > > Sent: Sunday, May 27, 2001 9:37 AM
>  > > To: linux-lvm@sistina.com
>  > > Subject: [linux-lvm] Upgrading to Mandrake 8.0
>  > >
>  > >
>  > > Hi,
>  > >
>  > > I've Mandrake 7.2 with LVM 0.9.1-beta7 installed on one volume group.
> My
>  > > logical volumes are reiserfs formatted. Upgrading to Mandrake 8.0
> fails
>  > > because the standard upgrade program doesn't recognize my volume
>  > > group very
>  > > well. Has someone succeeded in upgrading ?
>  > >
>  > > Thanks,
>  > >
>  > > Diederick
>  > > _______________________________________________
>  > > linux-lvm mailing list
>  > > linux-lvm@sistina.com
>  > > http://lists.sistina.com/mailman/listinfo/linux-lvm
>  > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>  >
>  > _______________________________________________
>  > linux-lvm mailing list
>  > linux-lvm@sistina.com
>  > http://lists.sistina.com/mailman/listinfo/linux-lvm
>  > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
>  -- 
>  Olivier Thauvin-CNRS Service Aeronomie
>  olivier.thauvin@aerov.jussieu.fr 
>  Tlphone:
>  01 64 47 43 60  Verrires (lundi,mercredi et vendredi)
>  01 44 27 47 59  Jussieu (Mardi et Jeudi)
> 
> 
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@sistina.com
>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
