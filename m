Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D2F@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] ERROR creating snapshot: "Cannot allocate memory"
MIME-Version: 1.0
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
Date: Thu Dec  4 12:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

good luck getting help on snapshot.  i've posted a couple of times and
haven't gotten a response.  It's buggy and it corrupts data.  don't use it.

> -----Original Message-----
> From: Murthy Kambhampaty [mailto:murthy.kambhampaty@goeci.com]
> Sent: Wednesday, December 03, 2003 4:22 PM
> To: 'linux-lvm@sistina.com'
> Subject: [linux-lvm] ERROR creating snapshot: "Cannot allocate memory"
> 
> 
> While trying to snapshot a 335 GB LV (sdd1) on a machine with 
> 12 GB of RAM,
> and 67 GB of free space (sdc1), I get the following error:
> 
> lvcreate -s -l 21 -n snapshot /dev/VGdb01/LVdb
> lvcreate -- WARNING: the snapshot will be automatically 
> disabled once it
> gets full
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> "/dev/VGdb01/snapshot"
> lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
> "/dev/VGdb01/snapshot" in kernel
> 
> kernel is 2.4.21 (LVM 1.0.5+) with tools form
> ~redhat/contrib/lvm-1.0.5.src.rpm
> 
> Help
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
