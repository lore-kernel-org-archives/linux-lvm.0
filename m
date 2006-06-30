Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UKf8Wr010346
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 16:41:08 -0400
Received: from bulimba.hst.terra.com.br (bulimba.hst.terra.com.br
	[200.176.10.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5UKekm9013354
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 16:40:47 -0400
Received: from calabona.hst.terra.com.br (calabona.hst.terra.com.br
	[200.176.10.5])
	by bulimba.hst.terra.com.br (Postfix) with ESMTP id 6D431130C09E
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 17:40:45 -0300 (BRT)
Received: from [10.0.0.38] (unknown [200.168.58.218])
	(authenticated user minicom024)
	by calabona.hst.terra.com.br (Postfix) with ESMTP id EEB061BD40D3
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 17:40:44 -0300 (BRT)
Message-ID: <44A58CB3.6080700@minicom.com.br>
Date: Fri, 30 Jun 2006 17:42:27 -0300
From: Du <eduardo@minicom.com.br>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2 VG's in separated HD's
References: <44A530AA.7040506@minicom.com.br> <44A5402F.8020903@conterra.de>
In-Reply-To: <44A5402F.8020903@conterra.de>
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

Dieter St�ken wrote:
> Du wrote:
>   
>> I put another HD on my box to test with LVM, my primary HD is working
>> all with LVM and a VG called vg_root. When I initialize and create a VG
>> in the secondary HD, works well, I create a LV, perfectly...but when I
>> reboot...donno what happens but the sistem doesnt initialize INIT, and
>> send me a BusyBox (Debian).
>>
>> And then I must mount the root LV, chroot to it and fdisk to erase the
>> secondary HD, and reboot. Otherwise it doenst starts INIT.
>>
>> Does anybody knows what's happening?
>>     
>
> what do you mean by "doenst starts INIT"? Is the kernel not found
> (a LILO or GRUB problem) or does "init" not find the root partition?
> Or was the LV-partition, you created, not found?
>   

The 'init' in root partition wasnt found.
> Are both disks connected to the same controller?
>   
The 2 disks are in the same controller yes!! Is this the problem?
> Are they IDE or SATA disks?
>   
IDE disks
> If you have several disk controllers on board, you may be
> surprised to find /dev/hda1 turning into /dev/hde1, as
> the sequence of your different controllers is not necessary
> stable, if you connect additional disks.
>
> BTW: why do you want an new VG? Why not expanding your current
> VG by a new disk?
>   
Nothing but to learn, to make several tests on the second disk, that I 
can do errors at will :)
> Dieter.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> E-mail classificado pelo Identificador de Spam Inteligente Terra.
> Para alterar a categoria classificada, visite
> http://mail.terra.com.br/protected_email/imail/imail.cgi?+_u=minicom024&_l=1,1151680591.250192.29668.arrino.hst.terra.com.br,4463,Des15,Des15
>
> Esta mensagem foi verificada pelo E-mail Protegido Terra.
> Scan engine: McAfee VirusScan / Atualizado em 29/06/2006 / Vers�o: 4.4.00/4796
> Proteja o seu e-mail Terra: http://mail.terra.com.br/
>
>
>   
