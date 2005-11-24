Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAOJG9V15890
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 14:16:09 -0500
Received: from pilchuck.reedmedia.net (pilchuck.reedmedia.net [209.166.74.74])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAOJG2bW010969
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 14:16:02 -0500
Date: Thu, 24 Nov 2005 11:16:01 -0800 (PST)
From: "Jeremy C. Reed" <reed@reedmedia.net>
Subject: Re: [linux-lvm] lvm corruption...
In-Reply-To: <Pine.NEB.4.62.0511231418090.11217@pilchuck.reedmedia.net>
Message-ID: <Pine.NEB.4.62.0511241114500.11217@pilchuck.reedmedia.net>
References: <Pine.NEB.4.62.0511231418090.11217@pilchuck.reedmedia.net>
MIME-Version: 1.0
Sender: "Jeremy C. Reed" <reed@pilchuck.reedmedia.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 23 Nov 2005, Jeremy C. Reed wrote:

> I saw your posting from March 2005 to linux-lvm list.
>
> You said you fixed your "Group descriptors corrupted" issue by accessing the 
> vg.
>
> How did you do this?
>
> I also am troubleshooting this LVM "Group descriptors corrupted" problem.
>
> It can boot rescue disk which has lvm tools. pvdisplay and lvscan appear to 
> work. I don't see any /dev/VolGroup00 directory though.

For the archives, I ended up solving it like the following:

Booted with rescue mode on fedora DVD. Do not select to find local
filesystems.

lvm vgscan -mknodes

lvm vgchange -ay

mkswap -c /dev/VolGroup00/LogVol01

fsck -a /dev/VolGroup00/LogVol00 # took a long time

Had to redo the swap, because Fedora boot hung at the enabling swap step.

I don't know how the corruption all happened in the first place.


  Jeremy C. Reed

  	  	 	 BSD News, BSD tutorials, BSD links
 	  	 	 http://www.bsdnewsletter.com/
