Message-Id: <45A6CC0F.A9E3.000B.0@novell.com>
Date: Thu, 11 Jan 2007 11:18:13 -0700
From: "Vijai Babu Madhavan" <mvijai@novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [RFC] Multiple Snapshots - Manageability problem
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
To: evms-devel@lists.sourceforge.net, dm-devel@redhat.com, linux-lvm@redhat.com

Hi,

The problem of DM snapshots with multiple snapshots have been discussed 
in the lists quiet a bit (Most recently @ 
https://www.redhat.com/archives/dm-devel/2006-October/msg00034.html).

We are currently in the process of building a DM snapshot target that scales 
well with many snapshots (so that the changed blocks don't get copied to each 
snapshot). In this process, I would also like to validate an assumption.

Today, when a single snapshot gets created, a new cow device of a given size 
is also created. IMO, there are two problems with this approach:

a) It is difficult to predict the size of the cow device, which requires a prediction 
of the number of writes would go into the origin volume during the snapshot 
life cycle. It is difficult to get this prediction right, as very high value reduces 
utilization and low value increases the chances of snapshot becoming full.

b) A new cow device needs to be created every time.

This really gets messy and creates a management problem once many 
snapshots of a given origin are created, and gets worse with multiple origins.

I am thinking, having a single device that would hold the cow blocks of any 
number of snapshots of a given origin (or more) would help solve this issue 
(Apart from this, having a single device helps share the cow blocks among 
snapshots very effectively in a variety of scenarios).

But, it does require that LVM and EVMS be changed to suit this model and 
also makes the snapshot target quiet complex.

I would like to receive some comments about what users, developers 
and others think about this.

Thanks,
Vijai
P.S:- BTW, apologizes for cross posting.
