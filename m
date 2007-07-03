Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l63FwPPP030499
	for <linux-lvm@redhat.com>; Tue, 3 Jul 2007 11:58:25 -0400
Received: from mail.sigmasolinc.com (mail.sigmasolinc.com [71.40.15.5])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l63FwMpP005492
	for <linux-lvm@redhat.com>; Tue, 3 Jul 2007 11:58:23 -0400
Date: Tue, 03 Jul 2007 10:58:08 -0500
Subject: Re: [linux-lvm] LVM2 resync speed problems
From: John Wang <jwang@dataseekonline.com>
Message-ID: <C2AFDC40.38AE%jwang@dataseekonline.com>
In-Reply-To: <89f9efee0706131328r6db8c366u45f159de6d2aa9c9@mail.gmail.com>
Mime-version: 1.0
Content-transfer-encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello

Those WD RE drives are intended for use with TLER aware RAID controllers and
should not be directly attached to a server through a regular controller as
individual drives. 

The reason is that TLER (Time Limited Error Recovery) will occasionally not
bother to recover data if it takes longer than a set period of time to do
so, this does not bother a TLER aware controller since it would just rebuild
the data from parity and would know enough that it's not really a failed
drive unless the issue keeps reoccurring in the same spot.   If you use
these drives as regular drives, they could report more errors than a non RE
drive which is probably why you're getting the resyncs.   The difference
between the two systems could simply be the number of bordeline flaws on the
drive which would normally be recovered by the drive itself but is being
passed on up to the OS as the drive assumes the RAID controller could make
better decisions as to what to do.

You may want to get yourself a Promise RAID controller as they are
considered TLER aware although their approach is quite simple i.e.: retry
several times before assuming it's a hard error (might as well not have TLER
with that approach).   Better yet, get non-RE drives...

Regards,
John


On 6/13/07 3:28 PM, "Leonard Smith" <lrsmith@gmail.com> wrote:

> Forgot to mention, the drives are WD 500 GB "Raid enabled" SATA
> drives. They are some of WD newer drives, and I think they are
> techincally SATA2. The other system also has the same drives.
> 
> 
> On 6/13/07, Matthew Gillen <me@mattgillen.net> wrote:
>> Leonard Smith wrote:
>>> I am running CentOS4.4 on  two "black" box systems that are
>>> identically configured. Both have 500 GB internal drives, ( same type)
>>> and were installed using the same kickstart configuration. The drives
>>> are being mirrored using LVM.
>>> 
>>> When I check the first system it is re-syncing and the resync time and
>>> speed are
>>> 
>>> finish=18559.6min speed=355K/sec
>>> 
>>> On the second system the time and speed are
>>> 
>>> finish=89.5min speed=68170K/sec
>>> 
>>> I can't figure out why the speeds are different between the two. I
>>> checked /proc/sys/dev/raid/speed_limit_ and they are the same. The
>>> priority of the md proceses are they same.
>>> 
>>> I tweaked the setting of the speel_limit_min and increase the nice
>>> priority of the resync process, on the first box, but I could never
>>> get it better than
>>> 
>>> finish=4551.8min speed=1445K/sec
>>> 
>>> 
>>> I've googled and I haven't found much more useful information that to
>>> adjust those settings. Besides those setting what else dictates the
>>> speed used?
>> 
>> You might compare the hd settings using 'hdparm'.  I'm not sure factor of
>> 100+
>> can be explained by an incorrect DMA setting or something like that, but it
>> might be a contributor.
>> 
>> Matt
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
