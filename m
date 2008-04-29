Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3T9HrZx029506
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 05:17:53 -0400
Received: from cluster-f.mailcontrol.com (cluster-f.mailcontrol.com
	[85.119.2.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3T9HZcL011750
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 05:17:36 -0400
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly32f.srv.mailcontrol.com (MailControl) with ESMTP id
	m3T9HLfT025016
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:17:23 +0100
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id KAA21334
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 10:28:46 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] How to move /usr from LVM back to non-LVM?
Date: Tue, 29 Apr 2008 10:17:09 +0100
Message-ID: <A374F37068535C46BFCF8D48CF29AA7F0116E3A2@zen.zetex.com>
From: "Karl Wagner" <kwagner@zetex.com>
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

At work, I'm stuck with the static partitions on the current servers, till =
I do a rebuild on new hardware at least ;)

My own home server uses 4xHDD with the same partition layout.
sdX1: MD RAID1, 1GB /boot
sdX2: MD RAID10, 5GB /
sdX3: MD RAID10, 20GB LVM for;
		/usr
		/var
sdX5: 50GB LVM for;
		/tmp (striped)
		Some exported AoE and iSCSI volumes
sdX6: rest of disk, MD RAID5, dm-crypt and LVM for data (including /home)

I know it's convoluted, but it works. I wish I had done dm-crypt on top of =
the LV's now rather than LVM on dm-crypt. It is not too slow, but I don't n=
eed encryption for everything on there and I can't do anything about it now=
 (Think save up to replce them all with 1TB drives, now only =EF=BF=BD100 o=
n Ebuyer :D )

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of Charles Marcus
Sent: 28 April 2008 19:36
To: LVM general discussion and development
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?

On 4/28/2008, Georges Giralt (georges.giralt@free.fr) wrote:
> The fisrt one,  small will be used for /boot
> The second one for everything else using LVM.=20

Actually, I should have gone ahead and mention how I usually do it...

/boot (100MB)
/ (10GB - I know, but disks are cheap these days)
swap (1GB)
/tmp (1GB)

Then LVM for:

/home
/var

--=20

Best regards,

Charles

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 This has been checked by www.blackspider.com=20


_________________________________________________________

Zetex Semiconductors - Solutions for an analog world.

http://www.zetex.com
http://www.zetex.cn

E-MAILS are susceptible to interference.  You should not assume that
the contents originated from the sender or the Zetex Group or that they=20
have been accurately reproduced from their original form.
Zetex accepts no responsibility for information, errors or omissions in
this e-mail nor for its use or misuse nor for any act committed or
omitted in connection with this communication.
If in doubt, please verify the authenticity with the sender.
_________________________________________________________

=20
