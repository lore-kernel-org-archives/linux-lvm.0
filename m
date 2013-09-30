Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8U8s9lU018036
	for <linux-lvm@redhat.com>; Mon, 30 Sep 2013 04:54:09 -0400
Received: from nm24-vm2.access.bullet.mail.bf1.yahoo.com
	(nm24-vm2.access.bullet.mail.bf1.yahoo.com [216.109.115.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8U8s8jl022581
	for <linux-lvm@redhat.com>; Mon, 30 Sep 2013 04:54:08 -0400
References: <CADfj0ArxrmGA56dWiyjTPCL8z=iAdHtQV7NHEqEvZbuPd+4_VQ@mail.gmail.com>
Message-ID: <1380531247.6385.YahooMailNeo@web181503.mail.ne1.yahoo.com>
Date: Mon, 30 Sep 2013 01:54:07 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <CADfj0ArxrmGA56dWiyjTPCL8z=iAdHtQV7NHEqEvZbuPd+4_VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] combined linear + striped
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

>I have 400 disks over here. All these disks live on 4 separate raids 5� (ibm ds6000).�
>So stripping across disks within a raid doesn't make any sens.�

you don't give the SAN administrators of the US Census Bureau enough credit. ;-)

>But, what I'd like to do is to stripe it across separate raids. 
>
>This is how I see it
>
>Raid a - disks 1001-1100
>Raid b - disks 2001-2100
>Raid c - disks 3001-3100
>Raid d - disks 4001-3100
>
>Stripping would be across every set of 4 disks: 1001,2001,3001,4001 + 1002,2002,3002,4002 ... and so on. 
>
>And all stripped sets would be combined in to one big LV. 
>Is it even possible? 


Of course. but I still wouldn't do it en-mass like that. Unless (and even then) you have exactly one workload defined that you want all 400 disks to participate in, you'll be FAR better off assigning different workloads to different spindle sets (ie. raids). I would go farther and recommend those raid sets be broken into much smaller sets of spindles, say 8+P at most. Unless you've been handed 100 x 4 "disks" because your SAN admin thought it was a brilliant idea to cap the size of each LUN at some silly number like 25GB (yes, EMC used to advocate for such foolishness) and thus they represent increasing offsets on the same spindle set.


All that said, lets assume you assigned all 400 LUNs to a single Linux LVM Volume Group. Then when you LVCREATE just specify the list of PV (or extents therein) you want to use and the order. So,

� # lvcreate -L ... -n ... vgname pv1001 pv2001 pv3001 pv4001 pv1002 pv2002 ...


Frankly I'd also look at using the LVcreate Interleave directives to "stripe" a bit more effectively.


>I know that I can just create a stripped volume across all 400 volumes but it doesn't really make sens in this set up does it?�


Probably not unless you're doing just massive streaming reads or writes. I think your first stop should be the SAN admin's cube. Bring a nice, maple clue bat and practice your follow-through. Perfect form is important after all...
