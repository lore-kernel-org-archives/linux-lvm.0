Message-ID: <1005754193.3bf29751422a4@imp.free.fr>
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Initrd, usefull ?
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
Date: Wed Nov 14 10:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello !
I plan to convert my Redhat 7.1 (ugraded from RH 4.2 through all versions 
in between....) to a root LVM.
I've got the latest LVM code, patched my 2.4.5 kernel, compiled without 
optimization to make lvcreate run ;-)
And wonder if I _really_ need an initrd, if I put the LVM code straight into the 
kernel.
I'm of course aware that I need a modified Lilo able to understant the LVM meta 
data, in order to find the kernel. But once this is done, what will the initrd 
be used for ?
Any information, hints, tips would be greatly appreciated !
