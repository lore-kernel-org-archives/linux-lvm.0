Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j31NbsO10929
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 18:37:54 -0500
Received: from tone.orchestra.cse.unsw.EDU.AU
	(root@tone.orchestra.cse.unsw.EDU.AU [129.94.242.59])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j31NbplI018616
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 18:37:51 -0500
From: Neil Brown <neilb@cse.unsw.edu.au>
Date: Sat, 2 Apr 2005 09:37:07 +1000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16973.56100.413874.917027@cse.unsw.edu.au>
In-Reply-To: message from Antti Salmela on Friday April 1
References: <20050401143853.GA11763@asalmela.iki.fi>
Subject: [linux-lvm] Re: 2.6.11ac5 oops while reconstructing md array and
	moving volumegroup with pvmove
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
Content-Type: text/plain; charset="us-ascii"
To: Antti Salmela <asalmela@iki.fi>
Cc: linux-kernel@vger.kernel.org, linux-lvm@redhat.com

On Friday April 1, asalmela@iki.fi wrote:
> I had created a new raid1 array and started moving a volume group to it at the
> same time while it was reconstructing. Got this oops after several hours,

The subject says 'md array' but the Opps seems to say 'dm raid1
array'.

Could you please clarify exactly what the configuration is.

Thanks,
NeilBrown
