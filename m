From: Kai Weber <lists@glorybox.de>
Message-ID: <20020705205324.GA1287@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Get rid of files of a non existing volume group
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
Date: Fri Jul  5 15:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have lost a hard disk (died). I had a volume group on this disk. Now I
have replaced the disk with a new one and wanted to create the old scheme
on this disk:

$ vgcreate datavg /dev/hdb1
vgcreate -- directory /dev/datavg already exists

As you can see the old /dev/datavg still exists on my root-partition. How
do I get rid of the old files? There is no VG datavg anymore, but I want to
have the name back.

Can I 'rm -rf /dev/datavg' the files? Or should I do a vgextend?

vgscan does not find the VG datavg anymore.

Kai
