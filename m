Message-ID: <3C167AD5.60700@chaven.com>
From: List User <lists@chaven.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Creating LV's with _very large_ PV's
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
Date: Tue Dec 11 15:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I am running Mandrake 8.1 here and am looking to create a very large array.
I have Promise UltraTrak 100 TX8 external arrays which format each out to
approx 670GB as one large volume.

Initially I wanted to add just this one to a volume group but couldn't. 
 Said something
to the regards of physical volume is too large.  It spewed something 
that looked like
256GB is the largest PV that it can handle?!?

Anyway, the real goal is to have three of these arrays (670*3) each 
array will be
one physical volume.  The three together would be added to create an approx
2TB array.

Is this possible?  Feasible?  

Or do I have to carve each tower into multiple parts which I don't 
really want to do.


Steve
