From: Jens Wilke <jens.wilke@de.ibm.com>
Subject: Re: [linux-lvm] pvmove: moving a mirror logical volume not supported?
Date: Thu, 7 Sep 2006 17:35:43 +0200
References: <200609061114.13521.jens.wilke@de.ibm.com>
	<20060906161917.GP13859@agk.surrey.redhat.com>
In-Reply-To: <20060906161917.GP13859@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200609071735.43553.jens.wilke@de.ibm.com>
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
To: linux-lvm@redhat.com
Cc: Alasdair G Kergon <agk@redhat.com>

On Wednesday 06 September 2006 18:19, Alasdair G Kergon wrote:
> On Wed, Sep 06, 2006 at 11:14:13AM +0200, Jens Wilke wrote:
> > What is the reason for this?
>
> No code to do this has yet been written.
> There should be no fundamental problems with doing it.

pvmove does alreay something usefull if the skip on the mirror image
is removed.

Problem is, that this is not fool proof because the allocation contraints
for a mirror need to be checked to maintain redundance.

Looking on the allocator and looking on lvconvert, I think, doing it right
will be a very ambitious task, or is my thinking wrong?

Does it make sense to support "simple cases" of moving mirror images 
for the case that we have a source and a target specified and the 
target is empty or does not contain other images of the same mirror?

On the other hand it is also possible to do a 
lvconvert -m0; pvmove; lvconvert -m1

Best,

Jens
