Message-Id: <200211261131.gAQBVrFS005853@mailserver1.hrz.tu-darmstadt.de>
From: "Lars O. Grobe" <grobe@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM & GFS?
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
Date: Tue Nov 26 05:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

I am currently running a Linux fileserver with LVM 1.x, on kernel 2.4.19. The 
storage system consists of two scsi-raid5 (ibm serveraid 4m) both as physical 
volumes in a vg containing the volumes we share with netatalk and samba to 
our clients.

We are going to buy a new fileserver system now. As we need high-availability 
in future (the new server will hold all data of the faculty of architecture 
here), we are going to implement a failover-scenario with to nodes accessing 
a fibrechannel storage with redundant paths'. We didn't decide so for wether 
to use ibm, compaq ore fujitsu-siemens hardware, but all three offer these 
solutions.

As I know about gfs, I wonder how difficult it would be to add load balancing 
to this configuration by using gfs (so far we are on reiserfs 3.6x). Would we 
still need LVM (and is this a common combination)? I use LVM to give any 
department it's own volume, so that filesystem settings are made on a per 
department base, and I would like to keep this.

I am not sure wether this is OT here, but as I have been on this list for a 
while now, I would like to ask which contact could help me further. I will 
download the eval version of gfs5.1 now and install it on my laptop - one 
node ;-)

CU, Lars.
