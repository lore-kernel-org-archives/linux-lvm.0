From: Anders Widman <andewid@tnonline.net>
Message-Id: <18044083656.20020409231800@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] multiple volumes..
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
Date: Tue Apr  9 16:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have a problem which I want to solve as efficiently as possible.

The problem is that I have 13 drives os various sizes (30-120GB) which
I want to combine into one (or a few) logical volumes with redundancy
if one drive would fail.

How would the smartest layout be? I was thinking about multiple
partiontions and then combine them into several RAID 5 chains, and
then use LVM to manage the logical volumes.

There is an expamle of my ideas at http://www.tnonline.net/raid-lvm.png
As you can see there are 8 chains and about 50 GB unallocated data in
this example. Can I minimize the loss even better?

Any help or insight in this would be greatly appreciaded

//Anders
