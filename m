References: <57374453.843393.1505261050977.ref@mail.yahoo.com>
	<57374453.843393.1505261050977@mail.yahoo.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <645f8ebf-25e4-e0dc-1a66-935392731931@redhat.com>
Date: Wed, 13 Sep 2017 09:10:37 +0200
MIME-Version: 1.0
In-Reply-To: <57374453.843393.1505261050977@mail.yahoo.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 13.9.2017 v 02:04 matthew patton napsal(a):
> 'yes'
> 
> The filesystem may not be resident on the hypervisor (dom0) so 'dmsetup suspend' is probably more apropos. How well that propagates upward to the unwary client VM remains to be seen. But if one were running a NFS server using thin+xfs/ext4 then the 'fsfreeze' makes sense.
> 


lvm2 is not 'expecting' someone will touch lvm2 controlled DM devices.

If you suspend  thinLV with dmsetup - you are in big 'danger' of freezing 
further lvm2 processing - i.e. command will try scan device list and will get 
blocked on suspend  (even if lvm2 checks for 'suspended' dm devices to skip 
then via lvm.conf setting - there is clear race)

So any solution which works outside lvm2 and changes  dm table outside of lvm2 
locking mechanism is hardly supportable - it can be used as 'last weapon' - 
but it should be clear to user - that next proper step is to reboot the 
machine....


Regards


Zdenek
