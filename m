From: richard turner <rturner@san.rr.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1041637712.1854.10.camel@rich-laptop>
Mime-Version: 1.0
Subject: [linux-lvm] pvcreate error
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
Date: Fri Jan  3 17:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

i am trying to create a pv on an entire disk /dev/hdb with the following
command:
pvcreate -ff -y /dev/hdb

it returns the following error:
pvcreate --device "/dev/hdb" has a partition table

fdisk, sfdisk and all other methods prove there is not a partition table
on /dev/hdb

using lvm 1.0.1 with mandrake8.2 kernel 2.4.18-6

what is causing pvcreate to think i have a partition table on /dev/hdb?
