Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1B8Goi13681
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 03:16:50 -0500
Received: from yakka.services.adelaide.edu.au (yakka.services.adelaide.edu.au [129.127.41.32])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1B8Gmb27505
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 03:16:48 -0500
Message-ID: <4029E4E5.3040306@adelaide.edu.au>
From: Chris Doherty <chris.doherty@adelaide.edu.au>
MIME-Version: 1.0
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au> <yw1xn07tu7w8.fsf@kth.se> <1076241638.402624e656f43@pandani.services.adelaide.edu.au> <200402081354.15872.rainer@krienke.org> <1076247930.40263d7a87098@pandani.services.adelaide.edu.au> <yw1xbro9u1c7.fsf@kth.se> <4026FEC4.2050005@adelaide.edu.au>
In-Reply-To: <4026FEC4.2050005@adelaide.edu.au>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [linux-lvm]Re: corrupt /dev/lvm - bizzare properties
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
Date: Wed Feb 11 03:16:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com
Cc: Rainer krienke <rainer@krienke.org>, linux-lvm@sistina.com

>> The filesystem containing /dev has been damaged somehow.  You should
>> fsck it.  Most likely fsck will remove /dev/lvm so you'll have to
>> recreate it with proper values.  Don't just rm it.  Something bad has
>> obviously happened and changing things without a proper fsck can make
>> things worse.

i'm happy to report a fsck of the root filesystem fixed the problem.  now why 
didn't i do that in the first place? :)

it didn't remove /dev/lvm though, it just repaired it.  thanks to all for 
their suggestions.
