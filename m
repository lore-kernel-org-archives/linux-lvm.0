Received: from fentible.pjc.net (vpn-4-31.stuttgart.redhat.com [10.32.4.31])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9K9aNM0000535
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 10:36:23 +0100
Received: from jeltz.pjc.net ([192.168.1.2])
	by fentible.pjc.net with esmtp (Exim 4.50) id 1ESWqV-00089p-Oh
	for linux-lvm@redhat.com; Thu, 20 Oct 2005 10:36:23 +0100
Message-ID: <43576516.2050606@redhat.com>
Date: Thu, 20 Oct 2005 10:36:22 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 problems!!
References: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA523@E2KMBX20VS.intranet.tim.it>
In-Reply-To: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA523@E2KMBX20VS.intranet.tim.it>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Caligiuri, Marco Ernesto wrote:
> Hi to all....,
> I'm Marco an italian user of RedHat Enterprise 4 , i have this kind of problems:
> I must install GFS on a disk partition, non root-partition, it is /dev/sdc1 . Before to make a GFS filesystem...i need to create a volume with LVM2.
> Id of partition is 8e (linux LVM)  but when i excute the command :
> pvcreate /dev/sdc or pvcreate /dev/sdc1 and any other command of lvm (vgcreate...lvcreate....) i receive always the same error:
>  
> connect() failed on local socket: Connection refused
>  Locking type 2 initialisation failed.
> 
> why?? Anyone can help me?

That indicates that you have cluster locking enabled but that the cluster LVM
daemon (clvmd) is not running.

-- 

patrick
