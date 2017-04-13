References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dd14a71d-3d35-6c75-698e-25cda1ff2d44@redhat.com>
Date: Thu, 13 Apr 2017 16:33:30 +0200
MIME-Version: 1.0
In-Reply-To: <7732cbebfc561db0d8749310f1ba010f@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 13.4.2017 v 15:52 Xen napsal(a):
> Stuart Gathman schreef op 13-04-2017 14:59:
> 
>> If you are going to keep snapshots around indefinitely, the thinpools
>> are probably the way to go.  (What happens when you fill up those?
>> Hopefully it "freezes" the pool rather than losing everything.)
> 
> My experience is that the system crashes.
> 
> I have not tested this with a snapshot but a general thin pool overflow 
> crashes the system.
> 
> Within half a minute, I think.
> 
> It is irrelevant whether the volumes had anything to do with the operation of 
> the system; ie. some mounted volumes that you write to that are in no other 
> use will crash the system.

Hello

Just let's repeat.

Full thin-pool is NOT in any way comparable to full filesystem.

Full filesystem has ALWAYS room for its metadata - it's not pretending it's 
bigger - it has 'finite' space and expect this space to just BE there.

Now when you have thin-pool - it cause quite a lot of trouble across number of 
layers.  There are solvable and being fixed.

But as the rule #1 still applies - do not run your thin-pool out of space - it 
will not always heal easily without losing date - there is not a simple 
straighforward way how to fix it (especially when user cannot ADD any new 
space he promised to have)

So monitoring pool and taking action ahead in time is always superior solution 
to any later  postmortem systems restores.


Regards

Zdenek
