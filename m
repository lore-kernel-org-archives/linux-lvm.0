From: <david@lownoisefloor.com>
Message-Id: <200211211621.PRZ90044@vmms4.verisignmail.com>
Subject: Re: [linux-lvm] Whole Disk Usage with LVM ...
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Nov 21 10:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Okay... some more info for what I am trying to 
accomplish.  
   1. I want to be able to stripe across disks of
      2,3,4,5,6 count.
   2. LVM gives me an error message when I try to
      stripe 6 disks.  I go to 4 and it's no problem.
   3. All disks are 8e (LVM) type and I use the entire
      disk. (I wont have issues with this its the best way).
   4. All disks are identical.

  If, from this email thread, I understand that I should
use partition tables... (which is just another setup step
and not a problem)... then will Stripping across 6 disks be
allowed with partition tables in use?

  I am using LVM 1.
  Does LVM 2 have different capabilities?

Dave G.
