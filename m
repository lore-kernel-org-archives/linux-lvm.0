Message-ID: <490EDB00.2080906@redhat.com>
Date: Mon, 03 Nov 2008 11:05:36 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] dmraid - where is the raid done?
References: <1224269483.17821.39.camel@pc.ilinx>	
	<c268e4660810270656u72bb8e29n69866ccf77a0fef2@mail.gmail.com>	
	<49098F73.7000706@redhat.com>
	<c268e4660811022134t78e598dbm6b58136fd0ed9dea@mail.gmail.com>
In-Reply-To: <c268e4660811022134t78e598dbm6b58136fd0ed9dea@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Drew <drew.kay@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Drew wrote:
>> Wrong list - that's for the Linux MD RAID subsystem (mdadm, /dev/md* and
>> friends). You're looking for ataraid-list:
>>
>> http://www.redhat.com/mailman/listinfo/ataraid-list
>>
>> Which is the place for discussion of dmraid development.
> 
> Evening Byrn,
> 
> I am aware that the dm-raid list was the best one if he had a dm-raid
> specific question. However from what I read it sounded like he was
> interested in knowing what the differences were between ata/dm-raid
> and md (software) raid. Being a lurker on both lists I felt that the
> folks over at md would be a better choice.

He was asking where the RAID is done in dmraid. I think the response of
the MD folks to that question based on past experience, would be either
very general or something like: "Huh? Go ask the device-mapper guys" ;)

If you're using dmraid to activate volumes on an ata RAID / fakeraid
adapter then all the RAID work is being done in the kernel by device-mapper.

When dmraid activates a volume, it reads the metadata from the disk that
describes the array and translates that into a device-mapper table,
usually using some combination of the linear, dm-raid1, and dm-raid45
targets. These are the kernel modules that implement the RAID algorithms
(dm-raid1 uses the kernel thread kcopyd to do the actual work - you'll
see this process consuming some resources on a system with a busy mirror).

For more information on the targets and the tables that are used to
configure them see Alasdairs talks on LVM/device-mapper here:

http://people.redhat.com/agk/talks/

Regards,
Bryn.
