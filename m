Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i199Qra10061
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2004 04:26:53 -0500
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xvfmgob7w.fsf@kth.se>
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au> <yw1xn07tu7w8.fsf@kth.se>
 <1076241638.402624e656f43@pandani.services.adelaide.edu.au>
 <200402081354.15872.rainer@krienke.org>
 <1076247930.40263d7a87098@pandani.services.adelaide.edu.au>
 <yw1xbro9u1c7.fsf@kth.se> <4026FEC4.2050005@adelaide.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm]Re: corrupt /dev/lvm - bizzare properties
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb  9 04:26:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Chris Doherty <chris.doherty@adelaide.edu.au> writes:

>> The filesystem containing /dev has been damaged somehow.  You should
>> fsck it.  Most likely fsck will remove /dev/lvm so you'll have to
>> recreate it with proper values.  Don't just rm it.  Something bad has
>> obviously happened and changing things without a proper fsck can make
>> things worse.
>
> thanks.  i'll try this tonight and report back. :)  my limited
> understanding of LVM leads me to believe that the volume group and
> logical volume within it are actually still safe and sound in /dev/vg1

Chances are it's still there.

> is /dev/lvm just a character device which is used to transmit data
> from the volume group (vg1) to the device driver?

Yes.

> you mention that fsck will probably remove /dev/lvm and that i
> should recreate it.  is there any risk to vg1/lv1 if i do that?  (as
> i still haven't successfully backed up anything in it's current
> state)

You should be fine.  If you are paranoid and vg1 is on different disks
than the root fs you could unplug them while doing the fsck.

-- 
M�ns Rullg�rd
mru@kth.se
