From: Ewen McNeill <ewen@naos.co.nz>
Subject: Re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror 
In-Reply-To: Message from Ewen McNeill <ewen@naos.co.nz> 
   of "Wed, 30 Apr 2003 11:23:51 +1200." <20030429232352.DC21EAE4F5@basilica.la.naos.co.nz> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12808.1051662623.1@basilica.la.naos.co.nz>
Message-Id: <20030430003023.8CC3CAE4F5@basilica.la.naos.co.nz>
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
Date: Tue Apr 29 19:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <20030429232352.DC21EAE4F5@basilica.la.naos.co.nz>, Ewen McNeill writes:
>In message <20030430011344.N16789@zealot.blacknet.de>, Goetz Bock writes:
>>during my last/first/only time i had to deal with ataraid, and IIRC,
>>the promise IDE driver had a compile time flag where it would not touch
>>initialised raid arrays.
>>aktivating this flag would simply remove the offending disks from the
>>list of ide disks and make it available via ataraid only.
>
>It would be nice if it were possible to do this.  Is this perhaps the
>CONFIG_PDC202XX_FORCE flag (turned off, or on)?  

According to this message:

http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&selm=20030405112008%2462da%40gated-at.bofh.it

from Andre Hedrick (Linux IDE maintainer), the CONFIG_PDC202XX_FORCE
option is intended to force recognition of the Promise card's IDE
channels as IDE devices, in order to be able to use the Linux pdcraid
(ATA-RAID) driver.  (They are apparently semi-disabled in the PCI
configuration data, by default, so that only the Promise SCSI device
driver can find them.)  It should be on for using the pdcraid/ata-raid
support, and off if you are using the Promise "SCSI" device driver.
(And as I noted earlier, only certain chipsets seem to actually use this
option; the rest just default to forced on.)

This tends to confirm my view that if you use the ataraid driver, then
you'll see both the raw /dev/hd* devices, and also the /dev/ataraid/d0*
devices, since the ataraid/pdcraid driver appears to search the /dev/hd*
IDE controllers for likely devices based on partition signatures.

Which means that LVM needs to deal with the aliasing effects in some
manner, either by recognising the ataraid devices first and ignoring the
underlying devices, or by very loudly refusing to work with ataraid at
all.

Ewen
