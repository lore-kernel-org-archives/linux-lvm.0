Message-ID: <3BA50657.3020600@st-peter.stw.uni-erlangen.de>
Date: Sun, 16 Sep 2001 22:06:47 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: lvcreate dumping core with 2.4.10-pre9 (was pvcreate ...)
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <200109160207.WAA10835@erez.physics.lsa.umich.edu> <20010916025223.1CA035E041@oscar.casa.dyndns.org> <200109161731.NAA11318@erez.physics.lsa.umich.edu> <200109161956.PAA11662@erez.physics.lsa.umich.edu>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi
why don't you try pre 2.4.10-pre8 kernel, lvm is not ready for 
2.4.10-pre9 i think
and have you tried compileing the tools with configure --enable-static_link

David Chin wrote:

>I just tried recompiled my kernel, and got the SCSI module loaded OK, so I have 
>my tape drive.
>
>With this new kernel, I again tried what I did in my first message.  No dice: 
>lvcreate dumps core.  Then, I deleted partitions on the disk and used ext2 
>primary partition instead of reiserfs.  Again, lvcreate dumps core.
>
>I've given up on LVM for now since the machine I'm playing with is in dire need.
>
>--Dave
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
