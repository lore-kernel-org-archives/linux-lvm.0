From: Joel Acclassato <jacclassato@ingecom.net>
Message-Id: <1060174116.2426.13.camel@cupidon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate , partition format ?
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
Date: Wed Aug  6 07:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I have an existing partition 
/dev/sda1 mounted on /oracle
This partition is using 100% of its space. I added a new partition from
a new disk  /dev/sdc1

I know it is possible to resize partition using LVM. I have it installed
by default on my redhat 8.0 system. I can't re-format the partition
since i can't lose data? Is LVM the right tool for the job. Will
pvcreate erase some data ? Can't I keep the same name for mount
point(/oracle) once some extra space has been added ?

Joel Acclassato

ThanX   
