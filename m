Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8LDLtSg029305
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 09:21:55 -0400
Received: from nz-out-0102.google.com (nz-out-0102.google.com [64.233.162.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8LDLmHJ018828
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 09:21:48 -0400
Received: by nz-out-0102.google.com with SMTP id n1so375184nzf
	for <linux-lvm@redhat.com>; Thu, 21 Sep 2006 06:21:48 -0700 (PDT)
Message-ID: <38a5faa90609210621h1626bc92k13e6f12a65e2b025@mail.gmail.com>
Date: Thu, 21 Sep 2006 15:21:48 +0200
From: "=?ISO-8859-1?Q?Erik_Starb=E4ck?=" <erik.starback@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How to rescue data from Fedora system "inside" lvm-disk?
Reply-To: erik@starback.se,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hi!

I have a half physically broken (shaky at least)  hard disk with
Fedora Core 4 with default disk layout (which means lvm-system).

I installed a new Fedora Core 5 on a new disk to rescue as much as
possible of the data of the old disk.

I was super confused about the LVM-stuff and was acting so very
bad.... I started to fiddle with stuff I wasn't in control of... Damn!

I think the only thing I actually did was this:

vgcreate temp /dev/hdd2

and hdd2 was the only physical volume.

I got super scared and I am now super afraid I have made it impossible
to rescue anything. I stopped every kind of activity.

Please. Can someone tell me if I can rescue the data?
-------------
I did a more controlled test after with two fresh disks. And with that
setup I realized the only thing I should have done was this:

lvchange -ay VolGroup00

then everything should have worked like a charm.... but instead I
started to fiddle.

Please, please say that I can save the data!

--------------
I tried to simulate my situation (with another disk) after I got the
above solution to work. I tried to  do:

vgcreate temp /dev/hdd2

but it didn't work.... so that confused me some, becuse I am almost
sure that was the only thing I did with my broken disk.

 ------------

Perhaps something was fucked up bye the fact that I had the same
volume configuration (and names) with hda and hdd when I did my first
try.

Thanks for every kind of input!

Erik S

erik@starback.se


-- 


Erik Starb�ck
Harpsund, Sl�nten
640 31 Mell�sa
0157-60066
070-7653093
