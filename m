Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PDYNP9003884
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 09:34:23 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PDYLsA022350
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 09:34:22 -0400
Date: Thu, 25 May 2006 15:34:20 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Xraids and lvm
Message-ID: <20060525133420.GD3674@percy.comedia.it>
References: <C09B1F19.3972%schuemann@supportdept.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C09B1F19.3972%schuemann@supportdept.com>
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

On Thu, May 25, 2006 at 08:45:13AM -0400, Dustin Schuemann wrote:
>I have two xraid's that are on /dev/sda1 and /dev/sdb1. The device on
>/dev/sda1 is formatted ext3. What I would like to do is format /dev/sdb1 as
>ext3 and then create a volume out of the two that doesn't lose the data on
>/dev/sda1. Is this possible without reformatting and then creating the
>volume and copying back.

NO

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
