From: Rainer Krienke <krienke@uni-koblenz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200305301109.44884.krienke@uni-koblenz.de>
Subject: [linux-lvm] lvm in linux SAN enviroment ?
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
Date: Fri May 30 04:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello 

I recently posted about a problem with lvm (subject: Strange lvm on raid1 on 
top of multipath problem posted on 05/29/2003). Well in between  I could 
image what the reason might be but I'm quite unsure if my theory is correct:

There are three machines and three hardware raid 5 devices connected by two 
fibrechannel switches to each other, so each host can see each physical 
partiton on each of the three disk devices.

Now on each host I configured *one* md-raid1 device of cource based on 
different physical disks. There is one more layer of abstraction because the 
raid1 device is actually built upon a multipath md-device which uses 
different paths to the physical disks. This works just fine

Next I defined *one* physical volume on each of the three hosts on the md 
raid1 device and then defined a volumegroup consisting of one physical volume 
on each of the hosts. Finally I created several logical volumes. So on each 
host there is exactly one raid1 device used as physical lvm volume and one 
volumegroup with several volumes defined.

The question is if such a setup can work or is it bound to fail? 

Each host can because of the san network see each existings *physical* disk 
which might be a problem for vgscan, but on the other hand I created the 
*physical volumes on  raid1 md devices* and these devices are different on 
each host and each host has exactly one such md device defined (it  cannot 
"see" the other md devices on the other hosts allthough it can see the 
underlying physical partitions).

Can anyone please comment on this scenario? 
If this setup is simply "wrong", how could I tell vgscan which might to my 
knowledge be the problem, that it should not scan all physical devices it 
finds to avoid trouble.

Thanks in advance 
Rainer
-- 
---------------------------------------------------------------------------
Rainer Krienke, Universitaet Koblenz, Rechenzentrum
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
---------------------------------------------------------------------------
