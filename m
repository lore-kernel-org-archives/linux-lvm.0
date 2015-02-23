Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1NL0l03007336
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2015 16:00:47 -0500
Received: from mailrelay2.lanline.com (mailrelay2.lanline.com [216.187.10.18])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1NL0WH7008267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2015 16:00:33 -0500
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay2.lanline.com (8.14.5/8.14.5) with ESMTP id t1NL0VIA086615
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2015 16:00:31 -0500 (EST)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id t1NKurHN015783
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2015 15:56:54 -0500 (EST)
MIME-Version: 1.0
Message-ID: <21739.38126.119045.772360@quad.stoffel.home>
Date: Mon, 23 Feb 2015 16:00:30 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <CAF0z+n1UQXryRYMjCLzjtO07Q+ErJtW_+YFFKwmAyipkBhm_WQ@mail.gmail.com>
References: <CAF0z+n1UQXryRYMjCLzjtO07Q+ErJtW_+YFFKwmAyipkBhm_WQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Combine multiple physical volumes onto a larger
	device
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


Greg> I'm sure this has been asked and answered before, but after a
Greg> fair bit of googleing I'm not coming up with an answer.

You want to use 'pvmove' to get the LVs off the PV(s) you want to
evacuate.  Now are these PVs stripped or mirrored or RAID'd in any
way?  Then you don't want to just blindly move things around because
you'll run into performance issues.

Basically, it depends.  Can you provide more details of your setup so
w can help?  

Greg> I have a fairly old volume group that is made of 9 x 620GB PVs.�

Are these 9 seperate 1Tb drives?  

Greg> I'd like to move this volume group off these devices onto a
Greg> couple larger drives.� What is the best way to do this?� I've
Greg> read that you can vgextend the new drives into the volume group
Greg> and the use pvmove to move data off one PV to another, but I
Greg> don't know if you can pvmove smaller pvs onto a larger disk and
Greg> they will all be combined.

So it sounds like you have your PVs striped together into a single
volume, correct?  

Greg> Maybe there is a better way to move the entire VG? � �I want to
Greg> maintain the current VG and LV names from my old setup, this my
Greg> desire to just move the entire lot at once instead of rsyncing
Greg> or something.

It might make sense to build new PVs, and then mirror the existing
volume(s) onto the new disks, then you can remove the old mirrors.
This would let you take 9 x 10g LVs that are striped together and
mirror them with say 3 x 30g LVs so that your data gets laid out
properly.

But it all depends on your setup details.  Please post them so we can
comment on this.

John
