From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Re: lvcreate dumping core with 2.4.10-pre9 (was pvcreate ...)
Date: Mon, 17 Sep 2001 20:26:32 -0400
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <3BA50657.3020600@st-peter.stw.uni-erlangen.de> <200109172228.SAA24083@erez.physics.lsa.umich.edu>
In-Reply-To: <200109172228.SAA24083@erez.physics.lsa.umich.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010918002633.7B46869D@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, David Chin <dwchin@umich.edu>

On September 17, 2001 06:28 pm, David Chin wrote:
> In message <3BA50657.3020600@st-peter.stw.uni-erlangen.de>, svetljo writes:
> > Hi
> > why don't you try pre 2.4.10-pre8 kernel, lvm is not ready for
> > 2.4.10-pre9 i think
> > and have you tried compileing the tools with configure
> > --enable-static_link
>
> I just tried 2.4.10-pre8, but without the "enable-static_link" option.
> Still dumps core.  Has anyone on this list had success with lvm-1.0.1-rc2
> and a 2.4.10 kernel?

Seems to work fine here.  2.4.10-pre10 / lvm-1.01-rc2 with the generated lvm 
patch updated as explained in a previous message.  I have use lvcreate but only 
to make snapshots and its working correctly.

Ed Tomlinson
