From: Joseph Kezar <jkezar@doc.state.vt.us>
Content-Transfer-Encoding: 7bit
Message-Id: <1037195718.3126.4.camel@corr11.doc.state.vt.us>
Mime-Version: 1.0
Subject: [linux-lvm] LVM ext3 and lvreduce
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
Date: Wed Nov 13 07:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM Sistina <linux-lvm@sistina.com>


I have LVM working, and I have created all my logical volumes for my
environment.  All of my logical volumes have been mkfs.ext3'd. 
Everything works, except for when I try to change the size with lvreduce
or lvextend.  These tools are happy to work, but when I remount my
logvols and type: mount I see that in fact the size that is reported to
the OS has not changed.

Is there any incompatabilities with LVM and Ext3?  
Is there a comparable tool for ext3 like e2fsadm?
Is it possible to resize an ext3 partition while it is online?
