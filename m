Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MGqdD3011357
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:52:39 -0400
Received: from exprod7og111.obsmtp.com (exprod7og111.obsmtp.com [64.18.2.175])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MGqQaq010869
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:52:26 -0400
Received: from stephane by ant.artesyncp.com with local (Exim 4.69)
	(envelope-from <stephane@artesyncp.com>) id 1JoLjD-0007HS-0U
	for linux-lvm@redhat.com; Tue, 22 Apr 2008 17:52:23 +0100
Date: Tue, 22 Apr 2008 17:52:23 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [linux-lvm] Snapshot question...
Message-ID: <chaz20080422165222.GC6559@artesyncp.com>
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
	<480E121A.7020100@Media-Brokers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <480E121A.7020100@Media-Brokers.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2008-04-22 12:28:10 -0400, Charles Marcus:
[...]
>> So to sum up, the "snapshot" volume you are creating is a
>> "virtual" volume that is a front end to both the snapshot
>> storage volume ("COW") and the original real volume ("real").
>>
>> Hope this clarifies a bit,
>
> Thanks for trying, but no, that just made my head hurt...
>
> ;)
>
> Seriously... if the snapshot volume that I'm creating is a front end to 
> BOTH, when I back it up, I guess LVM just 'knows' that I mean to backup the 
> 'original'?
>
> Is there a graphical outline of how this works? I seem to do better with 
> visualizations...
[...]

I can try another wording.

Your snapshot device is a *virtual* device. And if you do a cat
/dev/vg/snapshot, you'll get 100GB worth of data which will be
exactly the same as you would have gotten if you had done a cat
/dev/vg/original at the time you did the snapshot.

To make that virtual snapshot work, LVM uses internally another
this time real device, which you don't access directly. You can
do a cat /dev/mapper/vg-snapshot-cow, you'll get 5 GB of data,
but that data will be useless to you, it's in a special format
recognised by the device-mapper used to store only the blocks
that were changed in your original device since the snapshot.

The "dmsetup status" or "lvdisplay" commands should be able to
tell you how much of the COW volume has already been allocated
to store the "modifications". When all the space there has been
used, the virtual device will stop working altogether.

is that better?
Stephane
