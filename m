Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0O3Y4ke012505
	for <linux-lvm@redhat.com>; Tue, 23 Jan 2007 22:34:05 -0500
Received: from kallisti.us (kallisti.us [67.59.168.233])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0O3Y3Yb031841
	for <linux-lvm@redhat.com>; Tue, 23 Jan 2007 22:34:04 -0500
Received: from eris.kallisti.us (ross@localhost.localdomain [127.0.0.1])
	by kallisti.us (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l0O3Xtd9011344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 23 Jan 2007 22:33:57 -0500
Received: (from ross@localhost)
	by eris.kallisti.us (8.13.4/8.13.4/Submit) id l0O3XsGb011343
	for linux-lvm@redhat.com; Tue, 23 Jan 2007 22:33:54 -0500
From: Ross Vandegrift <ross@kallisti.us>
Date: Tue, 23 Jan 2007 22:33:52 -0500
Message-ID: <20070124033351.GA11234@kallisti.us>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Poor LVM dump performance
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

Hi everyone,

I've run into som substantial read degredation when using dump or tar
to backup filesystems that are stored on LVM2 LVs.  Many times in the
past I have seen dump run at speeds approaching block device speeds;
50-60MiB/s, similar with tar.

I'm seeing speeds in the range of 3-4MiB/s when dumping a filesystem.
If I increase dump's blocksize to 128KiB records, speed jumps up to
about 20KiB/s, which is better but still frustratingly slow.  Going
to 1024KiB gets me about 28MiB/s.

Is this amount of performance loss expected?  My LV is just two SATA
hard disks that I put into a VG.  Stupid benchmarks with dd gives me a
raw read speed from the LV of about 60MiB/sec.

Any ideas on what's slowing down dump?


-- 
Ross Vandegrift
ross@kallisti.us

"The good Christian should beware of mathematicians, and all those who
make empty prophecies. The danger already exists that the mathematicians
have made a covenant with the devil to darken the spirit and to confine
man in the bonds of Hell."
	--St. Augustine, De Genesi ad Litteram, Book II, xviii, 37
