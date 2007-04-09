Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l39IUBoW010382
	for <linux-lvm@redhat.com>; Mon, 9 Apr 2007 14:30:12 -0400
Received: from gmi.com (outgoing.mail.gmi.com [70.103.172.51])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l39IU4bc016904
	for <linux-lvm@redhat.com>; Mon, 9 Apr 2007 14:30:05 -0400
Date: Mon, 9 Apr 2007 11:29:59 -0700
From: "Adam D. Morley" <adam-software-linux-lvm@gmi.com>
Message-ID: <20070409182959.GA7163@pri.dmz.gmi.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Sharing volumes via SAN?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I'd like to share LVM volumes hosted on a SAN between two systems.  I do
not want to mount at the same time (ie: GFS), but rather I just want
to be able to swap them between hosts.  I'm assuming this is possible
now by simply assigning SAN LUNs to both systems, but I don't see
much talk of about a piece of LVM that handles knowing which host
"owns" a given LV.

Background: In Solaris, when using Sun's VM, one can create a shared
diskset which is seen by two hosts, but only one can do IO against the
volumes at a given time.  Solaris also implements a forcible take
mechanism which allows the passive host to take the volumes from the
active host, panicing the active host out.  Regular takes are also
implemented, to allow the volumes to migrate between hosts if first
released by the active host.

It doesn't seem like LVM does this out of the box, probably because it
lacks a built-in lock manager.  If it does, could someone point me to a
resource that shows how it works?

In the event LVM doesn't do this, is this something that CLVM will do?
Was there ever a version of CLVM for the 2.4.x kernel series?

Thanks!

-- 
adam
