Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2FHStS26055
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 12:28:55 -0500
Received: from web80605.mail.yahoo.com (web80605.mail.yahoo.com [66.218.79.94])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2FHSr07017164
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 12:28:53 -0500
Message-ID: <20040315172847.42823.qmail@web80605.mail.yahoo.com>
Date: Mon, 15 Mar 2004 09:28:47 -0800 (PST)
From: David Minor <sus4@sbcglobal.net>
Subject: Re: [linux-lvm] VGs gone!
In-Reply-To: <1079369631.3143.10.camel@localhost.localdomain>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


--- Austin Gonyou <austin@coremetrics.com> wrote:
> You should not have recreated the lvmtab without
> backing up the total
> config, and restoring it after dding the partitions
> back. 
> 

The problem seems to have been that the mirrored
standard root partition didn't have a /proc mount
point.  Once I created the /proc directory and
manually mounted it I was able to run vgscan without
any problems.  Basically, I did:

# mkdir /proc
# mount -t proc proc /proc
# vgscan
# vgdisplay
# mount -a

and everything worked.

I hear you saying that there's a better way for me to
backup my system.  Right now I'm just rsync-ing from
each of the partitions on the primary drive to the
secondary drive.  Is there something I should do at
"mirror" time to facilitate the lvm setup coming up
better next time?
