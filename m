Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7B6NeEi013366
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 02:23:40 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7B6NYBE026452
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 02:23:34 -0400
Date: Fri, 11 Aug 2006 08:23:33 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] converting PV from md to non-md
Message-ID: <20060811062333.GA7440@percy.comedia.it>
References: <700E4C1906A0F34DB4C6ABC47B3E8FA5125E83@spcrokexcbe01.AD.SPIRENTCOM.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <700E4C1906A0F34DB4C6ABC47B3E8FA5125E83@spcrokexcbe01.AD.SPIRENTCOM.COM>
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

On Thu, Aug 10, 2006 at 02:50:09PM -0400, Musard, Kris wrote:
>Sorry,  I forgot to mention that I tried the zero-superblock option on
>the mdadm command and I still got the error that the /dev/hda3 was apart
>of a multiple device.  
>
this is strange...

if you are sure you will never use md anymore you can disable
md_component_detection in /etc/lvm/lvm.conf

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
