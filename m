Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m45Eji1E013774
	for <linux-lvm@redhat.com>; Mon, 5 May 2008 10:45:44 -0400
Received: from smtp05.atlngahp.sys.nuvox.net (smtp-out5.atlngahp.sys.nuvox.net
	[70.43.63.23])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m45EjTYZ000418
	for <linux-lvm@redhat.com>; Mon, 5 May 2008 10:45:32 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp05.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m45EjMvL014134
	for <linux-lvm@redhat.com>; Mon, 5 May 2008 10:45:24 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 1451D3797C6
	for <linux-lvm@redhat.com>; Mon,  5 May 2008 10:45:22 -0400 (EDT)
Message-ID: <481F1D81.2010503@Media-Brokers.com>
Date: Mon, 05 May 2008 10:45:21 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Temporary shapshots
References: <Pine.LNX.4.64.0805022200280.13318@engineering.redhat.com>	<Pine.LNX.4.44.0805032037140.6617-100000@bmsred.bmsi.com>
	<1c748a490805050730w3c303bf4y77c624ab0669641a@mail.gmail.com>
In-Reply-To: <1c748a490805050730w3c303bf4y77c624ab0669641a@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 5/5/2008 10:30 AM, Larry Dickson wrote:
>>> To use temporary storage for snapshot, a special command for lvm 
>>> would be more appropriate --- a command that would setup snapshot
>>> and write nothing about it to metadata, so that the snapshot would
>>> be forgotten on next reboot --- then, you can setup the snapshot on
>>> any device outside the volume group. You can already do this with
>>> dmsetup.

>> This is an excellent idea - and not just for ramdisks. The hardest
>> part of using snapshots for backups is making sure they are deleted 
>> afterward. Not having to check at reboot would be one less 'i' to
>> dot.

> I love this idea because it nicely covers one of the main purposes of
> snapshotting, namely, making backups at a well-defined time point. 
> Would there ever be any use of a temporary read-write snapshot? If
> not, perhaps making it read-only would simplify the design.

Ditto...

I feel much better now about using snapshots after realizing the OP's 
problem was due to the use of a RAMdisk for a snapshot volume (combined 
with an unclean shutdown), but anything that makes these safer and 
easier gets my vite...

-- 

Best regards,

Charles
