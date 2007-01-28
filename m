Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0SA5Pvi010053
	for <linux-lvm@redhat.com>; Sun, 28 Jan 2007 05:05:25 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0SA5OuE010083
	for <linux-lvm@redhat.com>; Sun, 28 Jan 2007 05:05:24 -0500
Date: Sun, 28 Jan 2007 11:05:22 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] partition resizing
Message-ID: <20070128100522.GB21574@percy.comedia.it>
References: <45B9C8BF.3080101@ulb.ac.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45B9C8BF.3080101@ulb.ac.be>
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

On Fri, Jan 26, 2007 at 10:24:15AM +0100, Julien Cigar wrote:
>What I want to do is to reduce /home from 50G and extend /srv of 50G.
>Are the following operations safe for this ? :
>
>#> umount /srv
>#> umount /home
>#> resize2fs /dev/mapper/vg0-home 50G
>#> lvreduce -L-50G /dev/mapper/vg0-home
>#> lvextend -L+50G /dev/mapper/vg0-srv
>#> resize2fs /dev/mapper/vg0-srv
>#> mount /home
>#> mount /srv

assuming that /dev/mapper/vg0-home is 100G yes, else the option to
resize2fs should be the size of /dev/mapper/vg0-home minus 50G.
and you would probably have to fsck vg0-home and vg0-srv after
unmounting.

>Another question I wondered is : what's the difference between 
>lvreduce/lvextend and lvresize ?

i think these are 2 interfaces to the same funcrionality.
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
