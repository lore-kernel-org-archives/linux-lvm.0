From: Matt Schillinger <mschilli@vss.fsi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1048865232.7751.52.camel@mosix>
Mime-Version: 1.0
Subject: [linux-lvm] snapshots on shared fibre
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
Date: Fri Mar 28 09:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have a Xiotech Magnitude raid, that uses fibre ports to connect to
multiple servers. 

We do NOT use a SAN filesystem. What I am wondering is, can I use
snapshots that are mounted on 1 machine, where the original filesystem
is mounted on another machine. both machines are connected to the raid
via fibre.

My hope is that, since it is a second filesystem, and is readonly, this
operation will not cause problems..

Is this correct?


-- 
Matt Schillinger

mschilli@vss.fsi.com
