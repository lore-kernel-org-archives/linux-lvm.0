Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8C85tV11570
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 04:05:55 -0400
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8C85m6b030659
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 04:05:48 -0400
Received: from barkeeper1 (213-229-1-138.sdsl-line.inode.at [213.229.1.138])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 497FA15040
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 10:05:43 +0200 (CEST)
Date: Mon, 12 Sep 2005 10:05:43 +0200
From: Lars Ellenberg <Lars.Ellenberg@linbit.com>
Subject: Re: [linux-lvm] new process dead after create multiple snapshot
	volumes
Message-ID: <20050912080543.GD25756@barkeeper1.linbit>
References: <95bbd190509111934b306235@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95bbd190509111934b306235@mail.gmail.com>
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
To: linux-lvm@redhat.com

/ 2005-09-12 10:34:15 +0800
\ Bear Wolf:
> Dear all 
> 
> I test snapshot function on my system.
> when I create the first snapshot, everything works fine.
> then I create more snapshot, everything works fine too.
> but when I access the source volume and do sync
> the sync command will be dead.
> 
> and I test with a script file
> 
> I=0
> for I in 1 2 3 4 5 6 7 8 9
> do
> cp -af /etc /mnt/volume1
> lvcreate -s -L 64 -n snaplv${I} /dev/VG01/volume1
> sleep 1
> done
> 
> after create the 4th sn apshot volume, the system process hang without
> any error message.

lvcreate calls into device mapper.
it suspends the affected targets, changes "tables", creates new targets,
and resumes the targets again.

if it fails to create the new targets, or fails to adjust the "tables",

then it unfortunately aborts, leaving the existing targets in suspended
state. I think that is a bug.

to get the system working (sort of) again, you could try to
for d in /dev/mapper/* ; do
	[[ $d == control ]] && continue
	dmsetup resume $d &
	               # ^^^ important! background it!
done

background it, because if you "resume" some target that depends on some
other target in suspended state, it will hang and wait for that other
target to be resumed... doh.

worked for me... (well, to get the system back, at least).

see also dmsetup ls, dmsetup info, dmsetp table etc.

cheers,

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
