Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i19FhVa29505
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2004 10:43:31 -0500
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xu120mf7p.fsf@kth.se>
References: <4027A8D6.7000103@oppositelock.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: LVM2 on top of RAID1? (x86_64)
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
Date: Mon Feb  9 10:43:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Douglas Kilpatrick <kilpatds@oppositelock.org> writes:

> I'm trying to setup a new box the same way my current box is
> setup. I've split the drives into two sections, one of which I'm
> combining into a RAID0 stripe, the other a RAID1 mirror set. (sorry
> for the redundancy.)
>
> lvm pvs
>
> complains about seeing 3 extra instances of the id, and decides that
> the PV is actually on /dev/sda (or /dev/sdb, depending on boot), not
> /dev/md1.

I have a similar setup and ran into the same problem.  I solved it by
placing this in /etc/lvm/lvm.conf:

devices {
        filter = [ "r,hd," ]
}

That tells lvm to never look at a block device with "hd" in the name.
You should probably change "hd" to "sd".

-- 
M�ns Rullg�rd
mru@kth.se
