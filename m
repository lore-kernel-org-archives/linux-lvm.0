From: Frank Joerdens <frank@joerdens.de>
Subject: Re: [linux-lvm] pvmove doesn't work (with either 1.0.5 or 1.1-rc2)
Message-ID: <20020901172740.A19010@superfly.archi-me-des.de>
References: <20020831201710.B17207@superfly.archi-me-des.de> <20020831212421.C17207@superfly.archi-me-des.de> <3D712013.9070606@ednet.ns.ca> <20020831221652.D17207@superfly.archi-me-des.de> <20020831223013.E17207@superfly.archi-me-des.de>
Mime-Version: 1.0
In-Reply-To: <20020831223013.E17207@superfly.archi-me-des.de>; from frank@joerdens.de on Sat, Aug 31, 2002 at 10:30:13PM +0200
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
Date: Sun Sep  1 10:38:31 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I just moved another lot of ~30 GB about via pvmove, that was without a
problem, using 1.0.5 . . . so I guess once you've screwed up a volume
group using old lvm utils, it's broken - I was using those that ship
with SuSE 7.2:

limedes:~ # rpm -qa|grep lvm
lvm-0.9.1_beta7-25

The data seem to be OK though, which is kind of surprising, seeing that
pvmove now finds something consistently wrong with this volume group.

Regards, Frank
