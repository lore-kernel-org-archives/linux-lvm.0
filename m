Message-ID: <61750.64.34.222.41.1004631208.squirrel@webmail.tekmd.com>
From: <gdurand@tekmd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Badiane:  re: Problem
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
Date: Thu Nov  1 10:10:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have linked the libraries symbolically to /lib and the system booted and
checked the filesystems and I got errors.  Now I went in single user mode
and did an e2fsck on the /dev/vg0/var to begin with, and it came back with
64% non-contiguous inodes.  Now I haven't attempted anything similar with
the other filesystems.  Is this the proper way to check an lv filesystem?

Badiane
