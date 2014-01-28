Received: from red.mvo.lan (ovpn-116-18.ams2.redhat.com [10.36.116.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0S9KS0e026953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 04:20:29 -0500
From: Marius Vollmer <marius.vollmer@redhat.com>
Date: Tue, 28 Jan 2014 11:20:27 +0200
Message-ID: <87y520o42s.fsf@red.mvo.lan>
MIME-Version: 1.0
Subject: [linux-lvm] Ignoring locks with the lvm2app API
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I find myself in the situation where I want to scan the current LVM2
setup (what volumegroups exist, their logical volumes, etc) without
risking to lock.

That brings me to some questions:

 - What's the worst thing that can happen when ignoring locks while
   listing logical volumes, reading their properties with the lvm2app
   library?  Can I do this in a system daemon?  A crash of my process
   would be OK, as would be getting temprarily inconsistent information.
   Permanent damage to the system configuration would not be OK,
   obviously.

 - How would I actually best go about ignoring locks?  I found some
   comments in lvm2app about "better support for locking control", so I
   guess it is not really supported right now.  I could have a go at
   improving this.  Would that be worthwhile?  Any advice?
