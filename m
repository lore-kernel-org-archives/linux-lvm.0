Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HIgs3P020663
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 14:42:54 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HIgXCI024120
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 14:42:34 -0400
Date: Wed, 17 May 2006 20:42:32 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problem with creation of dev entries on SL (RHEL) 4
Message-ID: <20060517184232.GC16774@percy.comedia.it>
References: <446B0DE9.6010004@cs.tcd.ie>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <446B0DE9.6010004@cs.tcd.ie>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Stephen.Childs@cs.tcd.ie, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 17, 2006 at 12:50:01PM +0100, Stephen Childs wrote:
>When I create a new LVM volume on Scientific Linux 4 (RHEL4-compatible), a 
>new entry isn't created in /dev, meaning that I can't access the volume 
>although it exists.
>
>Creation succeeds:
>
>[root@tg23 mapper]# /usr/sbin//lvcreate -s '-L1024M' -n 
>'/dev/xenvg/gridmon_gridmon023__1147860249' /dev/xenvg/gridmon
>   Logical volume "gridmon_gridmon023__1147860249" created
>
>Mount fails:
....
>Any ideas?
>
Weird, but your command line is also weird could you try without
prefixing the vg name to -the -n parameter?

lvcreate -s -L1024M -n gridmon_gridmon023__1147860249 /dev/xenvg/gridmon

else look into the log section of /etc/lvm.conf and provide some logs.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
