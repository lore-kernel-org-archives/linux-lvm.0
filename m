Message-Id: <200109172228.SAA24083@erez.physics.lsa.umich.edu>
From: David Chin <dwchin@umich.edu>
In-reply-to: <3BA50657.3020600@st-peter.stw.uni-erlangen.de> 
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <200109160207.WAA10835@erez.physics.lsa.umich.edu> <20010916025223.1CA035E041@oscar.casa.dyndns.org> <200109161731.NAA11318@erez.physics.lsa.umich.edu> <200109161956.PAA11662@erez.physics.lsa.umich.edu> <3BA50657.3020600@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Date: Mon, 17 Sep 2001 18:28:31 -0400
Subject: [linux-lvm] Re: lvcreate dumping core with 2.4.10-pre9 (was pvcreate ...)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <3BA50657.3020600@st-peter.stw.uni-erlangen.de>, svetljo writes:
> Hi
> why don't you try pre 2.4.10-pre8 kernel, lvm is not ready for 
> 2.4.10-pre9 i think
> and have you tried compileing the tools with configure --enable-static_link

I just tried 2.4.10-pre8, but without the "enable-static_link" option.  
Still dumps core.  Has anyone on this list had success with lvm-1.0.1-rc2 
and a 2.4.10 kernel?

--Dave
