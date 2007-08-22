From: "Aubin, Jean-Francois" <jean-francois.aubin@cgi.com>
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Aug 2007 08:39:30 -0400
Message-Id: <1187786370.6318.14.camel@jfaubin.cnedom.cgi.com>
Mime-Version: 1.0
Subject: [linux-lvm] partitioning enterprise Linux 4 one or more partitions?
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
To: redhat-list@redhat.com, linux-lvm@redhat.com

Hi,

I have two server with 2 xeon cpu dual core, 8gb of memmory, 2 x 73gb in
raid hardware for mirror OS and a FC card Qlogic 4GB for connect many
Lun with a EMC san. It's for install Oracle Rac and redhat enterprise
Linux 4. My question is about partitioning Linux rhel4 os with a lvm
partition. Which is the best partitioning for my configuration? I have 3
choice: 
1-
RHEL 4 with ACL SELinux activated for more secure server, monitoring and
backuping this server. 
Swap partition with ext3
/boot with ext3 partition
/ Root in a LVM partition for the rest of system files

2-
RHEL 4 with no SELinux. 
/boot with ext3 partition
/ Root with ext3 partition
Swap partition in a LVM partition
/tmp in a LVM partition
/var in a LVM partition
/usr in a LVM partition
/home in a LVM partition
/opt in a LVM partition

3-
RHEL 4 with no SELinux. 
Swap partition with ext3 partition
/boot with ext3 partition
/ Root in a LVM partition
/home in a LVM partition

Thanks a lot in advance.
