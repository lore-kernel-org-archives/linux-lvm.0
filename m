Subject: Re: [linux-lvm] bad vgexport/import
Mime-Version: 1.0 (Apple Message framework v548)
From: Tod Detre <tod@po.cwru.edu>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20021203120817.A25172@sistina.com>
Message-Id: <A199C2B4-0930-11D7-A568-000393B2C740@po.cwru.edu>
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
Date: Fri Dec  6 09:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> You don't know what exactly happend to your system any longer, do you ?
> Anyway, let's try to fix it.
>

actually, I did figure out what happened. The system was in a 
going-to-die
state so before I shut it down to fix it I decided to take out one of 
the
drives I wasn't using. So I did a vgreduce to remove the unused drive 
and
then did a vgchange/vgexport to export those disks. What I've found is 
that
when I did the reduce right before the export it never updated the 
remaining
disks about the removed one. So I fixed it by putting everything back 
the way
it was before then doing a vgcfgrestore to all the drives. reexported 
the vg
and once it was on the new setup I did the reduce. That seemed to work 
much
better.


Thanks for the help tho.

--
Tod Detre
Unix Technical Support
Case Western Reserve University
usworkstation@po.cwru.edu
216-368-3060
