From: Anders Widman <andewid@tnonline.net>
Message-Id: <912081000.20020410121733@tnonline.net>
Subject: Re: [linux-lvm] multiple volumes..
In-Reply-To: <E16v6GS-0001n5-00@hermes.sistina.com>
References: <18044083656.20020409231800@tnonline.net>
    <611310000.1018387687@[192.168.200.4]> <3CB364D2.F612BD9B@silicide.dk>
    <E16v6GS-0001n5-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Apr 10 05:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Woha. Lot's of replies :)

1) Speed is generally not the biggest importance. 5-6MB/s would be
enough.

All drives are UDMA 100, and there are 4 UDMA 100 host controllers in
this system. If I want to, I can have 16 drives. The speed varyes
between 25-35MB/s for all drives.

The reason I choose a RAID 5 setup was that one drive could
die (to the point where no data recovery is possible) without loosing
any data. If the system gets very slow, or I might even have to bring
it down to replace the drive, that's fine.

I only need enough security if one drive would fail. Agreed, mirroring
would perhaps be safer, and at least faster when a drive failes. But I
need as much diskspace I can get, and mirroring would consume alot of
that.


Thanks,
Anders



> On Wed, 10 Apr 2002 08:01, you wrote:
> but that REQUIRES, that the disks are not
>> hd<a,b,c,d,e,f,g,h>
>> You should try to avoid having more than one (active) disk at the same
>> controller at once.

> I've always wondered about this statement.  

> The idea AFAIK is that unlike SCSI, IDE has the master drive control the 
> slave drive on the same controller.  
> 1) This causes problems where the drives are a different 
> model/make/manufactuer as the master drive will downgrade the settings of the 
> drives (master & slave) to the lowest common denominator; and therefore, the 
> speed in this case is affected.  
> 2) Having the master drive control the slave drive also causes problems if 
> the master fails as then both drives fail or if a drive takes down the chain 
> both drives fail.
> 3) maybe a couple of others that I have forgotten at the moment.

> When I was setting up my server at home 1.2GAthlon AsusA7V-133 384M RAM 9x 
> IBM 40G drives, 1 Promise Ultra100 & 2 Promise Ultra100TX2 I did a couple of 
> tests.  
> I found by using a flaky drive from a previous life (a western digital that 
> when it would die would take down the controller) that it didn't matter if 
> the drive was a single master on a controller, a master on a shared 
> controller or a slave on a shared controller.  When the drive would fail - it 
> would take the whole machine down with it.  The Kernel would not die but it 
> would deadlock waiting for interrupts to return and the only way to fix the 
> issue was to hard reset.  Having the flaky dirve as a standalone drive or as 
> part of a software RAID made no difference.  So I concluded that at least in 
> my setup I gained nothing by only having one IDE drive per controller.

> I also ran bonnie++ tests on a software RAID0 using 4 master only drives 
> (hde, hdg, hdi, hdk) and 4 master-slave drives (hde, hdf, hdg, hdh).  The 
> results of the test were that seek times for the master-slave case were half 
> that for the master-master case.  Read times did drop but only by about 
> .75M/s from 80M/s but the write times improved by about .25-.75M/s from 
> 50M/s.  So I concluded that at least for my setup it was better to have the 
> master-slave case because the loss of read speed was made up by the increase 
> in write speed.  

> So my final configuration was that hda, hdb were system disks.  The RAID5 
> used hde, hdg, hdi, hdk with a hot spare hdo and the RAID0 used hdm & hdn.

> Now the tests weren't what I would call conclusive or proper scientific tests 
> but I believe they were valid.  I've always wondered what others have found 
> as what I found seems to fly in the face of common rules of thumb.

> There is a specific mailing list "linux ide" 
> <linux-ide-arrays@lists.math.uh.edu> that deal with large IDE arrays so you 
> might like to also ask your question there and see what is suggested.
