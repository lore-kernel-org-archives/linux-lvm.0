Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1O1xkmq011572
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 20:59:46 -0500
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1O1xS7R004810
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 20:59:29 -0500
Received: from quad.stoffel.org (97-95-180-89.dhcp.oxfr.ma.charter.com
	[97.95.180.89]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id s1O1wKBc004066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 20:58:21 -0500 (EST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <21258.42878.268778.924616@quad.stoffel.home>
Date: Sun, 23 Feb 2014 20:59:26 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <20140222170837.GA11301@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
	<53087DDD.7010406@ankh.org>
	<20140222170837.GA11301@localhost.localdomain>
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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


Julie> On 22-02-2014 10.37 +0000, James Hawtin wrote:
>> #pvcreate /dev/md2
>> #vgextend VolGroup00 /dev/md2
>> # Stop the old pv getting lvs created on it
>> pvchange -x n /dev/md1
>> # Whole thing in one go
>> pvmove -v /dev/md1 /dev/md2
>> # One at a time
>> pvmove -v -n rootlv /dev/md1 /dev/md2
>> vgreduce VolGroup00 /dev/md2
>> 
Julie> ---end quoted text---

Julie> My LVs are already mirrored (w/ two extents on /dev/md1), so is
Julie> pvmove really the right tool to move one of those extents?
Julie> best,

Julie,

I think the problem is that you're confusing the Mirroring done at the
MD level, which is /dev/md#, and then the mirroring at the LVM level,
which is stacked on top of MD.  So there's no need to mirror at both
levels.  But let's double check your setup, so can you please reply
with the output of the following commands:

     cat /proc/mounts
     cat /proc/mdstat
     pvs
     vgs
     lvs

This will clarify exactly what your setup it and how it looks.

John
