Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i18Dpga16404
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 08:51:42 -0500
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au>
	<yw1xn07tu7w8.fsf@kth.se>
	<1076241638.402624e656f43@pandani.services.adelaide.edu.au>
	<200402081354.15872.rainer@krienke.org>
	<1076247930.40263d7a87098@pandani.services.adelaide.edu.au>
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
In-Reply-To: <1076247930.40263d7a87098@pandani.services.adelaide.edu.au> (Chris
 Doherty's message of "Mon,  9 Feb 2004 00:15:30 +1030")
Message-ID: <yw1xbro9u1c7.fsf@kth.se>
MIME-Version: 1.0
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
Date: Sun Feb  8 08:51:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Chris Doherty <chris.doherty@adelaide.edu.au>
Cc: Rainer krienke <rainer@krienke.org>, linux-lvm@redhat.com, linux-lvm@sistina.com

Chris Doherty <chris.doherty@adelaide.edu.au> writes:

>> > > > root@connect4:~# ls -la /dev/lvm
>> > > > ?---rws-w-  8306 840966198 976250230 875573298 Sep 24  2004 /dev/lvm
>> > >
>> > > Your filesystem seems to have taken some heavy blows.  You should fsck
>> > > it properly.  You might need the -f flag to fsck to force a complete
>> > > check if filesystem is marked clean.
>> >
>> > the filesystem can't be mounted (which is the really worrying part) so i
>> > can't fsck it.
>> >
>> 
>> A filesystem that is to be fscked can and may *never* be mounted when 
>> performing an fsck. Usually all fsck tools won't do anything but stop if the
>
> oops, sorry my last statement was ambiguous.  what i meant was that the 
> filesystem can't be mounted *and* fsck refuses to acknowledge that it is (or 
> was?) a filesystem.

The filesystem containing /dev has been damaged somehow.  You should
fsck it.  Most likely fsck will remove /dev/lvm so you'll have to
recreate it with proper values.  Don't just rm it.  Something bad has
obviously happened and changing things without a proper fsck can make
things worse.

-- 
M�ns Rullg�rd
mru@kth.se
