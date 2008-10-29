Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9TEPppD005482
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 10:25:51 -0400
Received: from odzwierny1.comarch.com (odzwierny1.comarch.com [217.74.69.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9TEPAZQ010711
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 10:25:10 -0400
Received: from localhost (localhost [127.0.0.1])
	authenticated as marcin.kaluza@comarch.com
	by odzwierny1.comarch.com with esmtpa (ComArch ESMTP)
	id 1KvByv-00079Y-Ae
	for linux-lvm@redhat.com; Wed, 29 Oct 2008 15:25:09 +0100
From: =?iso-8859-2?Q?Marcin_Ka=B3u=BFa?= <marcin.kaluza@comarch.pl>
Subject: RE: [linux-lvm] How to monitor and possibly autoextend snapshots
Date: Wed, 29 Oct 2008 15:26:10 +0100
MIME-Version: 1.0
In-Reply-To: <0BD82213-C21F-4D83-9A52-F791564C7636@redhat.com>
Message-Id: <E1KvByv-00079Y-Ae@odzwierny1.comarch.com>
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
Content-Type: text/plain; charset="utf-8"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

After initial testing I can say that it Works :) at least with
2.6.18-92.1.13.el5.centos.plus x86_64

minor variation is that I needed to use 

dmsetup wait <device> event_nr

because every time the message was signaled,
the counter increases and the default for event_nr is 0, not current. 
Where can I read something about those events and messages? (Apart from the
source code itself of course ;)  I like the way it works, but I'd like to
know how and why - mainly to know when it can fail ;)

My main concern is what could interfere with this mechanism? Are there any
kinds of events and how can I know that this event that occurred is the one
I'm waiting for. 

I googled for it, by found no useful info...

Is there a way to put it into mainstream lvm at some time (because now I'll
have to maintain my custom build kernels...)?

Are there any chances to implement snapshot autoextension mechanism, so it
doesn't require external programs?

Thanks for help
Martin

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Jonathan Brassow
Sent: Tuesday, October 28, 2008 9:51 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] How to monitor and possibly autoextend snapshots

On Oct 27, 2008, at 7:17 AM, Marcin Ka�u�a wrote:

> Hi,
> Well, that's not much of help since after it becomes invalid I'll  
> know it
> anyway (IO error ;D), so the event is purely informational.


Well, I've thrown together a quick patch that should give you what you  
want.  (I have not compiled/tested it.)  We'd have to give it more  
thought for it to become a permanent feature (or get integrated into  
LVM), but it should be a nice little hack.  If you turn out to like  
the idea, maybe more discussion will evolve.

You'll have to compile your own kernel with the patch applied, but  
once you've done so, you should be able to do the following:

# Get snapshot to raise an event when 75% full
prompt> dmsetup message <snapshot device> 0 notify 75
prompt> dmsetup wait <snapshot device>
# Ok, now we are 75% full - let me know when 95% full
prompt> dmsetup message <snapshot device> 0 notify 95
prompt> dmsetup wait <snapshot device>

  brassow
