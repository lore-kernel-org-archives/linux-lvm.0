Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9BEedr15201
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 10:40:39 -0400
Received: from kopparhuset.net (tp2internet.comun.org [212.75.75.26] (may be
	forged))
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9BEeRBf030024
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 10:40:33 -0400
Message-ID: <416A9B4F.4010709@webhackande.se>
Date: Mon, 11 Oct 2004 16:40:15 +0200
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to extend the file system online?
References: <i1958990824043.04841@send4.inner-21cn.com>
	<416A90FE.5010504@m-cam.com>
In-Reply-To: <416A90FE.5010504@m-cam.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Arshavir Grigorian wrote:

> You can try ReiserFS, which does allow to be resized while mounted. 

Additional comments:

ReiserFS 3 can be enlarged while mounted, but shrunk only when unmounted.

ReiserFS 4 can not yet be resized at all.

EXT2/3 can be enlarged online with a kernel patch and utils from
http://ext2resize.sourceforge.net/

XFS must be mounted while enlarging but can AFAIK not be shrunk, even 
off-line.

JFS must be mounted while enlarging but can not be shrunk, same as XFS.


Some more info is in the HOW-TO:
http://linux.co.uk/howtos/LVM-HOWTO/extendlv.html

and on Newsforge:
http://www.newsforge.com/os/03/10/07/2028234.shtml?tid=2&tid=82&tid=94

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
