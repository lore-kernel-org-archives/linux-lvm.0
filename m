Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m328NFNW028554
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 04:23:15 -0400
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m328MrYv024914
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 04:22:54 -0400
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id 88C1D331B72
	for <linux-lvm@redhat.com>; Wed,  2 Apr 2008 10:22:47 +0200 (CEST)
Received: from [192.94.163.17] (santalis.usr.xc.cesca.cat [192.94.163.17])
	by carlit.cesca.es (Postfix) with ESMTP id 5B63C332056
	for <linux-lvm@redhat.com>; Wed,  2 Apr 2008 10:22:47 +0200 (CEST)
Message-ID: <47F341B2.2080100@cesca.es>
Date: Wed, 02 Apr 2008 10:20:02 +0200
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Questions
References: <C35C6F42A97E0C468C32F3AEE46CFF640401D788@digiexch03.iodigi.ioroot.tld>
In-Reply-To: <C35C6F42A97E0C468C32F3AEE46CFF640401D788@digiexch03.iodigi.ioroot.tld>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
You could still use raid using pvmove: You could create a raid and then 
use pvmove to relocate data present on your disk to your new raid device.

cheers,
Jordi


Nicholas Muguira wrote:
>
> I am trying to judge the ability of LVM to address a problem I 
> currently have, and I have few questions:
>
> 1) Is there a way to configure LVM so that the data on remaining PV�s 
> in a VG are is accessible after a PV fails?
>
> 2) Is there a way to configure LVM so that the LV will still be 
> accesible and readable/writable if a PV fails while in use?
>
> 3) Assuming groupings of external drives, can a LV be created and 
> exported on each group of the same name and then imported into 
> different systems. For example assuming 10 drives, drives a-e are in 
> group 1 and drives f-j are in group 2. Using System A with drives a-e 
> connect to /dev/sda-e create a parittion that spans the entire drive 
> for each drive. Create a PV on each partition (/dev/sd[a-e]1). Create 
> a VG named test with all partitions (/dev/sd[a-e]1). Create a LV that 
> covers all of the VG test. Mount the LV and format it (ext3 in this 
> case). Umount and vgexport the vg test. Repeat the steps with drives 
> f-j with same VG and LV names. Connect group 1 to System B and 
> vgimport VG test, create LV with it and mount the filesystem. Umount 
> the filesystem and disconnect group1. Connect group 2 to System B and 
> vgimport VG test and mount the filesystem (using LV previously created)?
>
> Raid is unavailable due to already deployed hardware, and I realize 
> that LVM is not Raid and will not give me a means to recover the data 
> on the failed HDD.
>
> Thanks,
> Nick
>
> This email and any files transmitted with it are confidential and are 
> intended solely for the use of the individual or entity to whom they 
> are addressed. If you are not the original recipient or the person 
> responsible for delivering the email to the intended recipient, be 
> advised that you have received this email in error, and that any use, 
> dissemination, forwarding, printing, or copying of this email is 
> strictly prohibited. If you received this email in error, please 
> immediately notify the sender and delete the original.
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
......................................................................
         __
        / /          Jordi Prats
  C E / S / C A      Dept. de Sistemes
      /_/            Centre de Supercomputaci� de Catalunya

  Gran Capit�, 2-4 (Edifici Nexus) � 08034 Barcelona
  T. 93 205 6464 � F.  93 205 6979 � jprats@cesca.es
...................................................................... 
