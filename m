Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6DLNF028773
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2004 17:23:15 -0400
Received: from web11803.mail.yahoo.com (web11803.mail.yahoo.com
	[216.136.172.157])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i6DLNDe1015835
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2004 17:23:13 -0400
Message-ID: <20040713212312.81503.qmail@web11803.mail.yahoo.com>
Date: Tue, 13 Jul 2004 14:23:12 -0700 (PDT)
From: <bowmailtmp-lvm@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM2/DM Mapping Tables Documentation
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have been having a very difficult time correlating
physical addresses to LVM2/DM addresses.

for instance, if i do:
dmsetup table /dev/mapper/avtest-vdisk2g

the result is:
0 4194304 linear 22:65 384

from what i currently understand, this means logical
extent 0 (which is composed of 8192 512 byte sectors
in the default config) of this LV should start at
physical sector 384 of device 22:65 (/dev/hdd1 on my
machine)

after i've written to the logical device a couple
times, it appears this correlation doesn't hold when i
access the physical sectors on hdd1 using dd. 
however, if i use dd to access the sectors through the
LV, all the data appears as it should.  i was under
the impression that the logical to physical mappings
was quite straightforward and intuitive, but i feel
that i am missing some key information.  Can someone
help me out of is there decent developer documentation
somewhere that explains the mappings?

As a more complete example of my problem, if i do the
following:

dd if=/dev/zero of=/dev/avtest/vdisk2g count=1
then do:
dd if=/dev/avtest/vdisk2g of=tmpfile.out count=1
then tmpfile.out contains 512 bytes of zeros.

however, if I do:
dd if=/dev/hdd1 of=tmpfile.out skip=384 count=1
then tmpfile.out contains other data, not the zero's i
would expect from the output of the dmsetup table
command above.  I feel i'm missing something fairly
basic here, but I haven't had any luck tracking this
relationship down.  I suppose there is always the
sourc code :)


Thanks a lot.
