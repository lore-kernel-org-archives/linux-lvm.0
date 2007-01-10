Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0AIGuL9018739
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 13:16:57 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.190])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0AIGtuD025248
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 13:16:55 -0500
Received: by nf-out-0910.google.com with SMTP id k26so644045nfc
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 10:16:54 -0800 (PST)
Message-ID: <aec22fc50701101016w1eed2d38yea460d46f9762197@mail.gmail.com>
Date: Wed, 10 Jan 2007 21:16:54 +0300
From: `VL <vl.homutov@gmail.com>
Subject: Re: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current
	PV" can't get data of volume group
In-Reply-To: <20070110170848.GA19858@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9472_11030577.1168453014392"
References: <aec22fc50701091026i3b66ec18jbd18760e59164622@mail.gmail.com>
	<20070110170848.GA19858@redhat.com>
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_9472_11030577.1168453014392
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>>Do you assume that, because your system died during
>>a running configuration change on "lvm1" ?
I really don`t know. The system is a lan server which has no particular
owner and good maintance. possibly ;-)

>>Are all PVs of "lvm1" accessible ?
i was happy to find a backup of logical volume and it says that there were 1
more harddrive, which
is now NOT accessible. so i assume that this is the problem, since vgscan
complains about
'current PV not accessible'. I`ll try to do my best in searching for this
hard drive, but chances i`ll find
it safe are really low (since anyone who took it, really needed it for
something =)

Now i have unaccessible lvm1 volume, 2 hard drives (hdf and hdg) and backup
file that contains
information about lvm1 when it had 3 hard drives(+hdh).

Are there are any ways to get data from remaining drives? How to remove
information about 3rd drive from volume?
Is it possible?

P.S. sorry that i didn`t understand immediately that problem was because of
loosing 1 of drives from lvm.

------=_Part_9472_11030577.1168453014392
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

&gt;&gt;Do you assume that, because your system died during<br>&gt;&gt;a running configuration change on &quot;lvm1&quot; ?<br>I really don`t know. The system is a lan server which has no particular owner and good maintance. possibly ;-)
<br><br>&gt;&gt;Are all PVs of &quot;lvm1&quot; accessible ?<br>i was happy to find a backup of logical volume and it says that there were 1 more harddrive, which<br>is now NOT accessible. so i assume that this is the problem, since vgscan complains about
<br>&#39;current PV not accessible&#39;. I`ll try to do my best in searching for this hard drive, but chances i`ll find<br>it safe are really low (since anyone who took it, really needed it for something =)<br><br>Now i have unaccessible lvm1 volume, 2 hard drives (hdf and hdg) and backup file that contains
<br>information about lvm1 when it had 3 hard drives(+hdh).<br><br>Are there are any ways to get data from remaining drives? How to remove information about 3rd drive from volume?<br>Is it possible?<br><br>P.S. sorry that i didn`t understand immediately that problem was because of loosing 1 of drives from lvm.
<br>

------=_Part_9472_11030577.1168453014392--
