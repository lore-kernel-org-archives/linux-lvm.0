References: <90473b46-274c-55af-3887-f058f2cf05dd@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6dc75647-bec9-564d-23fa-aeb626678cf6@redhat.com>
Date: Mon, 26 Nov 2018 09:49:21 +0100
MIME-Version: 1.0
In-Reply-To: <90473b46-274c-55af-3887-f058f2cf05dd@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Cesare Leonardi <celeonar@gmail.com>

Dne 25. 11. 18 v 0:30 Cesare Leonardi napsal(a):
> Since my message did not reach the list, I'm resending, but first I've 
> subscribed myself.
> 
> ------------------
> Hello, I'm writing here to have your opinion and possibly some advice about 
> some Debian bugs related to LVM RAID that are still unresolved:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913119
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913138
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=904822
> 
> Bug #913119 was filed by me, so I can personally provide some more information 
> and do tests.
> 
> Premises related di Debian unstable:
> * Debian's kernel is currently 4.18.20.
> * From kernel 4.17~rc7 Debian enabled SCSI_MQ_DEFAULT and DM_MQ_DEFAULT.
> * Debian's LVM userland is 2.02.176
> 
> The above reports shows blocked I/O with different type of LVM RAID and with 
> #913119 I've succesfully workarounded passing the following kernel parameters:
> scsi_mod.use_blk_mq=0 dm_mod.use_blk_mq=0
> 
> I've read that RHEL will default to enabling SCSI_MQ_DEFAULT and DM_MQ_DEFAULT 
> and will use kernel 4.18. Maybe you have already encountered this bug and it's 
> already resolved. Or there are patches pending.
> 
> What do you think? Should I file a bug in Red Hat bug tracker?
> 


Hi


Traces are completely misleading.

It does look like 'freeze' happens during LV  resize of device
(just wild guess from bug=913138)

To track down the issue - there would need to be probably some communication 
with bug reporters - they would need to expose what they were doing plus state
of dm tables and number of other things.

It's nearly impossible to guess just out of this 'trace' of  sleeping process.

 From traces it seems - raid kernel driver is sleeping - so it could i.e. mean 
some  'dm' target is left in suspended state - possibly due to ?bug? of lvm2 
command that has crashed and left table in the incorrect state??

Anyway without way more info such bug report is meaningless.


Regards


Zdenek
