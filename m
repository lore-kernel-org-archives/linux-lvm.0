Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7NHLdt8011938
	for <linux-lvm@redhat.com>; Wed, 23 Aug 2006 13:21:39 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7NHLXLF014062
	for <linux-lvm@redhat.com>; Wed, 23 Aug 2006 13:21:33 -0400
Date: Wed, 23 Aug 2006 19:21:32 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Partitioning remotely
Message-ID: <20060823172132.GG20318@percy.comedia.it>
References: <1156095294.3778.5.camel@dividebyzero.somewhere.localtld>
	<20060823142949.GA13859@agk.surrey.redhat.com>
	<7.0.1.0.2.20060823231439.020a6c48@myrealbox.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7.0.1.0.2.20060823231439.020a6c48@myrealbox.com>
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
To: linux-lvm@redhat.com

On Wed, Aug 23, 2006 at 11:18:03PM +0800, Jim Morgan wrote:
>I've been reading around the internet to see if I can resize the 
>partitions on the disk and/or in the LVM. There seems to be 
>conflicting advice on the subject and I don't want to make a move 
>before I'm absolutely sure. My choices seem to be

you are not using LVM

>d) You can't do anything. The partition you want to resize contains 
>the OS, and you need to umount it first.

d is the correct answer

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
