Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3CKjfO18528
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 16:45:41 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3CKjYGi004531
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 16:45:35 -0400
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: SUMMARY: Re: [linux-lvm] VGs not detected at startup
Date: Tue, 12 Apr 2005 22:45:10 +0200
Message-Id: <20050412203848.M26761@pk25.com>
In-Reply-To: <20050406091824.M19941@pk25.com>
References: <20050406091824.M19941@pk25.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: markus.wiedmer@stud.fhbb.ch

Hi finally I find the problem.

In one of my night delete checkroot.sh, I resolve using from the other linux
but it was some diferent, finally the script don't mount /proc and the system
was unable to mount and detect the VG's.

I download the pakage from debian and get the correct version, now all runs ok.

Thank you for nothing, nobody to answer me. :-).

On Wed, 6 Apr 2005 12:02:34 +0200, Diaz Rodriguez, Eduardo wrote
> Hi, I�m running lvm 1.0.8, on kernel 2.4.30, but I have problems with
> detecting the VGs. Immediately after bootup, vgscan returns: no 
> volume groups found I find very similar same problem that:
> 
> https://www.redhat.com/archives/linux-lvm/2004-November/msg00028.html
> https://www.redhat.com/archives/linux-lvm/2004-November/msg00033.html
> 
> I am running lvm10 in debian linux with kernel 2.4.30
> 
> The problem are that boot process, (the rcS.d S27lvm) don't detect 
> any vgs but, after of some trys I must create a workarround and 
> startup the script after of
> 
> S35mountall.sh
> cat S36lvm_ayuda
> /sbin/vgscan
> /sbin/vgchange -a y
> /bin/mount �a
> 
> Yesterday the lvm script runs well but I think that the problem can 
> be change the kernel version (I change from 2.4.28 to 2.4.30)..
> 
> The problem was, I change the kernel version, after of boot, for 
> accident I write the checkroot.sh with checkfs.sh, a reboot, (many 
> fails) I use a knoppix for start the disk a recover from a very 
> similar system (debian stable too with lvm too).
> 
> After of this, lvm startup script never see any vgs but I exec the 
> lvm script too after of S35mountall.sh the script runs well.
> 
> I change some information of SCSI modules (for my usb-disk  �but 
> this disk don�t run in lvm only have ATA disk /dev/hdb1 and 
> /dev/hdd1� ) for start as modules. But I don�t remember that,
>  because I think that this can bee easy. The kernel version was 
> compiling well. But after the reboot I see the problem. I try exec 
> vgscan �v, (putting in the scripts) but in boot process for any 
> information but nothing
> 
> A very fanny night working at 4:00 AM :-)
> 
> If anypeople need more data don�t dude said me I sent the output of 
> the commands
> 
> mounts
> /dev/hda2 on / type ext3 (rw,errors=remount-ro)
> /dev/hdc1 on /datos type reiserfs (rw)
> /dev/hda3 on /backup/disco1 type reiserfs (rw)
> proc on /proc type proc (rw)
> /dev/vgdatos/vlortofotos on /datos_ortofotos type xfs (rw)
> 
> I any want's can contact with me in messenger at ediaz NOSPAM AT 
> pk25 dot com
> 
> Any help is very appreciate
> 
> P.D Sorry for my English, I am from spain
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=======================================================================================
La teta que la mano no cubre, no es teta sino ubre.
		-- An�nim. 
=======================================================================================
