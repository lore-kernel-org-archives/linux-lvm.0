Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i18BTra18561
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 06:29:53 -0500
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1xn07tu7w8.fsf@kth.se>
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm]Re: corrupt /dev/lvm - bizzare properties
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
Date: Sun Feb  8 06:29:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Chris Doherty <chris.doherty@adelaide.edu.au> writes:

> I've been using LVM happily for several months without any
> complaints or problems.  This morning that all changed.  The boot
> process stopped cold when lvm-mod (w|c)ouldn't load.  My first
> impulse was to fsck, which I did as a matter of course.  Eventually,
> I stumbled across what appears to be the source of my problem:
>
> root@connect4:~# ls -la /dev/lvm
> ?---rws-w-  8306 840966198 976250230 875573298 Sep 24  2004 /dev/lvm

Your filesystem seems to have taken some heavy blows.  You should fsck
it properly.  You might need the -f flag to fsck to force a complete
check if filesystem is marked clean.

-- 
M�ns Rullg�rd
mru@kth.se
