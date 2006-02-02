Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12DDg121677
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 08:13:42 -0500
Received: from mail.astral.ro (mail.astral.ro [193.230.240.11])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k12DDZSG018177
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 08:13:35 -0500
Received: from 127.0.0.1 (localhost.localdomain [127.0.0.1])
	by mail.astral.ro (Postfix) with SMTP id 00C5B2800EA
	for <linux-lvm@redhat.com>; Thu,  2 Feb 2006 15:13:29 +0200 (EET)
Received: from [192.168.25.222] (dummy.cluj.astral.ro [193.230.240.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.astral.ro (Postfix) with ESMTP id DAFA028005B
	for <linux-lvm@redhat.com>; Thu,  2 Feb 2006 15:13:28 +0200 (EET)
Message-ID: <43E20674.3010007@astral.ro>
Date: Thu, 02 Feb 2006 15:17:40 +0200
From: Imre Gergely <imre.gergely@astral.ro>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
References: <0456A130F613AD459887FF012652963F073ABC@mail7.amherst.edu>
In-Reply-To: <0456A130F613AD459887FF012652963F073ABC@mail7.amherst.edu>
Content-Transfer-Encoding: 7bit
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


hi

i'm currently doing the following: every night (when there's not much i/o on
the server), i create a snapshot of one LV. the next day i remove this
snapshot, and create another one.
this worked without problems so far. a couple of months back i tried to create
more than one snapshot of one LV, and it didn't work out. it hang, got a kernel
panic, whatever.

i would like to try again with multiple snapshots (i don't plan to use those
snapshots, it's only for backup, if something gets deleted from the original
LV, i mount the last snapshot read-only, and get the files from it). has there
anything changed since?

Steffen Plotner wrote:
> Hello,
>  
> On an experimental system I changed the device mapper from 1.01.02 to 1.02.02 and lvm from 2.01.08 to 2.02.01 and upgraded on FC4 from 2.6.13 to 2.6.14-1.1653_FC4. Create a LV, create a snapshot, dd if=/dev/zero of=test bs=1M count=10000 on the LV (not the snapshot), then try to remove the snapshot and the kernel faults. 
>  
> I suspect that the outstanding block I/Os are probably the issue. You ask about the 5 second outage of ietd? the iscsi initiators see the event and reconnect - as long as the outage is not more than 1 minute (windows does not like it, linux is very resilient about it).
>  
> Steffen
>  
> ________________________________ 
> Steffen Plotner 
> Systems Administrator/Programmer 
> Systems & Networking 
> Amherst College 
> PO BOX 5000 
> Amherst, MA 01002-5000 
> Tel (413) 542-2348 
> Fax (413) 542-2626 
> Email: swplotner@amherst.edu 
> ________________________________ 
> 
> ________________________________
> 
> From: linux-lvm-bounces@redhat.com on behalf of Ming Zhang
> Sent: Wed 2/1/2006 3:54 PM
> To: LVM general discussion and development
> Subject: RE: [linux-lvm] 'snapshot' target still experimental :-(
> 
> 
> 
> i can confirm this. iet runs well with heavy io until you create many
> snapshots. lvresize will be slow as well, though not hang. i think that
> is because the outstanding bio? not quite since i faced that several
> months ago.
> 
> ps, not lvm related, but if u stop iet for 5 seconds. i guess iscsi ini
> will be unhappy? :P we can discuss in iet list.
> 
> ming
> 
> 
> On Wed, 2006-02-01 at 13:39 -0500, Steffen Plotner wrote:
>> Hi,
>>
>> I apologize for looking up your machine. I have reported this problem
>> sometime ago in November of last year. 
>>
>> https://www.redhat.com/archives/linux-lvm/2005-November/msg00044.html
>>
>> We currently deployed an iscsi-target (from sourceforge) server on FC4
>> which functions well, until we utilize snapshots. The way I currently
>> remove snapshots is to stop the iscsi-target daemon for 5 seconds, to
>> let everything settle, then remove the snap, the restart the
>> iscsi-target and all is ok (of course this is not how I would like to do
>> things.. :).
>>
>> I have tried several patches dm and lvm in late December and they did
>> not help. I have specifics at my house. I will email those later on.
>> Thank you for responding to this issue.
>>
>> Steffen
>>
>> -----Original Message-----
>> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
>> On Behalf Of Alasdair G Kergon
>> Sent: Wednesday, February 01, 2006 1:31 PM
>> To: LVM general discussion and development
>> Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
>>
>> On Wed, Feb 01, 2006 at 01:07:20PM -0500, Steffen Plotner wrote:
>>> cd to a directory on an lv that has an active snapshot dd if=/dev/zero
>>> of=test bs=1M count=10000
>>> And see how hard it is to remove a live active snapshot.
>> Strange - I don't recall anyone reporting that problem before.
>>
>> I've just tried it here and the machine locked up:-(
>>
>> Alasdair
>> --
>> agk@redhat.com
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
