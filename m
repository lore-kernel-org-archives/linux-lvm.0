Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NJuv3V001622
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:56:57 -0500
Received: from aspen.rjl.com (aspen.rjl.com [66.35.48.14])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NJul8h028058
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:56:47 -0500
Received: from stardust.rjl.com (173-16-199-31.client.mchsi.com
	[173.16.199.31])
	by aspen.rjl.com (vPostMaster) with ESMTP id ED7A41D028A
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 11:57:14 -0800 (PST)
Message-ID: <4D65667E.9090801@rjl.com>
Date: Wed, 23 Feb 2011 11:56:46 -0800
From: Nataraj <incoming-redhat@rjl.com>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<4D6560FE.30301@cfl.rr.com>
	<Pine.LNX.4.64.1102231445000.14448@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102231445000.14448@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 02/23/2011 11:45 AM, Stuart D. Gathman wrote:
> On Wed, 23 Feb 2011, Phillip Susi wrote:
>
>> On 2/23/2011 12:54 PM, Stuart D. Gathman wrote:
>>> Or maybe you want to *revert* the origin back to the state saved
>>> in a snapshot.  A specific revert command is in the works, but
>>> to do it manually, unmount the origin, and copy the snapshot over
>> That is lvconvert --merge, and it has been around for a while now.  It
>> is quite handy for testing a dist-upgrade and then rolling back.
> Yes, I see that it is in Fedora, but not EL5.5.
>
It is in EL6.0 as well.  From what I can tell, and please correct me if
this is not the case, I believe there are no changes to the lvm
structure, so you could take a redhat 5 system and boot a redhat 6
recovery disk or live CD and use lvconvert --merge to revert to the
origin to a snapshot.  You probably need to reboot anyway in order to
use 'lvconvert --merge', since you can't revert an active volume.

Nataraj
