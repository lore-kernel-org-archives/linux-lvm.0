Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9BHVBr14304
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 13:31:11 -0400
Received: from pm-mx2.noos.fr (pm-mx2.mgn.net [195.46.220.221])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9BHVAhd005082
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 13:31:10 -0400
Received: from [192.168.1.100] (d147.dhcp212-198-206.noos.fr [212.198.206.147])
	by pm-mx2.noos.fr (Postfix) with ESMTP id C8AC62717D
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 19:31:01 +0200 (MEST)
Date: Mon, 11 Oct 2004 19:32:37 +0200 (CEST)
From: Laurent Bloch <lbloch@noos.fr>
In-Reply-To: <416A9B4F.4010709@webhackande.se>
Message-ID: <Pine.LNX.4.60.0410111927570.24979@diotime.noos.fr>
References: <i1958990824043.04841@send4.inner-21cn.com>
	<416A90FE.5010504@m-cam.com> <416A9B4F.4010709@webhackande.se>
MIME-Version: 1.0
Subject: [linux-lvm] [Debian/Knoppix] LVM2 at boot time
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

My system is Knoppix 3.6 with 2.6.7 kernel and LVM2. My /home
and /usr/local file systems are on logical volumes. The lvm
script is in /etc/init.d, with a link in /etc/rcS.d, S26lvm
(mountall has a greater number). dm-mod is in /etc/modules

At boot time, everything stops; I have to type "modprobe dm-mod", 
<Ctrl-D>, and everything is OK. What's wrong with my boot config.?
Any hint appreciated.

-- 
Laurent Bloch -- lbloch@noos.fr -- http://laurent-bloch.org
